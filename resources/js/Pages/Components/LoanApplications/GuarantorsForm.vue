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
          <h5 class="modal-title" id="formModal">{{ action }} Guarantor.</h5>
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
                <div class="form-group col-sm-6">
                  <label for="member">Member:</label>
                  <select
                    required
                    @change="selectMember($event)"
                    v-model="form.member"
                    class="form-control"
                    id="member"
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
                <div class="form-group col-md-6">
                  <label for="guarantee_amount">Guarantee Amount:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="guarantee_amount"
                    v-model="form.guarantee_amount"
                    placeholder="Guarantee Amount"
                  />
                  <div class="text-danger" v-if="form.errors.guarantee_amount">
                    <small>{{ form.errors.guarantee_amount }}</small>
                  </div>
                </div>
                <div class="form-group col-md-12">
                  <div class="form-group">
                    <label for="exampleFormControlTextarea1">Notes</label>
                    <textarea
                      class="form-control"
                      v-model="form.notes"
                      placeholder="Short notes"
                      id="exampleFormControlTextarea1"
                      rows="4"
                    ></textarea>
                    <div class="text-danger" v-if="form.errors.notes">
                      <small>{{ form.errors.notes }}</small>
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
              {{ action }} Guarantor
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
  id: Number,
});

const emit = defineEmits(["getItems"]);

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

if (props.action == "Edit") {
  selectMember({ target: { value: form.member } });
}

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("loanApplications.update.guarantors", props.item), {
      onSuccess: (response) => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("loanApplications.store.guarantors", props.id), {
      onSuccess: (response) => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

