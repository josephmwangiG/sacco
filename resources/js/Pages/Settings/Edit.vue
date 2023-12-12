<template>
  <Main>
    <div class="row">
      <div class="col-lg-3">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Add Admin User</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <form>
              <div class="form-group">
                <div class="add-img-user profile-img-edit">
                  <img
                    class="profile-pic img-fluid"
                    style="height: 100px; width: 100px;"
                    src="/images/user/01.jpg"
                    alt="profile-pic"
                  />
                  <div class="p-image">
                    <a
                      href="javascript:void();"
                      class="upload-button btn iq-bg-primary"
                      >File Upload</a
                    >
                    <input class="file-upload" type="file" accept="image/*" />
                  </div>
                </div>
                <div class="img-extension mt-3">
                  <div class="d-inline-block align-items-center">
                    <span>Only</span>
                    <a href="javascript:void();">.jpg</a>
                    <a href="javascript:void();">.png</a>
                    <a href="javascript:void();">.jpeg</a>
                    <span>allowed</span>
                  </div>
                </div>
              </div>
            
            </form>

          <form @submit.prevent="changePass">
            <hr />
            <h5 class="mb-3">Change Password</h5>
            <div class="row">
              <div class="form-group col-md-12">
                <label for="old_password">Old Password:</label>
                <input
                  type="password"
                  class="form-control"
                  v-model="passForm.old_password"
                  id="old_password"
                  placeholder="Old Password"
                />
                <div class="text-danger" v-if="passForm.errors.old_password">
                  <small>{{ passForm.errors.old_password }}</small>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label for="password">New Password:</label>
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  required
                  v-model="passForm.password"
                  placeholder="New Password"
                />
                <div class="text-danger" v-if="passForm.errors.password">
                  <small>{{ passForm.errors.password }}</small>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label for="rpass">Repeat Password:</label>
                <input
                  type="password"
                  class="form-control"
                  id="rpass"
                  required
                  v-model="passForm.password_confirmation"
                  placeholder="Repeat Password "
                />
              </div>
            </div>
            <div class="checkbox collapse">
              <label
                ><input
                  v-model="form.two_factor"
                  class="mr-2"
                  type="checkbox"
                />Enable Two-Factor-Authentication</label
              >
            </div>
            <button type="submit" class="btn btn-primary mt-3">
              Change Password
            </button>
          </form>
          </div>
        </div>
      </div>
      <div class="iq-card col-lg-9">
        <div class="iq-card-header d-flex justify-content-between">
          <div class="iq-header-title">
            <h4 class="card-title">{{ action }} Organization.</h4>
          </div>
        </div>
        <div class="iq-card-body">
          <form @submit.prevent="saveForm()" class="">
            <div class="new-user-info">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="business_name">Business Name:</label>
                  <input
                    type="text"
                    v-model="form.business_name"
                    class="form-control"
                    required
                    id="business_name"
                    placeholder="Business Name"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="business_type">Business Type:</label>
                  <input
                    type="text"
                    class="form-control"
                    required
                    v-model="form.business_type"
                    id="business_type"
                    placeholder="Business Type"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="postal_code">Postal Code:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="postal_code"
                    v-model="postal_code"
                    placeholder="Postal Code"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="postal_address">Postal Address:</label>
                  <input
                    type="text"
                    v-model="form.postal_address"
                    class="form-control"
                    id="postal_address"
                    placeholder="Postal Address"
                  />
                </div>
                <div class="form-group col-md-12">
                  <label for="physical_address">Physical Address:</label>
                  <input
                    type="text"
                    class="form-control"
                    v-model="form.physical_address"
                    id="physical_address"
                    placeholder="Physical Address"
                  />
                </div>
                <div class="form-group col-sm-12">
                  <label>Country:</label>
                  <select
                    required
                    v-model="form.country"
                    class="form-control"
                    id="selectcountry"
                  >
                    <option>Select Country</option>
                    <option>Kenya</option>
                    <option>Uganda</option>
                    <option>Tanzania</option>
                    <option>South Africa</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="mobno">Mobile Number:</label>
                  <input
                    type="text"
                    class="form-control"
                    v-model="form.phone"
                    id="mobno"
                    placeholder="Mobile Number"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="altconno">Alternate Contact:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="altconno"
                    v-model="form.alternate_phone"
                    placeholder="Alternate Contact"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="email">Email:</label>
                  <input
                    type="email"
                    required
                    class="form-control"
                    id="email"
                    v-model="form.email"
                    placeholder="Email"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="pno">County/City:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="pno"
                    v-model="form.county"
                    placeholder="County/State"
                  />
                </div>
                <div class="form-group col-md-12">
                  <div class="form-group">
                    <label for="exampleFormControlTextarea1">About</label>
                    <textarea
                      class="form-control"
                      v-model="form.about"
                      placeholder="Short description"
                      id="exampleFormControlTextarea1"
                      rows="4"
                    ></textarea>
                  </div>
                </div>
              </div>

              <button type="submit" class="btn btn-primary mt-3">
                {{ action }} Organization
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
import { ref } from "vue";
import { useForm } from "@inertiajs/inertia-vue3";

const props = defineProps({
  organization: Object,
});

let form = ref("");
let action = ref("Edit");

form = useForm({
  _method: "PUT",
  business_name: props.organization.business_name,
  business_type: props.organization.business_type,
  email: props.organization.email,
  phone: props.organization.phone,
  alternate_phone: props.organization.alternate_phone,
  country: props.organization.country,
  county: props.organization.county,
  about: props.organization.about,
  physical_address: props.organization.physical_address,
  postal_address: props.organization.postal_address,
  postal_code: props.organization.postal_code,
  username: props.organization.username,
  town: props.organization.town,
});

const passForm = useForm({
  old_password: "",
  password: "",
  password_confirmation: "",
});

const saveForm = () => {
  form.post(route("organization.update"), {
    preserveScroll: true,
    onSuccess: () => {
      if (JSON.stringify(form.errors) == "{}") {
        window.scrollTo({ top: 0, behavior: "smooth" });
        form.reset();
      }
    },
  });
};
const changePass = () => {
  passForm.post(route("change.password"), {
    preserveScroll: true,
    onSuccess: () => {
      if (JSON.stringify(passForm.errors) == "{}") {
        window.scrollTo({ top: 0, behavior: "smooth" });
        passForm.reset();
      }
    },
  });
};
</script>