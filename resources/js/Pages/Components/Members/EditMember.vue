<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="row">
          <div class="col-md-3">
            <div class="iq-card iq-card-block iq-card-stretch">
              <div class="iq-card-body">
                <nav class="iq-sidebar-menu">
                  <ul id="iq-sidebar-toggle" class="iq-menu">
                    <li class="iq-menu-title">
                      <i class="ri-subtract-line"></i><span>Options</span>
                    </li>
                    <li>
                      <Link
                        :href="route('members.edit', member.id)"
                        class="iq-waves-effect"
                        ><i class="ri-home-3-line"></i
                        ><span>Details</span></Link
                      >
                    </li>
                    <li>
                      <Link
                        :href="route('members.assets', member.id)"
                        class="iq-waves-effect"
                        aria-expanded="false"
                        ><i class="ri-database-line"></i
                        ><span>Assets</span></Link
                      >
                    </li>
                    <li class="iq-menu-title">
                      <i class="ri-subtract-line"></i><span>Transactions</span>
                    </li>
                    <li>
                      <Link
                        :href="route('members.deposits', member.id)"
                        class="iq-waves-effect"
                        aria-expanded="false"
                        ><i class="ri-login-circle-line"></i
                        ><span>Deposits</span></Link
                      >
                    </li>

                    <li>
                      <Link
                        :href="route('members.withdrawals', member.id)"
                        class="iq-waves-effect"
                        aria-expanded="false"
                        ><i class="ri-bar-chart-line"></i
                        ><span>Withdrawals</span></Link
                      >
                    </li>

                    <li class="iq-menu-title">
                      <i class="ri-subtract-line"></i><span>Loans</span>
                    </li>

                    <li>
                      <Link
                        :href="route('members.loans', member.id)"
                        preserve-state
                        ><i class="ri-stack-line"></i>Active Loans</Link
                      >
                    </li>
                    <li>
                      <Link
                        :href="route('members.applications', member.id)"
                        preserve-state
                        ><i class="ri-checkbox-line"></i>Applications</Link
                      >
                    </li>
                    <div class="py-3"></div>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
          <div class="col-lg-9 col-md-9">
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
                      <a href="#" class="">{{ title }}</a>
                    </h5>
                    <p class="mb-0 text-primary">
                      {{ member.first_name }} {{ member.last_name }}
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
                          >29 mins <i class="ri-more-2-line ml-3"></i
                        ></a>
                      </span>
                      <div class="dropdown-menu dropdown-menu-right p-0">
                        <a class="dropdown-item" href="#"
                          ><i class="ri-user-unfollow-line mr-2"></i>Unfollow</a
                        >
                        <a class="dropdown-item" href="#"
                          ><i class="ri-share-forward-line mr-2"></i>Share</a
                        >
                        <a class="dropdown-item" href="#"
                          ><i class="ri-file-copy-line mr-2"></i>Copy Link</a
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