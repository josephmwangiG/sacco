<template>
  <EditApplication :id="id" :active="'guarantors'">
    <div class="row justify-content-between">
      <div class="col-sm-5 col-md-4">
        <h4 class="card-title">Guarantors</h4>
      </div>
      <div class="col-sm-7 col-md-6">
        <div class="user-list-files d-flex float-right">
          <a class="iq-bg-primary" href="javascript:void();"> Print </a>
          <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
          <a class="iq-bg-primary" href="javascript:void();"> Pdf </a>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table
        id="user-list-table"
        class="table table-striped table-borderless mt-2"
        role="grid"
        aria-describedby="user-list-page-info"
      >
        <thead>
          <tr>
            <th>Member</th>
            <th>Ac Number</th>
            <th>Amount</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Status</th>
            <th>Join Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in guarantors" :key="index">
            <td>{{ obj.member.first_name }} {{ obj.member.last_name }}</td>
            <td>{{ obj.member.account.account_number }}</td>
            <td>{{ obj.guarantee_amount }}</td>
            <td>{{ obj.member.residential_address }}</td>
            <td>{{ obj.member.phone }}</td>
            <td>
              <span class="badge dark-icon-light iq-bg-primary">Active</span>
            </td>
            <td>{{ obj.member.date_became_member.substring(0, 10) }}</td>
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
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <Confirm :url="url" />
    <GuarantorsForm :form="gform" :action="action" :item="item" :id="id" />
  </EditApplication>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import GuarantorsForm from "./GuarantorsForm.vue";
import EditApplication from "./EditApplication.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  guarantors: Object,
  id: Number,
});

const members = usePage().props.value.members;

let url = ref("");

let action = ref("Create");

let item = ref(0);

let gform = ref(
  useForm({
    member: "",
    notes: "",
    guarantee_amount: "",
    id_number: "",
    account_number: "",
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  gform.value = useForm({
    member: "",
    notes: "",
    guarantee_amount: "",
    id_number: "",
    account_number: "",
  });
};

const getObject = (obj) => {
  action.value = "Edit";
  item.value = obj.id;

  members.forEach((item) => {
    if (item.id == obj.member_id) {
      gform.value = useForm({
        id_number: item.id_number,
        account_number: item.account.account_number,
        member: obj.member_id,
        notes: obj.notes,
        guarantee_amount: obj.guarantee_amount,
      });
    }
  });
};
</script>