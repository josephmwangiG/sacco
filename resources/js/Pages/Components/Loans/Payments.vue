<template>
  <EditApplication :id="id" :active="'payments'">
    <div class="row justify-content-between">
      <div class="col-sm-5 col-md-4">
        <h4 class="card-title">payments</h4>
      </div>
      <div class="col-sm-7 col-md-6">
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
            <th>Loan No.</th>
            <th>Member</th>
            <th>Ac Number</th>
            <th>Phone</th>
            <th>Method</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in payments" :key="index">
            <td>{{ obj.loan.loan_reference_number }}</td>
            <td>{{ obj.member.first_name }} {{ obj.member.last_name }}</td>
            <td>{{ obj.member.account.account_number }}</td>
            <td>{{ obj.member.phone }}</td>
            <td>{{ obj.method_id }}</td>
            <td>{{ obj.amount }}</td>
            <td>
              <span class="badge dark-icon-light iq-bg-primary">Active</span>
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
                  @click="url = route('activeLoans.delete.payments', obj.id)"
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
    <Confirm :url="url" />
    <PaymentForm
      :hasMember="true"
      :memberDetails="member"
      :form="form"
      :action="action"
      :item="item"
    />
  </EditApplication>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import PaymentForm from "./PaymentForm.vue";
import EditApplication from "./EditApplication.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  payments: Object,
  member: Object,
  activeLoan: Object,
  id: Number,
});

let url = ref("");

let action = ref("Add");

let item = ref(0);

let form = ref(
  useForm({
    loan_id: props.activeLoan.id,
    member: props.member.id,
    amount: "",
    payment_method: "",
    payment_date: "",
    description: "",
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    cheque_number: "",
  })
);

const create = () => {
  item.value = 0;
  action.value = "Add";
  form.value = useForm({
    loan_id: props.activeLoan.id,
    member: props.member.id,
    amount: "",
    payment_method: "",
    payment_date: "",
    description: "",
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    cheque_number: "",
  });
};

const getObject = (obj) => {
  action.value = "Edit";
  item.value = obj.id;
  form.value = useForm({
    loan_id: props.activeLoan.id,
    member: obj.member_id,
    amount: obj.amount,
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    payment_method: obj.method_id,
    payment_date: obj.payment_date,
    description: obj.notes,
    bank_name: obj.bank_name,
    bank_branch: obj.bank_branch,
    cheque_date: obj.cheque_date,
    cheque_number: obj.cheque_number,
  });
};
</script>