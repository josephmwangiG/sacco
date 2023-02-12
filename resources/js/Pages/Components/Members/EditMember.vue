<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-body profile-page p-0">
            <div class="profile-header">
              <div class="cover-container collapse">
                <img
                  src="/images/page-img/profile-bg.jpg"
                  alt="profile-bg"
                  class="rounded img-fluid"
                />
                <ul class="header-nav d-flex flex-wrap justify-end p-0 m-0">
                  <li>
                    <Link href="#"><i class="ri-pencil-line"></i></Link>
                  </li>
                  <li>
                    <a href="javascript:void();"
                      ><i class="ri-settings-4-line"></i
                    ></a>
                  </li>
                </ul>
              </div>
              <div class="profile-info p-4">
                <div class="row">
                  <div class="col-sm-12 col-md-6">
                    <div class="user-detail pl-5">
                      <div class="d-flex flex-wrap align-items-center">
                        <div class="profile-img pr-4 collapse">
                          <img
                            src="/images/user/11.png"
                            alt="profile-img"
                            class="avatar-130 img-fluid"
                          />
                        </div>
                        <div class="profile-detail d-flex align-items-center">
                          <h3>
                            {{ member.first_name }} {{ member.last_name }}
                          </h3>
                          <p class="m-0 pl-3">- Member</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-12 col-md-6">
                    <ul
                      class="
                        nav nav-pills
                        d-flex
                        align-items-end
                        float-right
                        profile-feed-items
                        p-0
                        m-0
                      "
                    >
                      <li>
                        <a
                          class="nav-link"
                          data-toggle="pill"
                          href="#profile-activity"
                          >Activity</a
                        >
                      </li>
                      <li>
                        <a
                          class="nav-link"
                          data-toggle="pill"
                          href="#profile-profile"
                          >profile</a
                        >
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12">
        <div class="row">
          <div class="col-lg-3 profile-left">
            <div class="iq-card">
              <div class="iq-card-body">
                <nav class="iq-sidebar-menu">
                  <ul id="iq-sidebar-toggle" class="iq-menu">
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

                    <li>
                      <a
                        href="#u_loans"
                        class="iq-waves-effect collapsed"
                        data-toggle="collapse"
                        aria-expanded="false"
                        ><i class="ri-list-check"></i><span>Loans</span
                        ><i class="ri-arrow-right-s-line iq-arrow-right"></i
                      ></a>
                      <ul
                        id="u_loans"
                        class="iq-submenu collapse"
                        data-parent="#iq-sidebar-toggle"
                      >
                        <li>
                          <a href="#" preserve-state
                            ><i class="ri-stack-line"></i>Active Loans</a
                          >
                        </li>
                        <li>
                          <a href="#" preserve-state
                            ><i class="ri-checkbox-line"></i>Applications</a
                          >
                        </li>
                        <!-- <li>
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
                        </li> -->
                      </ul>
                    </li>
                    <div class="py-3"></div>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
          <div class="col-lg-9 profile-center">
            <div class="tab-content">
              <div
                class="tab-pane fade active show"
                id="profile-feed"
                role="tabpanel"
              >
                <div class="iq-card">
                  <div class="iq-card-body p-0">
                    <div class="user-post-data p-3">
                      <div class="d-flex flex-wrap">
                        <div class="media-support-user-img mr-3">
                          <img
                            class="rounded-circle img-fluid"
                            src="/images/user/01.jpg"
                            alt=""
                          />
                        </div>
                        <div class="media-support-info mt-2">
                          <h5 class="mb-0">
                            <a href="#" class="">{{ title }}</a>
                          </h5>
                          <p class="mb-0 text-primary">profile</p>
                        </div>
                        <div
                          class="
                            iq-card-header-toolbar
                            d-flex
                            align-items-center
                          "
                        >
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
                                ><i class="ri-user-unfollow-line mr-2"></i
                                >Unfollow</a
                              >
                              <a class="dropdown-item" href="#"
                                ><i class="ri-share-forward-line mr-2"></i
                                >Share</a
                              >
                              <a class="dropdown-item" href="#"
                                ><i class="ri-file-copy-line mr-2"></i>Copy
                                Link</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="iq-card-body">
                      <slot />
                    </div>
                  </div>
                </div>
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