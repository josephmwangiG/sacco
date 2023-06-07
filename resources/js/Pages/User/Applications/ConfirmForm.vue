<template>
  <EditApplication :loanApplication="loanApplication" :active="'confirm'">
    <form @submit.prevent="saveForm()">
      <div class="new-user-info">
        <div class="row">
          <div class="form-group col-md-6">
            <label for="service_fee">Serveice Fee:</label>
            <input
              type="text"
              class="form-control"
              id="service_fee"
              v-model="form.service_fee"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.service_fee">
              <small>{{ form.errors.service_fee }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="amount_applied">Amount Applied:</label>
            <input
              type="text"
              class="form-control"
              id="amount_applied"
              v-model="form.amount_applied"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.amount_applied">
              <small>{{ form.errors.amount_applied }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="amount_approved">Amount Approved:</label>
            <input
              type="text"
              class="form-control"
              id="amount_approved"
              v-model="form.amount_approved"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.amount_approved">
              <small>{{ form.errors.amount_approved }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="disburse_amount">Disburse Amount:</label>
            <input
              type="text"
              class="form-control"
              id="disburse_amount"
              v-model="form.disburse_amount"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.disburse_amount">
              <small>{{ form.errors.disburse_amount }}</small>
            </div>
          </div>

          <div class="col-12">
            <hr />
          </div>
          <div class="form-group col-sm-6">
            <label for="reviewed_by">Review By:</label>
            <select
              required
              v-model="form.reviewed_by"
              class="form-control"
              id="reviewed_by"
            >
              <option value="">Select option</option>
              <option v-for="u in users" :key="u.id" :value="u.id">
                {{ u.first_name }} {{ u.last_name }}
              </option>
            </select>
            <div class="text-danger" v-if="form.errors.reviewed_by">
              <small>{{ form.errors.reviewed_by }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="reviewed_on">Review On:</label>
            <input
              type="date"
              class="form-control"
              id="reviewed_on"
              v-model="form.reviewed_on"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.reviewed_on">
              <small>{{ form.errors.reviewed_on }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="approved_on">Approved On:</label>
            <input
              type="date"
              class="form-control"
              id="approved_on"
              v-model="form.approved_on"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.approved_on">
              <small>{{ form.errors.approved_on }}</small>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label for="start_date">Loan Start Date</label>
            <input
              type="date"
              class="form-control"
              id="start_date"
              v-model="form.start_date"
              placeholder=""
            />
            <div class="text-danger" v-if="form.errors.start_date">
              <small>{{ form.errors.start_date }}</small>
            </div>
          </div>

          <div class="form-group col-sm-6">
            <label for="loan_officer">Loan Officer:</label>
            <select
              required
              v-model="form.loan_officer"
              class="form-control"
              id="loan_officer"
            >
              <option value="">Select option</option>
              <option v-for="u in users" :key="u.id" :value="u.id">
                {{ u.first_name }} {{ u.last_name }}
              </option>
            </select>
            <div class="text-danger" v-if="form.errors.loan_officer">
              <small>{{ form.errors.loan_officer }}</small>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer mt-3" v-if="loanApplication.approved_on == null">
        <button type="submit" class="btn btn-success">Approve Loan</button>
      </div>
      <div class="modal-footer mt-3" v-else>
        <button type="button" class="btn btn-danger">Active Loan</button>
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

let form = ref(
  useForm({
    amount_approved: Number(props.loanApplication.amount_applied),
    disburse_amount:
      Number(props.loanApplication.amount_applied) -
      Number(props.loanApplication.service_fee),
    service_fee: props.loanApplication.service_fee,
    amount_applied: props.loanApplication.amount_applied,
    reviewed_by: props.loanApplication.reviewed_by_user_id,
    reviewed_on: props.loanApplication.reviewed_on,
    approved_on: props.loanApplication.approved_on,
    loan_officer: props.loanApplication.loan_officer_id,
    start_date: props.loanApplication.start_date,
  })
);

const users = usePage().props.value.users;

function saveForm() {
  form.value.put(
    route("loanApplications.confirm.store", props.loanApplication.id),
    {
      onSuccess: () => {},
    }
  );
}
</script>

