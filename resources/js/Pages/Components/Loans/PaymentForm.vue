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
      <div class="modal-content modal-div">
        <div class="modal-header">
          <h5 class="modal-title" id="formModal">{{ action }} Loan Payment.</h5>
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
          <div class="modal-body">
            <div class="new-user-info">
              <div class="row">
                <div
                  class="form-group col-sm-6"
                  :class="hasMember ? 'collapse' : ''"
                >
                  <label for="member">Member:</label>
                  <select
                    required
                    @change="selectMember($event)"
                    v-model="form.member"
                    class="form-control"
                    id="member"
                    :disabled="hasMember ? true : false"
                  >
                    <option value="">Select option</option>
                    <option v-for="m in members" :key="m.id" :value="m.id">
                      {{ m.first_name }} {{ m.last_name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.member">
                    <small>{{ form.errors.member }}</small>
                  </div>
                </div>

                <div
                  v-if="hasMember"
                  class="form-group col-md-6"
                  :class="hasMember ? '' : 'collapse'"
                >
                  <label for="member_names">Member:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    :disabled="hasMember ? false : true"
                    :value="
                      memberDetails.first_name + ' ' + memberDetails.last_name
                    "
                    id="member_names"
                    placeholder="Member"
                  />
                </div>

                <div class="form-group col-md-6">
                  <label for="account_number">Ac Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.account_number"
                    id="account_number"
                    placeholder="Ac Number"
                  />
                  <div class="text-danger" v-if="form.errors.account_number">
                    <small>{{ form.errors.account_number }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="id_number">National Id:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="id_number"
                    v-model="form.id_number"
                    placeholder="National Id"
                  />
                  <div class="text-danger" v-if="form.errors.id_number">
                    <small>{{ form.errors.id_number }}</small>
                  </div>
                </div>

                <div class="form-group col-sm-6">
                  <label for="payment_method">Payment Method:</label>
                  <select
                    required
                    v-model="form.payment_method"
                    class="form-control"
                    @change="paymentM($event)"
                    id="payment_method"
                  >
                    <option value="">Select option</option>
                    <option v-for="p in paymentMethods" :key="p.id">
                      {{ p.name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.payment_method">
                    <small>{{ form.errors.payment_method }}</small>
                  </div>
                </div>
              </div>
              <div
                class="row"
                :class="form.method_id == 'CASH' ? 'collapse' : ''"
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
                <div class="form-group col-md-6">
                  <label for="amount">Amount:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="amount"
                    v-model="form.amount"
                    placeholder="Amount"
                  />
                  <div class="text-danger" v-if="form.errors.amount">
                    <small>{{ form.errors.amount }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="payment_date">Payment Date:</label>
                  <input
                    type="date"
                    class="form-control"
                    id="payment_date"
                    v-model="form.payment_date"
                    placeholder="Payment Date"
                  />
                  <div class="text-danger" v-if="form.errors.payment_date">
                    <small>{{ form.errors.payment_date }}</small>
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
              {{ action }} Payment
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
  hasMember: Boolean,
  memberDetails: Object,
});

const paymentMethods = usePage().props.value.paymentMethods;
const members = usePage().props.value.members;

const selectMember = (event) => {
  members.forEach((item) => {
    if (item.id == event.target.value) {
      props.form.id_number = item.id_number;
      props.form.account_number = item.account.account_number;
    }
  });
};

const paymentM = (event) => {
  if (event.target.value == "BANK") {
    document.getElementById("bank_div").classList.remove("collapse");
  } else {
    document.getElementById("bank_div").classList.add("collapse");
  }
};

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("activeLoans.update.payments", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("activeLoans.store.payments", props.form.loan_id), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

