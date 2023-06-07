<template>
  <EditApplication :loanApplication="loanApplication" :active="'reject'">
    <form @submit.prevent="saveForm()">
      <div class="new-user-info">
        <div class="row">
          <div class="form-group col-md-12">
            <label for="rejection_notes">Rejection Notes:</label>
            <textarea
              rows="6"
              class="form-control"
              id="rejection_notes"
              v-model="form.rejection_notes"
              placeholder="Rejection Notes"
            ></textarea>
            <div class="text-danger" v-if="form.errors.rejection_notes">
              <small>{{ form.errors.rejection_notes }}</small>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer mt-3" v-if="loanApplication.rejected_on == null">
        <button type="submit" class="btn btn-dark">Reject Loan</button>
      </div>
      <div class="modal-footer mt-3" v-else>
        <button type="button" class="btn btn-danger">Rejected Loan</button>
      </div>
    </form>
  </EditApplication>
</template>

<script setup>
import { usePage, useForm } from "@inertiajs/inertia-vue3";
import EditApplication from "./EditApplication.vue";
import { ref } from "vue";

const props = defineProps({
  loanApplication: Object,
});

let form = ref(
  useForm({
    rejection_notes: props.loanApplication.rejection_notes,
  })
);

const users = usePage().props.value.users;

function saveForm() {
  form.value.put(
    route("loanApplications.reject.store", props.loanApplication.id),
    {
      onSuccess: () => {},
    }
  );
}
</script>

