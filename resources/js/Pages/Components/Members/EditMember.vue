<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="user-post-data px-3 pt-3">
            <div class="d-flex flex-wrap pb-0 mb-0">
              <div class="media-support-user-img mr-3">
                <img
                  class="rounded-circle img-fluid"
                  src="/images/user/01.jpg"
                  alt=""
                />
              </div>
              <div class="media-support-info">
                <h5 class="mb-0">
                  <a href="#" class=""
                    >{{ member.user.first_name }} {{ member.user.last_name }}</a
                  >
                </h5>
                <p class="mb-0 text-primary">
                  {{ title }}
                </p>
              </div>
              <div class="iq-card-header-toolbar d-flex align-items-center">
                <div class="dropdown">
                  <span
                    class="dropdown-toggle text-primary"
                    id="dropdownMenuButton52"
                    data-toggle="dropdown"
                  >
                    <a href="#" class="text-secondary"
                      >More Options <i class="ri-more-2-line ml-3"></i
                    ></a>
                  </span>
                  <div class="dropdown-menu dropdown-menu-right p-0">
                    <Link
                      :href="route('members.edit', member.id)"
                      class="dropdown-item"
                      ><i class="ri-home-3-line mr-2"></i
                      ><span>Details</span></Link
                    >
                    <Link
                      :href="route('members.assets', member.id)"
                      class="dropdown-item"
                      ><i class="ri-database-line mr-2"></i
                      ><span>Assets</span></Link
                    >
                    <Link
                      :href="route('members.deposits', member.id)"
                      class="dropdown-item"
                      ><i class="ri-login-circle-line mr-2"></i
                      ><span>Deposits</span></Link
                    >
                    <Link
                      :href="route('members.withdrawals', member.id)"
                      class="dropdown-item"
                      ><i class="ri-bar-chart-line mr-2"></i
                      ><span>Withdrawals</span></Link
                    >
                    <Link
                      :href="route('members.loans', member.id)"
                      class="dropdown-item"
                      ><i class="ri-stack-line mr-2"></i
                      ><span>Active Loans</span></Link
                    >
                    <Link
                      :href="route('members.applications', member.id)"
                      class="dropdown-item"
                      ><i class="ri-checkbox-line mr-2"></i
                      ><span>Applications</span></Link
                    >
                  </div>
                </div>
              </div>
            </div>
            <hr />
          </div>
          <div class="iq-card-body pt-0">
            <slot />
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
const props = defineProps({
  member: Object,
  title: String,
});
</script>