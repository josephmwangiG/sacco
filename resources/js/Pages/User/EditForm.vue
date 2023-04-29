<template>
  <EditApplication :id="activeLoan.id" :active="'details'">
    <form @submit.prevent="saveForm()">
      <div class="row mt-3">
        <div class="col-12 mt-3 text-primary">
          <h6>Personal Information</h6>
          <hr />
        </div>
        <div class="form-group col-md-4">
          <label for="member">Member:</label>
          <select
            required
            @change="selectMember($event)"
            v-model="form.member"
            class="form-control"
            id="member"
          >
            <option value="" selected>Select Member</option>
            <option v-for="(i, index) in members" :value="i.id" :key="index">
              {{ i.first_name }} {{ i.last_name }}
            </option>
          </select>
          <div class="text-danger" v-if="form.errors.member">
            <small>{{ form.errors.member }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="account_number">Account No:</label>
          <input
            type="text"
            v-model="member.account"
            class="form-control"
            required
            id="account_number"
            placeholder="Account Number"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="id_number">National Id:</label>
          <input
            type="text"
            v-model="member.id_number"
            class="form-control"
            required
            id="id_number"
            placeholder="National Id"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="account_number">Address:</label>
          <input
            type="text"
            v-model="member.residential_address"
            class="form-control"
            required
            id="account_number"
            placeholder="Residential Address"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="email">Email:</label>
          <input
            type="text"
            v-model="member.email"
            class="form-control"
            required
            id="email"
            placeholder="Email"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="email">Phone:</label>
          <input
            type="text"
            v-model="member.phone"
            class="form-control"
            required
            id="email"
            placeholder="Phone Number"
          />
        </div>

        <div class="form-group col-md-4">
          <label for="date_became_member"> Date of Joining:</label>
          <input
            type="date"
            class="form-control"
            id="date_became_member"
            v-model="member.date_became_member"
          />
        </div>

        <div class="col-12 mt-3 text-primary">
          <h6>Loan Details</h6>
          <hr />
        </div>

        <div class="form-group col-md-4">
          <label for="loan">Loan:</label>
          <select
            @change="selectLoan($event)"
            required
            v-model="form.loan_type"
            class="form-control"
            id="loan"
          >
            <option value="" selected>Select Loan</option>
            <option v-for="(i, index) in loanTypes" :value="i.id" :key="index">
              {{ i.name }}
            </option>
          </select>
          <div class="text-danger" v-if="form.errors.loan">
            <small>{{ form.errors.loan }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="interest_type">Interest Type:</label>
          <input
            type="text"
            class="form-control"
            required
            v-model="loan.interest_type"
            id="interest_type"
            placeholder="Interest Type"
          />
          <div class="text-danger" v-if="form.errors.interest_type">
            <small>{{ form.errors.interest_type }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="interest">Interest:</label>
          <input
            type="text"
            class="form-control"
            required
            v-model="loan.interest"
            id="interest"
            placeholder="interest"
          />
          <div class="text-danger" v-if="form.errors.interest">
            <small>{{ form.errors.Interest }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="service_fee">Service Fee:</label>
          <input
            type="text"
            class="form-control"
            id="service_fee"
            v-model="loan.service_fee"
            placeholder="Service Fee"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="amount_applied">Amount Applied:</label>
          <input
            type="text"
            class="form-control"
            required
            v-model="form.amount_applied"
            id="amount_applied"
            placeholder="Amount Applied"
          />
          <div class="text-danger" v-if="form.errors.amount_applied">
            <small>{{ form.errors.amount_applied }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="application_date">Application Date:</label>
          <input
            type="date"
            class="form-control"
            required
            v-model="form.application_date"
            id="application_date"
            placeholder="application_date"
          />
          <div class="text-danger" v-if="form.errors.application_date">
            <small>{{ form.errors.application_date }}</small>
          </div>
        </div>
        <div class="col-12 mt-3 text-primary">
          <h6>Repayment &amp; Penalty</h6>
          <hr />
        </div>

        <div class="form-group col-md-4">
          <label for="rpay">Repayment Period (Months):</label>
          <input
            type="text"
            class="form-control"
            id="rpay"
            v-model="loan.repayment_period"
            placeholder="Repayment Period"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="payment_frequency">Payment Frequency:</label>
          <input
            type="text"
            class="form-control"
            id="payment_frequency"
            v-model="loan.payment_frequency"
            placeholder="Payment Frequency"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="penalty"> Penalty Type:</label>
          <input
            type="text"
            class="form-control"
            id="penalty"
            v-model="loan.penalty"
            placeholder=" Penalty Type"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="pfre">Penalty Frequency:</label>
          <input
            type="text"
            class="form-control"
            id="pfre"
            v-model="loan.penalty_frequency"
            placeholder="Penalty Frequency"
          />
        </div>
        <div class="form-group col-md-4">
          <label for="p_value"> Penalty Amount:</label>
          <input
            type="text"
            class="form-control"
            id="p_value"
            v-model="loan.p_value"
            placeholder="Penalty Amount"
          />
        </div>
      </div>
    </form>
  </EditApplication>
</template>

<script setup>
import { usePage, useForm } from "@inertiajs/inertia-vue3";
import { ref, onMounted } from "vue";
import EditApplication from "./EditApplication.vue";

const props = defineProps({
  activeLoan: Object,
});

let form = useForm({
  id: props.activeLoan.id,
  member: props.activeLoan.member_id,
  guarantors: props.activeLoan.guarantors,
  member_id: props.activeLoan.member_id,
  loan_officer: props.activeLoan.loan_officer_id,
  loan_type: props.activeLoan.loan_type_id,
  reduce_principal_early: props.activeLoan.reduce_principal_early,
  amount_applied: props.activeLoan.amount_applied,
  interest_rate: props.activeLoan.interest_rate,
  periodic_payment_amount: props.activeLoan.periodic_payment_amount,
  application_date: props.activeLoan.application_date,
  disburse_method: props.activeLoan.disburse_method_id,
  disburse_note: props.activeLoan.disburse_note,
  mpesa_number: props.activeLoan.mpesa_number,
  mpesa_first_name: props.activeLoan.mpesa_first_name,
  mpesa_middle_name: props.activeLoan.mpesa_middle_name,
  mpesa_last_name: props.activeLoan.mpesa_last_name,
  cheque_number: props.activeLoan.cheque_number,
  bank_name: props.activeLoan.bank_name,
  bank_branch: props.activeLoan.bank_branch,
  cheque_date: props.activeLoan.cheque_date,
  witness_type: props.activeLoan.witness_type_id,
  witness_first_name: props.activeLoan.witness_first_name,
  witness_last_name: props.activeLoan.witness_last_name,
  witness_country: props.activeLoan.witness_country,
  witness_county: props.activeLoan.witness_county,
  witness_city: props.activeLoan.witness_city,
  witness_national_id: props.activeLoan.witness_national_id,
  witness_phone: props.activeLoan.witness_phone,
  witness_email: props.activeLoan.witness_email,
  witness_postal_address: props.activeLoan.witness_postal_address,
  witness_residential_address: props.activeLoan.witness_residential_address,
  witnessed_by: props.activeLoan.witnessed_by_user_id,
  reviewed_by: props.activeLoan.reviewed_by_user_id,
  reviewed_on: props.activeLoan.reviewed_on,
  approved_on: props.activeLoan.approved_on,
  rejected_on: props.activeLoan.rejected_on,
  rejection_notes: props.activeLoan.rejection_notes,
  repayment_period: props.activeLoan.repayment_period,
});
const members = usePage().props.value.members;

const member = ref({
  account: "",
  id_number: "",
  residential_address: "",
  email: "",
  phone: "",
  date_became_member: "",
});
const loanTypes = usePage().props.value.loanTypes;

const loan = ref({
  interest: "",
  penalty: "",
  p_value: "",
  service_fee: "",
  repayment_period: "",
  payment_frequency: "",
  penalty_frequency: "",
  interest_type: "",
});

const selectMember = (event) => {
  members.forEach((element) => {
    if (element.id == event.target.value) {
      member.value = {
        account: element.account.account_number,
        id_number: element.id_number,
        residential_address: element.residential_address,
        email: element.email,
        phone: element.phone,
        date_became_member: element.date_became_member,
      };
    }
  });
};

const selectLoan = (event) => {
  loanTypes.forEach((element) => {
    if (element.id == event.target.value) {
      loan.value = {
        interest: element.interest_rate,
        penalty: element.penaltyType.display_name,
        p_value: element.penalty_value,
        service_fee: element.service_fee,
        repayment_period: element.repayment_period,
        penalty_frequency: element.penaltyFrequency.display_name,
        payment_frequency: element.paymentFrequency.display_name,
        interest_type: element.interestType.display_name,
      };
    }
  });
};

selectMember({ target: { value: props.activeLoan.member_id } });
selectLoan({ target: { value: props.activeLoan.loan_type_id } });

function saveForm() {
  form.put(route("activeLoans.update", props.activeLoan.id), {
    onSuccess: () => {},
  });
}
</script>

