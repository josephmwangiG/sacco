<template>
  <EditMember>
    <form @submit.prevent="saveForm()">
      <div class="modal-body">
        <div class="new-user-info">
          <div class="row">
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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
            <div class="col-12 mt-3 text-primary">
              <h6>Location &amp; Address</h6>
              <hr />
            </div>
            <div class="form-group col-md-4">
              <label for="nationality">Nationality:</label>
              <select
                required
                v-model="form.nationality"
                class="form-control"
                id="nationality"
              >
                <option value="">Select Country</option>
                <option>Caneda</option>
                <option>Noida</option>
                <option>USA</option>
                <option>India</option>
                <option>Africa</option>
              </select>
              <div class="text-danger" v-if="form.errors.nationality">
                <small>{{ form.errors.nationality }}</small>
              </div>
            </div>

            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
              <label for="residential_address"> Residential Address:</label>
              <input
                type="text"
                class="form-control"
                id="residential_address"
                v-model="form.residential_address"
                placeholder=" Residential Address"
              />
              <div class="text-danger" v-if="form.errors.residential_address">
                <small>{{ form.errors.residential_address }}</small>
              </div>
            </div>
            <div class="form-group col-md-4">
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
            <div class="form-group col-md-4">
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

            <div class="form-group col-md-4">
              <label for="date_became_member"> Date of Joining:</label>
              <input
                type="date"
                class="form-control"
                id="date_became_member"
                v-model="form.date_became_member"
              />
              <div class="text-danger" v-if="form.errors.date_became_member">
                <small>{{ form.errors.date_became_member }}</small>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save Changes</button>
      </div>
    </form>
  </EditMember>
</template>

<script setup>
import EditMember from "./EditMember.vue";
const props = defineProps({
  member: Object,
  active: String,
});

let form = useForm({
  member_id: props.member.id,
  first_name: props.member.first_name,
  last_name: props.member.last_name,
  date_of_birth: props.member.date_of_birth,
  date_became_member: props.member.date_became_member,
  nationality: props.member.nationality,
  county: props.member.county,
  city: props.member.city,
  id_number: props.member.id_number,
  passport_number: props.member.passport_number,
  phone: props.member.phone,
  email: props.member.email,
  postal_address: props.member.postal_address,
  residential_address: props.member.residential_address,
  status_id: props.member.status_id,
});

function saveForm() {
  props.form.put(route("members.update", props.item), {
    onSuccess: () => {
      form.reset();
      document.getElementById("closeModal").click();
    },
  });
}
</script>

