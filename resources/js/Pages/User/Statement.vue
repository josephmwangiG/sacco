<template>
  <div
    class="modal fade"
    id="loanStatement"
    tabindex="-1"
    role="dialog"
    aria-labelledby="loanStatement"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loanStatement">Loan Statement.</h5>
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
          <div class="row">
            <div class="col-md-6">
              <h6>Member Details</h6>
              <p>
                <b>Name:</b> {{ activeLoan.member.first_name }}
                {{ activeLoan.member.last_name }}
                <br />
                <b>Account:</b> {{ activeLoan.account.account_number }}
                <br />
                <b>Phone:</b> {{ activeLoan.member.phone }}
                <br />
                <b>Branch:</b> {{ activeLoan.branch.name }}
              </p>
            </div>
            <div class="col-md-6">
              <h6>Member Details</h6>
              <p>
                <b>Ref number:</b> {{ activeLoan.loan_reference_number }}
                <br />
                <b>Start date:</b> {{ activeLoan.start_date }}
              </p>
            </div>
            <div class="col-12">
              <hr />
            </div>
          </div>
          <div class="table-responsive">
            <table
              id="user-list-table"
              class="table table-striped table-borderless mt-2"
              role="grid"
            >
              <thead>
                <tr>
                  <th>Effective Date</th>
                  <th>Amount</th>
                  <th>Activity Description</th>
                  <th>Principle Bal</th>
                  <th>Interest / Fee</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>{{ activeLoan.start_date }}</td>
                  <td>
                    {{
                      activeLoan.amount_approved.toLocaleString("en-US", {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }) + "0"
                    }}
                  </td>
                  <td>Opening Loan Balance</td>
                  <td>
                    {{
                      activeLoan.amount_approved.toLocaleString("en-US", {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }) + "0"
                    }}
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td>{{ activeLoan.start_date }}</td>
                  <td>
                    {{
                      pays.payments[0].interest_amount.toLocaleString("en-US", {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }) + "0"
                    }}
                  </td>
                  <td>Opening Interest</td>
                  <td></td>
                  <td>
                    {{
                      pays.payments[0].interest_amount.toLocaleString("en-US", {
                        minimumFractionDigits: 1,
                        maximumFractionDigits: 1,
                      }) + "0"
                    }}
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>Interest from {{ activeLoan.start_date }} to Date B</td>
                  <td></td>
                  <td>2000</td>
                </tr>

                <tr>
                  <td>2021</td>
                  <td>1000</td>
                  <td>Closing Balance</td>
                  <td></td>
                  <td>2000</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="table-responsive mt-3">
            <h5>Payment Summary</h5>
            <table
              id="user-list-table"
              class="table table-striped table-borderless mt-2"
              role="grid"
            >
              <thead>
                <tr>
                  <th>Loan No.</th>
                  <th>Principle</th>
                  <th>Past Due Principle</th>
                  <th>Current Interest / Fee</th>
                  <th>Past Interest / Fee</th>
                  <th>Total Due</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                  <td>{{ activeLoan.loan_reference_number }}</td>
                </tr>
              </tbody>
            </table>

            <div class="details row my-4">
              <div class="col-6">
                Loan Customer <br />
                Member A/C: {{ activeLoan.account.account_number }}
              </div>
              <div class="col-6">
                Statement Date: 01/04/07 <br />
                Payment Due Date: 01/14/O7 <br />
                Amount Due: 1,736.77
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

var date = new Date();
var firstDay = new Date(date.getFullYear(), date.getMonth() - 1, 1);
var lastDay = new Date(date.getFullYear(), date.getMonth(), 0);
console.log(firstDay + "===" + lastDay);

const calculateLoan = () => {
  let periods = 0;
  let payments = props.activeLoan.payment_sum;
  let principle = 0;
  let interest = 0;
  console.log(payments);

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

