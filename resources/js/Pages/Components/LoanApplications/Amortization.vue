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
          <h5 class="modal-title" id="formModal">
            Loan Amortization Schedule.
          </h5>
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-label="Close"
          >
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body modal-div">
          <div class="table-responsive">
            <table
              id="user-list-table"
              class="table table-striped table-borderless mt-2"
              role="grid"
            >
              <thead>
                <tr>
                  <th>Period</th>
                  <th>Due Date</th>
                  <th>Payment</th>
                  <th>Interest</th>
                  <th>Principle</th>
                  <th>Balance</th>
                </tr>
              </thead>
              <tbody v-if="pays != ''">
                <tr v-for="(item, index) in pays.payments" :key="index">
                  <td>{{ item.period }}</td>
                  <td>{{ activeLoan.start_date }}</td>
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
                      item.interest_amount.toLocaleString("en-US", {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }) + "0"
                    }}
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
                      (item.principle - item.payment_amount).toLocaleString(
                        "en-Us",
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
        <div class="modal-footer">
          <button
            type="button"
            id="closeModal"
            class="btn btn-secondary"
            data-dismiss="modal"
          >
            Close
          </button>
          <button type="submit" class="btn btn-primary">Download</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const props = defineProps({
  activeLoan: Object,
});
let pays = ref("");

const calculateLoan = () => {
  let periods = 0;
  let payments = props.activeLoan.payment_sum;
  let principle = 0;
  let interest = 0;

  // Fixed balance = P *(r/12) * duration
  // Reducing balance = P *(1 + r/12)

  const duration_years = props.activeLoan.repayment_period / 12;
  const pFreq = props.activeLoan.paymentFrequency.display_name;

  if (pFreq == "Annually") {
    periods = 1;
  } else if (pFreq == "semi_annualy") {
    periods = 2;
  } else if (pFreq == "quaterly") {
    periods = 4;
  } else if (pFreq == "Monthly") {
    periods = 12;
  } else if (pFreq == "Weekly") {
    periods = 52.1786;
  } else if (pFreq == "daily") {
    periods = 365;
  }

  pays.value = {
    principle: principle,
    amount_applied: props.activeLoan.amount_approved,
    periods: periods,
    payments: [],
  };
  principle = props.activeLoan.amount_approved;
  if (props.activeLoan.interestType.display_name == "Fixed Rate") {
    let full_int =
      principle * (props.activeLoan.interest_rate / 100) * duration_years;

    let new_principle = Number(principle) + Number(full_int);
    let payment_per_month = new_principle / (periods * duration_years);
    let intr = full_int / (periods * duration_years);

    for (let i = 1; i <= props.activeLoan.repayment_period; i++) {
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
    let payment_per_month = principle / (periods * duration_years);
    let new_principle =
      principle * (1 + props.activeLoan.interest_rate / 100 / 12);

    for (let i = 1; i <= props.activeLoan.repayment_period; i++) {
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
      new_principle =
        principle * (1 + props.activeLoan.interest_rate / 100 / 12);
      payments = payments + payment_per_month + intr;
      interest = interest + intr;
    }
  }
};

calculateLoan();
</script>

