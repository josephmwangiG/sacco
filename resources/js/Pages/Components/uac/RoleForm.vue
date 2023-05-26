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
          <h5 class="modal-title" id="formModal">{{ action }} Role</h5>
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
                <div class="form-group col-md-12">
                  <label for="name">Role Name:</label>
                  <input
                    type="text"
                    v-model="form.name"
                    class="form-control"
                    required
                    id="name"
                    placeholder="Role Name"
                  />
                  <div class="text-danger" v-if="form.errors.name">
                    <small>{{ form.errors.name }}</small>
                  </div>
                </div>
                <div class="col-12 text-primary mt-3">
                  <h6>Permissions</h6>
                  <hr />
                </div>
                <div
                  class="form-group col-md-3"
                  v-for="item in permissions"
                  :key="item.id"
                >
                  <div
                    class="custom-control custom-checkbox custom-control-inline"
                  >
                    <input
                      type="checkbox"
                      class="custom-control-input"
                      :id="'permissions' + item.id"
                      :value="item.id"
                      v-model="form.permissions"
                    />
                    <label
                      class="custom-control-label"
                      :for="'permissions' + item.id"
                      >{{ item.display_name }}
                    </label>
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
              {{ action }} Role
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
  permissions: Object,
  item: Number,
});

function saveForm() {
  if (props.action == "Edit") {
    props.form.put(route("roles.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("roles.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

