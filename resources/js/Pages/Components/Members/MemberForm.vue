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
          <h5 class="modal-title" id="formModal">Add a Member</h5>
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
                <div class="col-12 text-primary">
                  <h6>Member's Details</h6>
                  <hr />
                </div>
                <div class="form-group col-md-3">
                  <label for="first_name">First Name:</label>
                  <input
                    type="text"
                    v-model="form.first_name"
                    class="form-control"
                    required
                    id="first_name"
                    placeholder="First Name"
                  />
                  <div class="text-danger" v-if="form.errors.first_name">
                    <small>{{ form.errors.first_name }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="last_name">Last Name:</label>
                  <input
                    type="text"
                    v-model="form.last_name"
                    class="form-control"
                    required
                    id="last_name"
                    placeholder="Last Name"
                  />
                  <div class="text-danger" v-if="form.errors.last_name">
                    <small>{{ form.errors.last_name }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="email">Email:</label>
                  <input
                    type="email"
                    class="form-control"
                    required
                    v-model="form.email"
                    id="email"
                    placeholder="Email"
                  />
                  <div class="text-danger" v-if="form.errors.email">
                    <small>{{ form.errors.email }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="email">Phone:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.phone"
                    id="phone"
                    placeholder="Phone"
                  />
                  <div class="text-danger" v-if="form.errors.phone">
                    <small>{{ form.errors.phone }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="kra_pin">KRA Pin:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="kra_pin"
                    v-model="form.kra_pin"
                    placeholder="KRA Pin"
                  />
                  <div class="text-danger" v-if="form.errors.kra_pin">
                    <small>{{ form.errors.kra_pin }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="id_number">National ID / Passport:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="id_number"
                    v-model="form.id_number"
                    placeholder="National ID / Passport"
                  />
                  <div class="text-danger" v-if="form.errors.id_number">
                    <small>{{ form.errors.id_number }}</small>
                  </div>
                </div>
                <div class="col-12 text-primary mt-3">
                  <h6>Employment Details</h6>
                  <hr />
                </div>
                <div class="form-group col-md-3">
                  <label for="employer_name">Employer Name:</label>
                  <input
                    type="text"
                    v-model="form.employer_name"
                    class="form-control"
                    required
                    id="employer_name"
                    placeholder="Employer Name"
                  />
                  <div class="text-danger" v-if="form.errors.employer_name">
                    <small>{{ form.errors.employer_name }}</small>
                  </div>
                </div>
                <div class="col-12"></div>
                <div class="form-group col-md-6">
                  <label for="employer_name" class="w-100 mt-3"
                    >Income Bracket:</label
                  >
                  <div
                    class="custom-control custom-checkbox custom-control-inline"
                  >
                    <input
                      type="radio"
                      class="custom-control-input"
                      id="customCheck5"
                      name="income_bracket"
                      value="0 - 50, 000"
                      v-model="form.income_bracket"
                    />
                    <label class="custom-control-label" for="customCheck5"
                      >0 - 50, 000
                    </label>
                  </div>
                  <div
                    class="custom-control custom-checkbox custom-control-inline"
                  >
                    <input
                      type="radio"
                      name="income_bracket"
                      v-model="form.income_bracket"
                      class="custom-control-input"
                      value="50, 001 - 100, 000"
                      id="customCheck6"
                    />
                    <label class="custom-control-label" for="customCheck6"
                      >50, 001 - 100, 000</label
                    >
                  </div>
                  <div
                    class="custom-control custom-checkbox custom-control-inline"
                  >
                    <input
                      type="radio"
                      name="income_bracket"
                      v-model="form.income_bracket"
                      class="custom-control-input"
                      value="100, 001 - 150, 000"
                      id="customCheck7"
                    />
                    <label class="custom-control-label" for="customCheck7"
                      >100, 001 - 150, 000</label
                    >
                  </div>
                  <div
                    class="custom-control custom-checkbox custom-control-inline"
                  >
                    <input
                      type="radio"
                      name="income_bracket"
                      value="Above 150, 000"
                      v-model="form.income_bracket"
                      class="custom-control-input"
                      id="customCheck8"
                    />
                    <label class="custom-control-label" for="customCheck8"
                      >Above 150, 000</label
                    >
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="employer_name" class="w-100 mt-3"
                    >Residence:</label
                  >
                  <div
                    class="custom-control custom-radio custom-control-inline"
                  >
                    <input
                      type="radio"
                      id="customRadio6"
                      name="residence"
                      v-model="form.residence"
                      class="custom-control-input"
                      value="Own"
                    />
                    <label class="custom-control-label" for="customRadio6">
                      Own</label
                    >
                  </div>
                  <div
                    class="custom-control custom-radio custom-control-inline"
                  >
                    <input
                      type="radio"
                      id="customRadio7"
                      name="residence"
                      value="Rental"
                      v-model="form.residence"
                      class="custom-control-input"
                    />
                    <label class="custom-control-label" for="customRadio7">
                      Rental</label
                    >
                  </div>
                </div>
                <div class="col-12 mt-3 text-primary">
                  <h6>Location &amp; Address</h6>
                  <hr />
                </div>
                <div class="form-group col-md-3">
                  <label for="nationality">Nationality:</label>
                  <select
                    required
                    v-model="form.nationality"
                    class="form-control"
                    id="nationality"
                  >
                    <option value="">Select Country</option>
                    <option>Kenya</option>
                    <option>Uganda</option>
                    <option>Tanzania</option>
                    <option>South Africa</option>
                  </select>
                  <div class="text-danger" v-if="form.errors.nationality">
                    <small>{{ form.errors.nationality }}</small>
                  </div>
                </div>

                <div class="form-group col-md-3">
                  <label for="pno">County/City:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="pno"
                    v-model="form.city"
                    placeholder="County/State"
                  />
                  <div class="text-danger" v-if="form.errors.city">
                    <small>{{ form.errors.city }}</small>
                  </div>
                </div>

                <div class="form-group col-md-3">
                  <label for="residential_address"> Residential Address:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="residential_address"
                    v-model="form.residential_address"
                    placeholder=" Residential Address"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.residential_address"
                  >
                    <small>{{ form.errors.residential_address }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="address">Physical Address:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="address"
                    v-model="form.address"
                    placeholder="Address"
                  />
                  <div class="text-danger" v-if="form.errors.address">
                    <small>{{ form.errors.address }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="pno">Postal Address:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="pno"
                    v-model="form.postal_address"
                    placeholder="Postal Address"
                  />
                  <div class="text-danger" v-if="form.errors.postal_address">
                    <small>{{ form.errors.postal_address }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="date_of_birth"> Date of Birth:</label>
                  <input
                    type="date"
                    class="form-control"
                    id="date_of_birth"
                    v-model="form.date_of_birth"
                  />
                  <div class="text-danger" v-if="form.errors.date_of_birth">
                    <small>{{ form.errors.date_of_birth }}</small>
                  </div>
                </div>

                <div class="form-group col-md-3">
                  <label for="date_became_member"> Date of Joining:</label>
                  <input
                    type="date"
                    class="form-control"
                    id="date_became_member"
                    v-model="form.date_became_member"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.date_became_member"
                  >
                    <small>{{ form.errors.date_became_member }}</small>
                  </div>
                </div>
                <div class="col-12 text-primary mt-3">
                  <h6>Bank Details</h6>
                  <hr />
                </div>
                <div class="form-group col-md-4">
                  <label for="bank_name">Bank Name:</label>
                  <input
                    type="text"
                    v-model="form.bank_name"
                    class="form-control"
                    required
                    id="bank_name"
                    placeholder="Bank Name"
                  />
                  <div class="text-danger" v-if="form.errors.bank_name">
                    <small>{{ form.errors.bank_name }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="bank_branch">Bank Branch:</label>
                  <input
                    type="text"
                    v-model="form.bank_branch"
                    class="form-control"
                    required
                    id="bank_branch"
                    placeholder="Bank Branch"
                  />
                  <div class="text-danger" v-if="form.errors.bank_branch">
                    <small>{{ form.errors.bank_branch }}</small>
                  </div>
                </div>
                <div class="form-group col-md-4">
                  <label for="bank_account_number">Bank A/C Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.bank_account_number"
                    id="bank_account_number"
                    placeholder="Account Number"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.bank_account_number"
                  >
                    <small>{{ form.errors.bank_account_number }}</small>
                  </div>
                </div>
                <div class="col-12 text-primary mt-3">
                  <h6>Next of Kin</h6>
                  <hr />
                </div>
                <div class="form-group col-md-3">
                  <label for="next_of_kin">Next of Kin:</label>
                  <input
                    type="text"
                    v-model="form.next_of_kin"
                    class="form-control"
                    required
                    id="next_of_kin"
                    placeholder="Next of kin full name"
                  />
                  <div class="text-danger" v-if="form.errors.next_of_kin">
                    <small>{{ form.errors.next_of_kin }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="next_of_kin_relationship">Relationship:</label>
                  <input
                    type="text"
                    v-model="form.next_of_kin_relationship"
                    class="form-control"
                    required
                    id="next_of_kin_relationship"
                    placeholder="Relationship"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.next_of_kin_relationship"
                  >
                    <small>{{ form.errors.next_of_kin_relationship }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="next_of_kin_phone_number">Phone Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.next_of_kin_phone_number"
                    id="next_of_kin_phone_number"
                    placeholder="Phone Number"
                  />
                  <div
                    class="text-danger"
                    v-if="form.errors.next_of_kin_phone_number"
                  >
                    <small>{{ form.errors.next_of_kin_phone_number }}</small>
                  </div>
                </div>
                <div class="form-group col-md-3">
                  <label for="next_of_kin_email">Email:</label>
                  <input
                    type="email"
                    class="form-control"
                    required
                    v-model="form.next_of_kin_email"
                    id="next_of_kin_email"
                    placeholder="Email address"
                  />
                  <div class="text-danger" v-if="form.errors.next_of_kin_email">
                    <small>{{ form.errors.next_of_kin_email }}</small>
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
              {{ action }} Member
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
    props.form.put(route("members.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("members.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

