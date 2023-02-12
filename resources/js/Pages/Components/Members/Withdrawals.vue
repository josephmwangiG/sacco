<template>
  <EditMember :member="member" :title="'Member Withdrawals'">
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
      <table
        id="user-list-table"
        class="table table-striped table-borderless"
        role="grid"
        aria-describedby="user-list-page-info"
      >
        <thead>
          <tr>
            <th>Receipt</th>
            <th>Withdrawal Date</th>
            <th>Method</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in withdrawals" :key="index">
            <td>{{ obj.withdrawal_number }}</td>
            <td>{{ obj.withdrawal_date }}</td>
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
                  @click="getItem(obj)"
                  data-toggle="modal"
                  data-target="#formModal"
                  href="javascript:void();"
                  ><i class="ri-pencil-line"></i
                ></a>
                <a
                  class="iq-bg-primary"
                  data-toggle="modal"
                  data-placement="top"
                  @click="url = route('withdrawals.destroy', obj.id)"
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

    <WithdrawalForm
      :hasMember="true"
      :memberDetails="member"
      :form="form"
      :action="action"
      :item="item"
    />

    <Confirm :url="url" />
  </EditMember>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import EditMember from "./EditMember.vue";
import WithdrawalForm from "../Withdrawals/WithdrawalForm.vue";
import { ref } from "vue";

const props = defineProps({
  withdrawals: Object,
  member: Object,
});
let url = ref("");

let action = ref("Add");

let item = ref(0);

let form = ref(
  useForm({
    member: props.member.id,
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    amount: "",
    payment_method: "",
    withdrawal_date: "",
    description: "",
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
    member: props.member.id,
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    amount: "",
    payment_method: "",
    withdrawal_date: "",
    description: "",
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    cheque_number: "",
  });
};

const getItem = (obj) => {
  action.value = "Edit";
  item.value = obj.id;
  members.filter((item) => {
    if (obj.member_id == item.id && obj.id) {
      return item;
    }
  });
  form.value = useForm({
    member: obj.member_id,
    id_number: props.member.id_number,
    account_number: props.member.account.account_number,
    amount: obj.amount,
    payment_method: obj.method_id,
    withdrawal_date: obj.withdrawal_date,
    description: obj.notes,
    bank_name: obj.bank_name,
    bank_branch: obj.bank_branch,
    cheque_date: obj.cheque_date,
    cheque_number: obj.cheque_number,
  });
};

// watch(
//   search,
//   debounce((value) => {
//     Inertia.get(
//       route("withdrawals.index"),
//       { search: search.value },
//       { preserveState: true, replace: true }
//     );
//   }, 500)
// );
</script>