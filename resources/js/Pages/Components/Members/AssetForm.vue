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
          <h5 class="modal-title" id="formModal">{{ action }} Asset.</h5>
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
                  <label for="asset">Asset Title:</label>
                  <input
                    type="text"
                    v-model="form.title"
                    class="form-control"
                    required
                    id="asset"
                    placeholder="Asset Title"
                  />
                  <div class="text-danger" v-if="form.errors.title">
                    <small>{{ form.errors.title }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="asset_number">Asset Number:</label>
                  <input
                    type="text"
                    v-model="form.asset_number"
                    class="form-control"
                    required
                    id="asset_number"
                    placeholder="Asset Number"
                  />
                  <div class="text-danger" v-if="form.errors.asset_number">
                    <small>{{ form.errors.asset_number }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="description">Description:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.description"
                    id="description"
                    placeholder="Description"
                  />
                  <div class="text-danger" v-if="form.errors.description">
                    <small>{{ form.errors.description }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="valuation_date">Valuation Date:</label>
                  <input
                    type="date"
                    class="form-control"
                    required
                    v-model="form.valuation_date"
                    id="valuation_date"
                    placeholder="Valuation Date"
                  />
                  <div class="text-danger" v-if="form.errors.valuation_date">
                    <small>{{ form.errors.valuation_date }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="valued_by">Valued By:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="valued_by"
                    v-model="form.valued_by"
                    placeholder="Valued By"
                  />
                  <div class="text-danger" v-if="form.errors.valued_by">
                    <small>{{ form.errors.valued_by }}</small>
                  </div>
                </div>
                <div class="col-12 mt-3 text-primary">
                  <h6>Location &amp; Address</h6>
                  <hr />
                </div>

                <div class="form-group col-md-4">
                  <label for="valuer_phone">Valuer Phone:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="valuer_phone"
                    v-model="form.valuer_phone"
                    placeholder="Valuer Phone"
                  />
                  <div class="text-danger" v-if="form.errors.valuer_phone">
                    <small>{{ form.errors.valuer_phone }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
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
                <div class="form-group col-md-4">
                  <label for="location"> Location:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="location"
                    v-model="form.location"
                    placeholder=" Location"
                  />
                  <div class="text-danger" v-if="form.errors.location">
                    <small>{{ form.errors.location }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="registration_number">Registration Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="registration_number"
                    v-model="form.registration_number"
                    placeholder="Registration Number"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.registration_number"
                  >
                    <small>{{ form.errors.registration_number }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="registered_to"> Registered to:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="registered_to"
                    placeholder="Registered to"
                    v-model="form.registered_to"
                  />
                  <div class="text-danger" v-if="form.errors.registered_to">
                    <small>{{ form.errors.registered_to }}</small>
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <label for="condition"> Asset Condition:</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Asset Condition"
                    id="condition"
                    v-model="form.condition"
                  />
                  <div class="text-danger" v-if="form.errors.condition">
                    <small>{{ form.errors.condition }}</small>
                  </div>
                </div>

                <div class="form-group col-md-12">
                  <div class="form-group">
                    <label for="notes">Notes</label>
                    <textarea
                      class="form-control"
                      v-model="form.notes"
                      placeholder="Short Notes"
                      id="notes"
                      rows="4"
                    ></textarea>
                    <div class="text-danger" v-if="form.errors.notes">
                      <small>{{ form.errors.notes }}</small>
                    </div>
                  </div>
                </div>

                <input
                  type="text"
                  name="member_id"
                  hidden
                  v-model="form.member_i"
                />
                <input
                  type="text"
                  name="branch_id"
                  hidden
                  v-model="form.branch_id"
                />
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
              {{ action }} Asset
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>


<script setup>
const props = defineProps({
  form: Object,
  action: String,
  item: Number,
});

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("assets.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("assets.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

