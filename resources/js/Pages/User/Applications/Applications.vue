<template>
  <Main>
    <div class="iq-card">
      <div class="iq-card-body">
        <div class="d-flex justify-content-between mt-2">
          <h5>Loans Application</h5>
          <div class="user-list-files">
            <a class="iq-bg-primary" href="javascript:void();"> Print </a>

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
        <div class="table-responsive mt-3">
          <table class="table mb-0 table-borderless">
            <thead>
              <tr>
                <th scope="col">Loan</th>
                <th scope="col">Application Date</th>
                <th scope="col">Interest</th>
                <th scope="col">Pay Frequency</th>
                <th scope="col">Amount</th>
                <th scope="col">Service Fee</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(obj, index) in applications.data" :key="index">
                <td>{{ obj.loanType.name }}</td>
                <td>{{ obj.application_date }}</td>
                <td>{{ obj.interest_rate }}</td>
                <td>{{ obj.paymentFrequency.name }}</td>
                <td>{{ obj.amount_applied }}</td>
                <td>{{ obj.service_fee }}</td>
                <td>
                  <span
                    class="badge bg-success text-white dark-icon-light iq-bg-primary"
                    v-if="obj.approved_on != null"
                    >Approved</span
                  >
                  <span
                    class="badge bg-danger text-white dark-icon-light iq-bg-primary"
                    v-else-if="obj.rejected_on != null"
                    >Rejected</span
                  >
                  <span
                    class="badge bg-dark text-white dark-icon-light iq-bg-primary"
                    v-else
                    >Pending</span
                  >
                </td>
                <td>
                  <div class="flex align-items-center list-user-action">
                    <Link
                      class="iq-bg-primary"
                      data-placement="top"
                      :href="route('u.loanApplications.edit', obj.id)"
                      ><i class="ri-pencil-line"></i
                    ></Link>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <Confirm :url="url" />
    <ApplicationForm
      :form="form"
      :action="action"
      :item="item"
      :memberDetails="member"
    />
  </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import ApplicationForm from "./ApplicationForm.vue";
import { ref } from "vue";

const props = defineProps({
  member: Object,
  applications: Object,
});

let url = ref();
let action = ref("Create");

let item = ref(0);

const form = ref(useForm({}));

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    member: props.member.id,
    branch_id: props.member.branch_id,
    loan_officer: "",
    loan_type: "",
    reduce_principal_early: "",
    amount_applied: "",
    periodic_payment_amount: "",
    application_date: "",
    disburse_method: "",
    disburse_note: "",
    mpesa_number: "",
    mpesa_first_name: "",
    mpesa_middle_name: "",
    mpesa_last_name: "",
    cheque_number: "",
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    witness_type: "",
    witness_first_name: "",
    witness_last_name: "",
    witness_country: "",
    witness_county: "",
    witness_city: "",
    witness_national_id: "",
    witness_phone: "",
    witness_email: "",
    witness_postal_address: "",
    witness_residential_address: "",
    witnessed_by: "",
    reviewed_by: "",
    reviewed_on: "",
    approved_on: "",
    rejected_on: "",
    rejection_notes: "",
    attach_application_form: "",
  });
};

const getObject = (obj) => {
  item.value = obj.id;
  action.value = "Edit";
  form.value = useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    loan_officer: "",
    loan_type: "",
    reduce_principal_early: "",
    amount_applied: "",
    periodic_payment_amount: "",
    application_date: "",
    disburse_method: "",
    disburse_note: "",
    mpesa_number: "",
    mpesa_first_name: "",
    mpesa_middle_name: "",
    mpesa_last_name: "",
    cheque_number: "",
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    witness_type: "",
    witness_first_name: "",
    witness_last_name: "",
    witness_country: "",
    witness_county: "",
    witness_city: "",
    witness_national_id: "",
    witness_phone: "",
    witness_email: "",
    witness_postal_address: "",
    witness_residential_address: "",
    witnessed_by: "",
    reviewed_by: "",
    reviewed_on: "",
    approved_on: "",
    rejected_on: "",
    rejection_notes: "",
    attach_application_form: "",
  });
};
</script>