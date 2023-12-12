<template>
  <EditMember :member="member" :title="'Member Loan Applications'">
    <div class="col-sm-12 mb-3">
      <div class="user-list-files d-flex float-right mb-3">
        <a class="iq-bg-primary" href="javascript:void();"> Print </a>

        <a class="iq-bg-primary" data-toggle="modal" data-target="#formModal" @click="create" href="javascript:void();">
          New
        </a>
      </div>
    </div>
    <br />
    <div class="table-responsive">
      <table class="table mb-0 table-borderless">
        <thead>
          <tr>
            <th scope="col">Loan</th>
            <th scope="col">Date Applied</th>
            <th scope="col">Amount</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in applications" :key="index">
            <td>{{ obj.loan_type.name }}</td>
            <td>{{ formatDate(obj.application_date) }}</td>
            <td>{{ Number(obj.amount_applied).toLocaleString('en-US') }}</td>
            <td>
              <div class="flex align-items-center list-user-action">
                <a class="iq-bg-primary" data-placement="top" @click="getObject(obj)" data-toggle="modal"
                  data-target="#formModal" href="javascript:void();"><i class="ri-pencil-line"></i></a>
                <a class="iq-bg-primary" data-toggle="modal" data-placement="top"
                  @click="url = route('applications.destroy', obj.id)" data-original-title="Delete" href="#confirm"><i
                    class="ri-delete-bin-line"></i></a>
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
import {formatDate} from "@/composables/utils.js"

const props = defineProps({
  member: Object,
  applications: Object,
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