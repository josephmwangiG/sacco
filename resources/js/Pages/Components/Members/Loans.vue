<template>
  <EditMember :member="member" :title="'Member loans'">
    <div class="col-sm-12 mb-3">
      <div class="user-list-files d-flex float-right">
        <a class="iq-bg-primary" href="javascript:void();"> Print </a>
        <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
        <a class="iq-bg-primary" href="javascript:void();"> Pdf </a>
        <a
          class="iq-bg-primary"
          data-toggle="modal"
          data-target="#formModal"
          @click="create"
          href="javascript:void();"
        >
          New
        </a>
      </div>
    </div>
    <br />
    <div class="table-responsive">
      <table class="table mb-0 table-borderless">
        <thead>
          <tr>
            <th scope="col">Asset No.</th>
            <th scope="col">Title</th>
            <th scope="col">Value</th>
            <th scope="col">Val Date</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in loans" :key="index">
            <td>{{ obj.asset_number }}</td>
            <td>{{ obj.title }}</td>
            <td>{{ obj.valuation_amount }}</td>
            <td>{{ obj.valuation_date }}</td>
            <td>
              <div class="badge badge-pill badge-success">Active</div>
            </td>
            <td>
              <div class="flex align-items-center list-user-action">
                <a
                  class="iq-bg-primary"
                  data-placement="top"
                  @click="getObject(obj)"
                  data-toggle="modal"
                  data-target="#formModal"
                  href="javascript:void();"
                  ><i class="ri-pencil-line"></i
                ></a>
                <a
                  class="iq-bg-primary"
                  data-toggle="modal"
                  data-placement="top"
                  @click="url = route('loans.destroy', obj.id)"
                  data-original-title="Delete"
                  href="#confirm"
                  ><i class="ri-delete-bin-line"></i
                ></a>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <AssetForm :form="form" :action="action" :item="item" />

    <Confirm :url="url" />
  </EditMember>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import EditMember from "./EditMember.vue";
import AssetForm from "./AssetForm.vue";
import { ref } from "vue";

const props = defineProps({
  member: Object,
  loans: Object,
});

let url = ref();
let action = ref("Create");

let item = ref(0);

const form = ref(
  useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: "",
    title: "",
    description: "",
    valuation_date: "",
    valued_by: "",
    valuer_phone: "",
    valuation_amount: "",
    location: "",
    registration_number: "",
    registered_to: "",
    condition: "",
    notes: "",
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: "",
    title: "",
    description: "",
    valuation_date: "",
    valued_by: "",
    valuer_phone: "",
    valuation_amount: "",
    location: "",
    registration_number: "",
    registered_to: "",
    condition: "",
    notes: "",
  });
};

const getObject = (obj) => {
  item.value = obj.id;
  action.value = "Edit";
  form.value = useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: obj.asset_number,
    title: obj.title,
    description: obj.description,
    valuation_date: obj.valuation_date,
    valued_by: obj.valued_by,
    valuer_phone: obj.valuer_phone,
    valuation_amount: obj.valuation_amount,
    location: obj.location,
    registration_number: obj.registration_number,
    registered_to: obj.asset_number,
    condition: obj.asset_number,
    notes: obj.asset_number,
  });
};
</script>