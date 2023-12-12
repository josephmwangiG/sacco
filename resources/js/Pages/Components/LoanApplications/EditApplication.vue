<template>
  <Main>
    <div class="row">
      <div class="col-sm-12 col-lg-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Loan Application</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <hr class="mt-0">
            <div class="items-tabs">
              <div class="d-flex justify-content-between">
                <div class="tabs-menu" style="overflow-y: hidden;">

                  <Link class="tab" :href="route('loanApplications.edit', loanApplication.id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/' + loanApplication.id) ? 'active-tab' : ''"><i
                      class="ri-list-settings-line pr-1" style="font-size: 20px"></i>
                    Details</label>
                  </Link>
                  <Link class="tab" v-if="loanApplication.rejected_on == null"
                    :href="route('loanApplications.witness', loanApplication.id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/witness') ? 'active-tab' : ''"><i
                      class="ri-ball-pen-fill pr-1" style="font-size: 20px"></i>
                    Witness</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.guarantors', loanApplication.id)
                    " v-if="loanApplication.rejected_on == null">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/guarantors') ? 'active-tab' : ''"><i
                      class="ri-safe-fill pr-1" style="font-size: 20px"></i>
                    Guarantors</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.approval', loanApplication.id)
                    " v-if="loanApplication.rejected_on == null">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/approval') ? 'active-tab' : ''"><i
                      class="ri-refund-fill pr-1" style="font-size: 20px"></i>
                    Loan Approval</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.collaterals', loanApplication.id)
                    " v-if="loanApplication.rejected_on == null">
                  <label class="pb-0 mb-0 collapse"
                    :class="usePage().url.value.startsWith('/loanApplications/collaterals') ? 'active-tab' : ''"><i
                      class="ri-refund-fill pr-1" style="font-size: 20px"></i>
                    Collateral</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.disbursement', loanApplication.id)
                    " v-if="loanApplication.rejected_on == null">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/disbursement') ? 'active-tab' : ''"><i
                      class="ri-send-plane-fill pr-1" style="font-size: 20px"></i>
                    Disbursement</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.confirm', loanApplication.id)"
                    v-if="loanApplication.rejected_on == null">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/confirm') ? 'active-tab' : ''"><i
                      class="ri-check-double-line pr-1" style="font-size: 20px"></i>
                    Confirm</label>
                  </Link>
                  <Link class="tab" :href="route('loanApplications.reject', loanApplication.id)"
                    v-if="loanApplication.approved_on == null">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/loanApplications/reject') ? 'active-tab' : ''"><i
                      class="ri-close-line pr-1" style="font-size: 20px"></i>
                    Reject</label>
                  </Link>

                </div>

              </div>
              <div class="tab-content-wrapper pt-0 mt-0 mb-3">
              </div>
            </div>
            <slot />
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
import { usePage } from '@inertiajs/inertia-vue3';
const props = defineProps({
  loanApplication: Object,
  active: String,
});
</script>