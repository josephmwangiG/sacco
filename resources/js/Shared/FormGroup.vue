<template>
  <div class="form-group">
    <label :for="name"> {{ label }}</label>
    <input
      :type="type"
      :required="required"
      class="form-control mb-0"
      v-model="value"
      :id="name"
      :placeholder="label"
    />
  </div>
</template>
<script setup>
defineProps({
  label: String,
  name: String,
  type: String,
  required: Boolean,
  value: [String, Number],
});
</script>