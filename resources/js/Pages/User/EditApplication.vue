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
            <ul class="nav nav-tabs" id="myTab-2" role="tablist">
              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'details' ? 'active' : ''"
                  :href="route('u.view.loan', id)"
                  ><i
                    class="ri-list-settings-line pr-1"
                    style="font-size: 20px"
                  ></i>
                  Details</Link
                >
              </li>

              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'collaterals' ? 'active' : ''"
                  :href="route('u.activeLoans.collateral', id)"
                  ><i class="ri-refund-fill pr-1" style="font-size: 20px"></i>
                  Collateral</Link
                >
              </li>

              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'guarantors' ? 'active' : ''"
                  :href="route('u.activeLoans.guarantors', id)"
                  ><i class="ri-safe-fill pr-1" style="font-size: 20px"></i>
                  Guarantors</Link
                >
              </li>

              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'payments' ? 'active' : ''"
                  :href="route('u.activeLoans.payments', id)"
                  ><i
                    class="ri-money-dollar-circle-line pr-1"
                    style="font-size: 20px"
                  ></i>
                  Payments</Link
                >
              </li>

              <li class="nav-item">
                <Link
                  class="nav-link"
                  :class="active == 'accrue' ? 'active' : ''"
                  :href="route('u.activeLoans.accrue', id)"
                  ><i class="ri-edit-box-line pr-1" style="font-size: 20px"></i>
                  Accrue</Link
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
  id: Number,
  active: String,
});
</script>