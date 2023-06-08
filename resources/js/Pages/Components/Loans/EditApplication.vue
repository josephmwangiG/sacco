<template>
  <Main>
    <div class="row">
      <div class="col-sm-12 col-lg-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Active Loan</h4>
            </div>
          </div>
          <div class="iq-card-body">

            <hr class="mt-0">
            <div class="items-tabs">
              <div class="d-flex justify-content-between">
                <div class="tabs-menu" style="overflow-y: hidden;">

                  <Link class="tab" :href="route('activeLoans.edit', id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/activeLoans/' + id) ? 'active-tab' : ''"><i
                      class="ri-list-settings-line pr-1" style="font-size: 20px"></i>
                    Details</label>
                  </Link>
                  <Link class="tab" :href="route('activeLoans.guarantors', id)
                    ">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/activeLoans/guarantors') ? 'active-tab' : ''"><i
                      class="ri-safe-fill pr-1" style="font-size: 20px"></i>
                    Guarantors</label>
                  </Link>
                  <Link class="tab" :href="route('activeLoans.collateral', id)
                    ">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/activeLoans/collateral') ? 'active-tab' : ''"><i
                      class="ri-refund-fill pr-1" style="font-size: 20px"></i>
                    Collateral</label>
                  </Link>
                  <Link class="tab" :href="route('activeLoans.payments', id)
                    ">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/activeLoans/payments') ? 'active-tab' : ''"><i
                      class="ri-money-dollar-circle-line pr-1" style="font-size: 20px"></i>
                    Payments</label>
                  </Link>
                  <Link class="tab" :href="route('activeLoans.accrue', id)
                    ">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/activeLoans/accrue') ? 'active-tab' : ''"><i
                      class="ri-edit-box-line pr-1" style="font-size: 20px"></i>
                    Accrue</label>
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
  id: Number,
  active: String,
});
</script>