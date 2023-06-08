<template>
  <div class="iq-sidebar">
    <div class="iq-sidebar-logo d-flex justify-content-between">
      <a href="/">
        <div class="iq-light-logo">
          <!-- <img src="/images/logo.gif" class="img-fluid" alt="" /> -->
        </div>
        <div class="iq-dark-logo">
          <!-- <img src="/images/logo-dark.gif" class="img-fluid" alt="" /> -->
        </div>
        <span style="text-transform: uppercase; font-size: 20px">PS CLUB</span>
      </a>
      <div class="iq-menu-bt-sidebar">
        <div class="iq-menu-bt align-self-center">
          <div class="wrapper-menu">
            <div class="main-circle">
              <i class="ri-arrow-left-s-line"></i>
            </div>
            <div class="hover-circle">
              <i class="ri-arrow-right-s-line"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="sidebar-scrollbar">
      <AdminSidebar v-if="user.role_id != 1 && user.role_id != 0" />
      <SuperAdminSidebar v-if="user.role_id == 1" />
      <USidebar v-if="user.role_id == 0" />
      <div class="p-3"></div>
    </div>
  </div>
</template>
<script setup>
import { usePage } from "@inertiajs/inertia-vue3";
import AdminSidebar from "./AdminSidebar.vue";
import USidebar from "./USidebar.vue";
import SuperAdminSidebar from "./SuperAdminSidebar.vue";
const user = usePage().props.value.user;
</script>