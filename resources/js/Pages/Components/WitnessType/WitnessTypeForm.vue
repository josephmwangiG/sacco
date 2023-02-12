<template>
  <div
    class="modal fade"
    id="formModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="formModal"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document">
      <div class="modal-content modal-div">
        <div class="modal-header">
          <h5 class="modal-title" id="formModal">{{ action }} Witness Type.</h5>
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
                <div class="form-group col-md-12">
                  <label for="name">Witness Type Name:</label>
                  <input
                    type="text"
                    v-model="form.name"
                    class="form-control"
                    required
                    id="name"
                    placeholder="Witness Type"
                  />
                  <div class="text-danger" v-if="form.errors.name">
                    <small>{{ form.errors.name }}</small>
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
              {{ action }} Witness Type
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
    props.form.put(route("witnessTypes.update", props.item), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  } else {
    props.form.post(route("witnessTypes.store"), {
      onSuccess: () => {
        props.form.reset();
        document.getElementById("closeModal").click();
      },
    });
  }
}
</script>

