<template>
  <EditApplication :loanApplication="loanApplication" :active="'disbursement'">
    <form @submit.prevent="saveForm()">
      <div class="row">
        <div class="form-group col-md-6">
          <label for="disbursement_date">Disbursement Date:</label>
          <input
            type="date"
            class="form-control"
            id="disbursement_date"
            v-model="form.disbursement_date"
            placeholder="Bank Branch"
          />
          <div class="text-danger" v-if="form.errors.disbursement_date">
            <small>{{ form.errors.disbursement_date }}</small>
          </div>
        </div>
        <div class="form-group col-sm-6">
          <label for="disburse_method">Payment Method:</label>
          <select
            required
            v-model="form.disburse_method"
            class="form-control"
            @change="paymentM($event)"
            id="disburse_method"
          >
            <option value="">Select option</option>
            <option v-for="p in paymentMethods" :key="p.id" :value="p.id">
              {{ p.name }}
            </option>
          </select>
          <div class="text-danger" v-if="form.errors.disburse_method">
            <small>{{ form.errors.disburse_method }}</small>
          </div>
        </div>
      </div>
      <div
        class="row"
        :class="form.disburse_method == '1' ? '' : 'collapse'"
        id="bank_div"
      >
        <div class="form-group col-md-6">
          <label for="bank_name">Bank Name:</label>
          <input
            type="text"
            class="form-control"
            id="bank_name"
            v-model="form.bank_name"
            placeholder="Bank Name"
          />
          <div class="text-danger" v-if="form.errors.bank_name">
            <small>{{ form.errors.bank_name }}</small>
          </div>
        </div>
        <div class="form-group col-md-6">
          <label for="bank_branch">Bank branch:</label>
          <input
            type="text"
            class="form-control"
            id="bank_branch"
            v-model="form.bank_branch"
            placeholder="Bank Branch"
          />
          <div class="text-danger" v-if="form.errors.bank_branch">
            <small>{{ form.errors.bank_branch }}</small>
          </div>
        </div>
        <div class="form-group col-md-6">
          <label for="cheque_date">Cheque Date:</label>
          <input
            type="date"
            class="form-control"
            id="cheque_date"
            v-model="form.cheque_date"
            placeholder="Cheque Date"
          />
          <div class="text-danger" v-if="form.errors.cheque_date">
            <small>{{ form.errors.cheque_date }}</small>
          </div>
        </div>

        <div class="form-group col-md-6">
          <label for="cheque_number">Cheque Number:</label>
          <input
            type="text"
            class="form-control"
            id="cheque_number"
            v-model="form.cheque_number"
            placeholder="Cheque Number"
          />
          <div class="text-danger" v-if="form.errors.cheque_number">
            <small>{{ form.errors.cheque_number }}</small>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group col-md-12">
          <div class="form-group">
            <label for="disburse_note">Disbursement Note</label>
            <textarea
              class="form-control"
              v-model="form.disburse_note"
              placeholder="Disbursement Note"
              id="disburse_note"
              rows="4"
            ></textarea>
            <div class="text-danger" v-if="form.errors.disburse_note">
              <small>{{ form.errors.disburse_note }}</small>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer mt-3" v-if="loanApplication.approved_on == null">
        <button type="submit" class="btn btn-primary">Save Details</button>
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
    disbursement_date: props.loanApplication.disbursement_date,
  })
);

const paymentMethods = usePage().props.value.paymentMethods;

const paymentM = (event) => {
  if (event.target.value == "1") {
    document.getElementById("bank_div").classList.remove("collapse");
  } else {
    document.getElementById("bank_div").classList.add("collapse");
  }
};

function saveForm() {
  form.value.put(
    route("loanApplications.update.disbusement", props.loanApplication.id),
    {
      onSuccess: () => {},
    }
  );
}
</script>

