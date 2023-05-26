<template>
  <div
    class="modal fade"
    id="formModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="formModal"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="formModal">{{ action }} User</h5>
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
                <div class="form-group col-md-6">
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
                <div class="form-group col-md-6">
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
                <div class="form-group col-md-6">
                  <label for="email">Email Address:</label>
                  <input
                    type="email"
                    v-model="form.email"
                    class="form-control"
                    required
                    id="email"
                    placeholder="Email Address"
                  />
                  <div class="text-danger" v-if="form.errors.phone">
                    <small>{{ form.errors.phone }}</small>
                  </div>
                </div>
                <div class="form-group col-md-6">
                  <label for="phone">Phone Number:</label>
                  <input
                    type="phone"
                    v-model="form.phone"
                    class="form-control"
                    required
                    id="phone"
                    placeholder="Phone Number"
                  />
                  <div class="text-danger" v-if="form.errors.phone">
                    <small>{{ form.errors.phone }}</small>
                  </div>
                </div>
                <div class="form-group col-md-12">
                  <label for="role">Role:</label>
                  <select
                    type="text"
                    v-model="form.role_id"
                    class="form-control"
                    required
                    id="name"
                    placeholder="Select Role"
                  >
                    <option v-for="i in roles" :key="i.id" :value="i.id">
                      {{ i.name }}
                    </option>
                  </select>
                  <div class="text-danger" v-if="form.errors.role_id">
                    <small>{{ form.errors.role_id }}</small>
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
              {{ action }} User
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
  roles: Object,
  item: Number,
});

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("users.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("users.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

