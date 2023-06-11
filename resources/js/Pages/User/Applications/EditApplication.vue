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
            <div class="items-tabs">
              <div class="d-flex justify-content-between">
                <div class="tabs-menu" style="overflow-y: hidden">
                  <Link
                    class="tab"
                    :href="route('u.loanApplications.edit', loanApplication.id)"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/applications/' + loanApplication.id
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-list-settings-line pr-1"
                        style="font-size: 20px"
                      ></i>
                      Details</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    v-if="loanApplication.rejected_on == null"
                    :href="
                      route('u.loanApplications.witness', loanApplication.id)
                    "
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/witness'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-ball-pen-fill pr-1"
                        style="font-size: 20px"
                      ></i>
                      Witness</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    :href="
                      route('u.loanApplications.guarantors', loanApplication.id)
                    "
                    v-if="loanApplication.rejected_on == null"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/guarantors'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i class="ri-safe-fill pr-1" style="font-size: 20px"></i>
                      Guarantors</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    :href="
                      route(
                        'u.loanApplications.collaterals',
                        loanApplication.id
                      )
                    "
                    v-if="loanApplication.rejected_on == null"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/collaterals'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-refund-fill pr-1"
                        style="font-size: 20px"
                      ></i>
                      Collateral</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    :href="
                      route(
                        'u.loanApplications.disbursement',
                        loanApplication.id
                      )
                    "
                    v-if="loanApplication.rejected_on == null"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/disbursement'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-send-plane-fill pr-1"
                        style="font-size: 20px"
                      ></i>
                      Disbursement</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    :href="
                      route('u.loanApplications.confirm', loanApplication.id)
                    "
                    v-if="loanApplication.approved_on != null"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/confirm'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-check-double-line pr-1"
                        style="font-size: 20px"
                      ></i>
                      Confirm</label
                    >
                  </Link>
                  <Link
                    class="tab"
                    :href="
                      route('u.loanApplications.reject', loanApplication.id)
                    "
                    v-if="loanApplication.rejected_on != null"
                  >
                    <label
                      class="pb-0 mb-0"
                      :class="
                        usePage().url.value.startsWith(
                          '/u/loanApplications/reject'
                        )
                          ? 'active-tab'
                          : ''
                      "
                      ><i
                        class="ri-close-line pr-1"
                        style="font-size: 20px"
                      ></i>
                      Reject</label
                    >
                  </Link>
                </div>
              </div>
              <div class="tab-content-wrapper pt-0 mt-0 mb-3"></div>
            </div>

            <slot />
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
import { usePage } from "@inertiajs/inertia-vue3";

const props = defineProps({
  loanApplication: Number,
  active: String,
});
</script>