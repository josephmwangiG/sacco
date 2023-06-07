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
            <ul class="nav nav-tabs" id="myTab-2" role="tablist">
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'details' ? 'active' : ''"
                  :href="route('loanApplications.edit', loanApplication.id)"
                  ><i
                    class="ri-list-settings-line pr-1"
                    style="font-size: 20px"
                  ></i>
                  Details</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  :class="active == 'witness' ? 'active' : ''"
                  class="nav-link"
                  v-if="loanApplication.rejected_on == null"
                  :href="route('loanApplications.witness', loanApplication.id)"
                  ><i class="ri-ball-pen-fill pr-1" style="font-size: 20px"></i>
                  Witness</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'guarantors' ? 'active' : ''"
                  :href="
                    route('loanApplications.guarantors', loanApplication.id)
                  "
                  v-if="loanApplication.rejected_on == null"
                  ><i class="ri-safe-fill pr-1" style="font-size: 20px"></i>
                  Guarantors</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'collaterals' ? 'active' : ''"
                  :href="
                    route('loanApplications.collaterals', loanApplication.id)
                  "
                  v-if="loanApplication.rejected_on == null"
                  ><i class="ri-refund-fill pr-1" style="font-size: 20px"></i>
                  Collateral</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'disbursement' ? 'active' : ''"
                  :href="
                    route('loanApplications.disbursement', loanApplication.id)
                  "
                  v-if="loanApplication.rejected_on == null"
                  ><i
                    class="ri-send-plane-fill pr-1"
                    style="font-size: 20px"
                  ></i>
                  Disbursement</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'confirm' ? 'active' : ''"
                  :href="route('loanApplications.confirm', loanApplication.id)"
                  v-if="loanApplication.rejected_on == null"
                  ><i
                    class="ri-check-double-line pr-1"
                    style="font-size: 20px"
                  ></i>
                  Confirm</Link
                >
              </li>
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'reject' ? 'active' : ''"
                  :href="route('loanApplications.reject', loanApplication.id)"
                  v-if="loanApplication.approved_on == null"
                  ><i class="ri-close-line pr-1" style="font-size: 20px"></i>
                  Reject</Link
                >
              </li>
            </ul>

            <slot />
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
const props = defineProps({
  loanApplication: Object,
  active: String,
});
</script>