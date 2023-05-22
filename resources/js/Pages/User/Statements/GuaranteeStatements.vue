<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-body">
            <div class="d-flex justify-content-between my-2">
              <h5>Guarantees Statements</h5>
            </div>
            <div>
              <PDFViewer
                :source="route('u.guarantees.statements.pdf')"
                style="height: 70vh; width: 100%"
                @download="handleDownload"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { ref } from "vue";
import PDFViewer from "pdf-viewer-vue";
</script>