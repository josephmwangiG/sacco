<template>
  <div
    class="modal fade"
    id="formModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="formModal"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="formModal">{{ action }} Loan Type.</h5>
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-label="Close"
          >
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form @submit.prevent="saveForm()">
          <div class="modal-body modal-div">
            <div class="new-user-info">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name">Loan Type:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.name"
                    id="name"
                    placeholder="Loan Type"
                  />
                  <div class="text-danger" v-if="form.errors.name">
                    <small>{{ form.errors.name }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="interest_rate">Interest Rate:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.interest_rate"
                    id="interest_rate"
                    placeholder="Interest Rate"
                  />
                  <div class="text-danger" v-if="form.errors.interest_rate">
                    <small>{{ form.errors.interest_rate }}</small>
                  </div>
                </div>
                <div class="form-group col-sm-6">
                  <label for="interest_type">Interest Type:</label>
                  <select
                    required
                    v-model="form.interest_type"
                    class="form-control"
                    id="interest_type"
                  >
                    <option value="">Select option</option>
                    <option
                      v-for="item in interestTypes"
                      :key="item.id"
                      :value="item.id"
                    >
                      {{ item.display_name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.interest_type">
                    <small>{{ form.errors.interest_type }}</small>
                  </div>
                </div>
                <div class="form-group col-sm-6">
                  <label for="payment_frequency">Payment Frequency:</label>
                  <select
                    required
                    v-model="form.payment_frequency"
                    class="form-control"
                    id="payment_frequency"
                  >
                    <option value="">Select option</option>
                    <option
                      v-for="item in paymentFrequencies"
                      :key="item.id"
                      :value="item.id"
                    >
                      {{ item.display_name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.payment_frequency">
                    <small>{{ form.errors.payment_frequency }}</small>
                  </div>
                </div>

                <div class="form-group col-sm-6">
                  <label for="penalty_type">Penalty Type:</label>
                  <select
                    required
                    v-model="form.penalty_type"
                    class="form-control"
                    id="penalty_type"
                  >
                    <option value="">Select option</option>
                    <option
                      v-for="item in penaltyTypes"
                      :key="item.id"
                      :value="item.id"
                    >
                      {{ item.display_name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.penalty_type">
                    <small>{{ form.errors.penalty_type }}</small>
                  </div>
                </div>
                <div class="form-group col-sm-6">
                  <label for="penalty_frequency">Penalty Frequency:</label>
                  <select
                    required
                    v-model="form.penalty_frequency"
                    class="form-control"
                    id="penalty_frequency"
                  >
                    <option value="">Select option</option>
                    <option
                      v-for="item in penaltyFrequencies"
                      :key="item.id"
                      :value="item.id"
                    >
                      {{ item.display_name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.penalty_frequency">
                    <small>{{ form.errors.penalty_frequency }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="penalty_value">Penalty Value:</label>
                  <input
                    type="number"
                    class="form-control"
                    id="penalty_value"
                    v-model="form.penalty_value"
                    placeholder="Penalty Value"
                  />
                  <div class="text-danger" v-if="form.errors.penalty_value">
                    <small>{{ form.errors.penalty_value }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="service_fee">Serveice Fee:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="service_fee"
                    v-model="form.service_fee"
                    placeholder="Serveice Fee"
                  />
                  <div class="text-danger" v-if="form.errors.service_fee">
                    <small>{{ form.errors.service_fee }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="repayment_period">Repayment Period:</label>
                  <input
                    type="number"
                    class="form-control"
                    id="repayment_period"
                    v-model="form.repayment_period"
                    placeholder="Repayment Period (Months)"
                  />
                  <div class="text-danger" v-if="form.errors.repayment_period">
                    <small>{{ form.errors.repayment_period }}</small>
                  </div>
                </div>

                <div class="form-group col-md-12">
                  <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <textarea
                      class="form-control"
                      v-model="form.description"
                      placeholder="Short description"
                      id="exampleFormControlTextarea1"
                      rows="4"
                    ></textarea>
                    <div class="text-danger" v-if="form.errors.description">
                      <small>{{ form.errors.description }}</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              id="closeModal"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              Close
            </button>
            <button type="submit" class="btn btn-primary">
              {{ action }} Loan Type
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { usePage } from "@inertiajs/inertia-vue3";

const props = defineProps({
  form: Object,
  action: String,
  item: Number,
});

const paymentFrequencies = usePage().props.value.paymentFrequencies;
const penaltyFrequencies = usePage().props.value.penaltyFrequencies;
const interestTypes = usePage().props.value.interestTypes;
const penaltyTypes = usePage().props.value.penaltyTypes;

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("loanTypes.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("loanTypes.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>
