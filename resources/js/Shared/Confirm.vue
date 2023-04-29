<template>
  <div
    class="modal fade"
    id="confirm"
    tabindex="-1"
    role="dialog"
    aria-labelledby="confirmLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmLabel">Delete Item</h5>
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-label="Close"
          >
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body modal-div">
          Are you sure to delete this item?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
            Close
          </button>
          <Link
            method="delete"
            :href="props.url"
            class="btn btn-primary"
            preserve-scroll
            @click="$emit('deleted')"
            data-dismiss="modal"
          >
            Confirm
          </Link>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup type="text/javascript">
const props = defineProps({
  url: String,
});

const emit = defineEmits(["deleted"]);
</script>