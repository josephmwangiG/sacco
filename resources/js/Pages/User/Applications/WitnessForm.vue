<template>
  <EditApplication :id="loanApplication.id" :active="'witness'">
    <form @submit.prevent="saveForm()">
      <div class="row mt-3">
        <div class="form-group col-md-4">
          <label for="witness_first_name">First Name:</label>
          <input
            type="text"
            v-model="form.witness_first_name"
            class="form-control"
            required
            id="witness_first_name"
            placeholder="First Name"
          />
          <div class="text-danger" v-if="form.errors.witness_first_name">
            <small>{{ form.errors.witness_first_name }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_last_name">Last Name:</label>
          <input
            type="text"
            v-model="form.witness_last_name"
            class="form-control"
            required
            id="witness_last_name"
            placeholder="Last Name"
          />
          <div class="text-danger" v-if="form.errors.witness_last_name">
            <small>{{ form.errors.witness_last_name }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_type">Witness Type:</label>
          <select
            required
            @change="selectMember($event)"
            v-model="form.witness_type"
            class="form-control"
            id="witness_type"
          >
            <option value="" selected>Select Witness Type</option>
            <option
              v-for="(i, index) in witnessTypes"
              :value="i.id"
              :key="index"
            >
              {{ i.name }}
            </option>
          </select>
          <div class="text-danger" v-if="form.errors.witness_type">
            <small>{{ form.errors.witness_type }}</small>
          </div>
        </div>

        <div class="form-group col-md-4">
          <label for="witness_email">Email:</label>
          <input
            type="email"
            v-model="form.witness_email"
            class="form-control"
            required
            id="witness_email"
            placeholder="Email"
          />
          <div class="text-danger" v-if="form.errors.witness_email">
            <small>{{ form.errors.witness_email }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_phone">Phone Number:</label>
          <input
            type="text"
            v-model="form.witness_phone"
            class="form-control"
            required
            id="witness_phone"
            placeholder="Phone Number"
          />
          <div class="text-danger" v-if="form.errors.witness_phone">
            <small>{{ form.errors.witness_phone }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_national_id">National Id:</label>
          <input
            type="text"
            v-model="form.witness_national_id"
            class="form-control"
            required
            id="witness_national_id"
            placeholder="National Id"
          />
          <div class="text-danger" v-if="form.errors.witness_national_id">
            <small>{{ form.errors.witness_national_id }}</small>
          </div>
        </div>

        <div class="col-12 mt-3 text-primary">
          <h6>Adress Details</h6>
          <hr />
        </div>

        <div class="form-group col-sm-4">
          <label>Country:</label>
          <select
            required
            v-model="form.witness_country"
            class="form-control"
            id="selectcountry"
          >
            <option value="">Select Country</option>
            <option>Kenya</option>
            <option>Uganda</option>
            <option>Tanzania</option>
            <option>South Africa</option>
          </select>
          <div class="text-danger" v-if="form.errors.witness_country">
            <small>{{ form.errors.witness_country }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_city">City:</label>
          <input
            type="text"
            v-model="form.witness_city"
            class="form-control"
            required
            id="witness_city"
            placeholder="City"
          />
          <div class="text-danger" v-if="form.errors.witness_city">
            <small>{{ form.errors.witness_city }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_postal_address">Postal Address:</label>
          <input
            type="text"
            v-model="form.witness_postal_address"
            class="form-control"
            required
            id="witness_postal_address"
            placeholder="Postal Address"
          />
          <div class="text-danger" v-if="form.errors.witness_postal_address">
            <small>{{ form.errors.witness_postal_address }}</small>
          </div>
        </div>
        <div class="form-group col-md-4">
          <label for="witness_residential_address">Residential Address:</label>
          <input
            type="text"
            v-model="form.witness_residential_address"
            class="form-control"
            required
            id="witness_residential_address"
            placeholder="Residential Address"
          />
          <div
            class="text-danger"
            v-if="form.errors.witness_residential_address"
          >
            <small>{{ form.errors.witness_residential_address }}</small>
          </div>
        </div>
      </div>

      <div class="modal-footer mt-3">
        <button
          type="submit"
          class="btn btn-primary"
          v-if="loanApplication.approved_on == null"
        >
          Save Changes
        </button>
        <button type="button" class="btn btn-danger" v-else>Active Loan</button>
      </div>
    </form>
  </EditApplication>
</template>

<script setup>
import { usePage, useForm } from "@inertiajs/inertia-vue3";
import EditApplication from "./EditApplication.vue";
import { ref } from "vue";

const props = defineProps({
  loanApplication: Object,
});

const witnessTypes = usePage().props.value.witnessTypes;

let form = useForm({
  id: props.loanApplication.id,
  member: props.loanApplication.member_id,
  guarantors: props.loanApplication.guarantors,
  member_id: props.loanApplication.member_id,
  loan_officer: props.loanApplication.loan_officer_id,
  loan_type: props.loanApplication.loan_type_id,
  reduce_principal_early: props.loanApplication.reduce_principal_early,
  amount_applied: props.loanApplication.amount_applied,
  interest_rate: props.loanApplication.interest_rate,
  periodic_payment_amount: props.loanApplication.periodic_payment_amount,
  application_date: props.loanApplication.application_date,
  disburse_method: props.loanApplication.disburse_method_id,
  disburse_note: props.loanApplication.disburse_note,
  mpesa_number: props.loanApplication.mpesa_number,
  mpesa_first_name: props.loanApplication.mpesa_first_name,
  mpesa_middle_name: props.loanApplication.mpesa_middle_name,
  mpesa_last_name: props.loanApplication.mpesa_last_name,
  cheque_number: props.loanApplication.cheque_number,
  bank_name: props.loanApplication.bank_name,
  bank_branch: props.loanApplication.bank_branch,
  cheque_date: props.loanApplication.cheque_date,
  witness_type: props.loanApplication.witness_type_id,
  witness_first_name: props.loanApplication.witness_first_name,
  witness_last_name: props.loanApplication.witness_last_name,
  witness_country: props.loanApplication.witness_country,
  witness_county: props.loanApplication.witness_county,
  witness_city: props.loanApplication.witness_city,
  witness_national_id: props.loanApplication.witness_national_id,
  witness_phone: props.loanApplication.witness_phone,
  witness_email: props.loanApplication.witness_email,
  witness_postal_address: props.loanApplication.witness_postal_address,
  witness_residential_address:
    props.loanApplication.witness_residential_address,
  witnessed_by: props.loanApplication.witnessed_by_user_id,
  reviewed_by: props.loanApplication.reviewed_by_user_id,
  reviewed_on: props.loanApplication.reviewed_on,
  approved_on: props.loanApplication.approved_on,
  rejected_on: props.loanApplication.rejected_on,
  rejection_notes: props.loanApplication.rejection_notes,
});
function saveForm() {
  form.put(route("loanApplications.witness.update", props.loanApplication.id), {
    onSuccess: () => {},
  });
}
</script>

 