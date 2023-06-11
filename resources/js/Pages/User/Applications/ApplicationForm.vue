<template>
  <div
    class="modal fade"
    id="formModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="formModal"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="formModal">New Loan Application.</h5>
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
                <div class="form-group col-md-4">
                  <label for="member">Names:</label>
                  <input
                    type="text"
                    v-model="member.name"
                    class="form-control"
                    required
                    id="member"
                    placeholder="Names"
                  />
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
                  <label for="address">Address:</label>
                  <input
                    type="text"
                    v-model="member.residential_address"
                    class="form-control"
                    id="address"
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
                    <option
                      v-for="(i, index) in loanTypes"
                      :value="i.id"
                      :key="index"
                    >
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
                  />
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
              Apply for Loan
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { usePage } from "@inertiajs/inertia-vue3";
import { ref } from "vue";

const props = defineProps({
  form: Object,
  action: String,
  item: Number,
  memberDetails: Object,
});

const members = usePage().props.value.members;

const member = ref({
  account: props.memberDetails.account.account_number,
  id_number: props.memberDetails.id_number,
  residential_address: props.memberDetails.residential_address,
  name:
    props.memberDetails.user.first_name +
    " " +
    props.memberDetails.user.last_name,
  email: props.memberDetails.user.email,
  phone: props.memberDetails.user.phone,
  date_became_member: props.memberDetails.date_became_member,
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

function saveForm() {
  console.log(props.action);
  if (props.action == "Edit") {
    props.form.put(route("u.loanApplications.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("u.loanApplications.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

