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
          <h5 class="modal-title" id="formModal">View Collateral.</h5>
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
                <div class="form-group col-sm-6">
                  <label for="asset">Asset:</label>
                  <select
                    required
                    @change="selectAsset($event)"
                    v-model="form.asset"
                    class="form-control"
                    id="asset"
                  >
                    <option value="">Select Asset</option>
                    <option v-for="a in assets" :key="a.id" :value="a.id">
                      {{ a.title }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.asset">
                    <small>{{ form.errors.asset }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="asset_number">Asset Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.asset_number"
                    id="asset_number"
                    placeholder="Asset Number"
                  />
                  <div class="text-danger" v-if="form.errors.asset_number">
                    <small>{{ form.errors.asset_number }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="valuation_amount">Valuation Amount:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="valuation_amount"
                    v-model="form.valuation_amount"
                    placeholder="Valuation Amount"
                  />
                  <div class="text-danger" v-if="form.errors.valuation_amount">
                    <small>{{ form.errors.valuation_amount }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="valuation_date">Valuation date:</label>
                  <input
                    type="date"
                    class="form-control"
                    id="valuation_date"
                    v-model="form.valuation_date"
                    placeholder="Valuation date"
                  />
                  <div class="text-danger" v-if="form.errors.valuation_date">
                    <small>{{ form.errors.valuation_date }}</small>
                  </div>
                </div>
                <div class="form-group col-md-12">
                  <div class="form-group">
                    <label for="condition">Asset Condition</label>
                    <textarea
                      class="form-control"
                      v-model="form.condition"
                      placeholder="Asset Condition"
                      id="condition"
                      rows="4"
                    ></textarea>
                    <div class="text-danger" v-if="form.errors.condition">
                      <small>{{ form.errors.condition }}</small>
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
  assets: Object,
  action: String,
  item: Number,
  id: Number,
});

const emit = defineEmits(["getItems"]);

const paymentMethods = usePage().props.value.paymentMethods;
const members = usePage().props.value.members;

const selectAsset = (event) => {
  props.assets.forEach((item) => {
    if (item.id == event.target.value) {
      props.form.asset_number = item.asset_number;
      props.form.valuation_amount = item.valuation_amount;
      props.form.valuation_date = item.valuation_date;
      props.form.condition = item.condition;
    }
  });
};

if (props.action == "Edit") {
  selectAsset({ target: { value: props.form.asset } });
}

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("collaterals.update", props.item), {
      onSuccess: (response) => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("collaterals.store"), {
      onSuccess: (response) => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

