<template>
  <Main>
    <div class="iq-card">
      <div class="iq-card-header d-flex justify-content-between">
        <h4>Loan Calculator</h4>
        <div class="user-list-files text-right" v-if="viewRates">
          <a class="iq-bg-primary" href="#"> Email </a>
          <a class="iq-bg-primary" @click="downoladPDF" href="#">
            Download PDF
          </a>
          <a class="iq-bg-primary" href="#" @click="showCalc"> Calculator </a>
        </div>
      </div>
      <div class="iq-card-body">
        <hr class="mt-0 pt-0" />
        <form @submit.prevent="calculateLoan()" v-if="!viewRates">
          <div class="row">
            <div class="form-group col-md-4">
              <label for="loan">Loan:</label>
              <select
                @change="selectLoan($event)"
                required
                v-model="loan.loan_type"
                class="form-control"
                id="loan"
              >
                <option value="" selected>Select Loan</option>
                <option
                  v-for="(i, index) in loanTypes"
                  :value="i.id"
                  :key="index"
                >
                  {{ i.name }}
                </option>
              </select>
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
              <label for="amount_applied">Amount:</label>
              <input
                type="text"
                class="form-control"
                required
                v-model="loan.amount_applied"
                id="amount_applied"
                placeholder="Loan Amount"
              />
            </div>
          </div>
          <div class="modal-footer mt-3">
            <button
              type="button"
              id="closeModal"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              Clear Form
            </button>
            <button type="submit" class="btn btn-primary">Calculate</button>
          </div>
        </form>
        <div class="table-responsive" v-else>
          <table
            id="user-list-table"
            class="table table-striped table-borderless"
            role="grid"
            aria-describedby="user-list-page-info"
          >
            <thead>
              <tr>
                <th>Inst. No</th>
                <th>Principle</th>
                <th>Interest</th>
                <th>Installments</th>
                <th>Outstanding</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, index) in pays.payments" :key="index">
                <td>
                  {{ item.period }}
                </td>
                <td>
                  {{
                    item.principle.toLocaleString("en-US", {
                      minimumFractionDigits: 1,
                      maximumFractionDigits: 1,
                    }) + "0"
                  }}
                </td>
                <td>
                  {{
                    item.interest_amount.toLocaleString("en-US", {
                      minimumFractionDigits: 1,
                      maximumFractionDigits: 1,
                    }) + "0"
                  }}
                </td>
                <td>
                  {{
                    item.payment_amount.toLocaleString("en-US", {
                      minimumFractionDigits: 1,
                      maximumFractionDigits: 1,
                    }) + "0"
                  }}
                </td>

                <td>
                  {{
                    (item.principle - item.payment_amount).toLocaleString(
                      "en-US",
                      {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }
                    ) + "0"
                  }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </Main>
</template>

<script setup>
import { usePage } from "@inertiajs/inertia-vue3";
import { ref, reactive } from "vue";
import axios from "axios";

const props = defineProps({});
const loanTypes = usePage().props.value.loanTypes;

const viewRates = ref(false);
let pays = ref();

const showCalc = () => {
  viewRates.value = false;
};
const loan = ref({
  interest: "",
  penalty: "",
  p_value: "",
  service_fee: "",
  repayment_period: "",
  payment_frequency: "",
  amount_applied: "",
  interest_type: "",
  loan_type: "",
});

const selectLoan = (event) => {
  loanTypes.forEach((element) => {
    if (element.id == event.target.value) {
      loan.value = {
        loan_type: element.id,
        interest: element.interest_rate,
        penalty: element.penaltyType.display_name,
        p_value: element.penalty_value,
        service_fee: element.service_fee,
        repayment_period: element.repayment_period,
        amount_applied: "",
        payment_frequency: element.paymentFrequency.display_name,
        interest_type: element.interestType.display_name,
      };
    }
  });
};

const downoladPDF = () => {
  axios.get("pdf/downolad-pdf", { params: pays.value }).then(() => {});
};

const calculateLoan = () => {
  let periods = 0;
  let payments = 0;
  let principle = 0;
  let interest = 0;

  // Fixed balance = P *(r/12) * duration
  // Reducing balance = P *(1 + r/12)

  const duration_years = loan.value.repayment_period / 12;

  if (loan.value.payment_frequency == "Annually") {
    periods = 1;
  } else if (loan.value.payment_frequency == "semi_annualy") {
    periods = 2;
  } else if (loan.value.payment_frequency == "quaterly") {
    periods = 4;
  } else if (loan.value.payment_frequency == "Monthly") {
    periods = 12;
  } else if (loan.value.payment_frequency == "Weekly") {
    periods = 52.1786;
  } else if (loan.value.payment_frequency == "daily") {
    periods = 365;
  }

  pays.value = {
    principle: principle,
    amount_applied: loan.value.amount_applied,
    periods: periods,
    payments: [],
  };

  if (loan.value.interest_type == "Fixed Rate") {
    principle = loan.value.amount_applied;
    let full_int = principle * (loan.value.interest / 100) * duration_years;

    let new_principle = Number(principle) + Number(full_int);
    let payment_per_month = new_principle / (periods * duration_years);
    let intr = full_int / (periods * duration_years);

    console.log(full_int);

    for (let i = 1; i <= periods * duration_years; i++) {
      pays.value.payments.push({
        period: i,
        principle: new_principle,
        payment_per_month: payment_per_month,
        payment_amount: payment_per_month,
        payments: payments + payment_per_month,
        interest: interest + intr,
        interest_amount: intr,
      });

      principle = new_principle - payment_per_month;
      new_principle = principle;
      payments = payments + payment_per_month;
      interest = interest + intr;
    }
  } else {
    principle = loan.value.amount_applied;
    let payment_per_month = principle / (periods * duration_years);
    let new_principle = principle * (1 + loan.value.interest / 100 / 12);

    for (let i = 1; i <= periods * duration_years; i++) {
      if (principle < payment_per_month) {
        pays.value.payments.push({
          period: i,
          principle: new_principle,
          payment_per_month: payment_per_month,
          payment_amount: payment_per_month + new_principle - principle,
          payments: payments + payment_per_month + new_principle - principle,
          interest: interest + new_principle - principle,
          interest_amount: new_principle - principle,
        });
      }

      let intr = new_principle - principle;

      pays.value.payments.push({
        period: i,
        principle: new_principle,
        payment_per_month: payment_per_month,
        payment_amount: payment_per_month + intr,
        payments: payments + payment_per_month + intr,
        interest: interest + intr,
        interest_amount: intr,
      });

      principle = new_principle - (payment_per_month + intr);
      new_principle = principle * (1 + loan.value.interest / 100 / 12);
      payments = payments + payment_per_month + intr;
      interest = interest + intr;
    }
  }

  console.log(pays.value);

  viewRates.value = true;
};
</script>

