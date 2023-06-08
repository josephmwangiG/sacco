<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="user-post-data px-3 pt-3">
            <div class="d-flex flex-wrap pb-0 mb-0">
              <div class="media-support-user-img mr-3">
                <img class="rounded-circle img-fluid" src="/images/user/01.jpg" alt="" />
              </div>
              <div class="media-support-info">
                <h5 class="mb-0">
                  <a href="#" class="">{{ member.user.first_name }} {{ member.user.last_name }}</a>
                </h5>
                <p class="mb-0 text-primary">
                  {{ title }}
                </p>
              </div>

            </div>
            <hr />
          </div>

          <div class="iq-card-body pt-0">
            <div class="items-tabs">
              <div class="d-flex justify-content-between">
                <div class="tabs-menu" style="overflow-y: hidden;">

                  <Link class="tab" :href="route('members.edit', member.id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/members/' + member.id) ? 'active-tab' : ''"><i
                      class="ri-home-3-line mr-2"></i><span>Details</span></label>
                  </Link>
                  <Link class="tab" :href="route('members.assets', member.id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/members/assets') ? 'active-tab' : ''"><i
                      class="ri-database-line mr-2"></i><span>Assets</span></label>
                  </Link>
                  <Link class="tab" :href="route('members.deposits', member.id)">
                  <label class="pb-0 mb-0"
                    :class="usePage().url.value.startsWith('/members/deposits') ? 'active-tab' : ''"><i
                      class="ri-login-circle-line mr-2"></i><span>Deposits</span></label>
                  </Link>
                  <Link class="tab" :href="'#'">
                  <label class="pb-0 mb-0" :class="usePage().url.value.startsWith('/memberss') ? 'active-tab' : ''"><i
                      class="ri-bar-chart-line mr-2"></i><span>Dividends</span></label>
                  </Link>
                  <Link class="tab" :href="route('members.loans', member.id)">
                  <label class="pb-0 mb-0" :class="usePage().url.value.startsWith('/members/loans') ? 'active-tab' : ''"><i
                      class="ri-stack-line mr-2"></i><span>Active Loans</span></label>
                  </Link>
                  <Link class="tab" :href="route('members.applications', member.id)">
                  <label class="pb-0 mb-0" :class="usePage().url.value.startsWith('/members/applications') ? 'active-tab' : ''"><i
                      class="ri-checkbox-line mr-2"></i><span>Applications</span></label>
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
  member: Object,
  title: String,
});
</script>