<template>
  <div class="wrapper">
    <!-- Sidebar  -->
    <Sidebar />
    <!-- TOP Nav Bar -->
    <TopNavbar />
    <!-- TOP Nav Bar END -->
    <div id="content-page" class="content-page">
      <div class="container-fluid">
        <div class="alert alert-success" v-if="$page.props.flash.success">
          {{ $page.props.flash.success }}
        </div>
        <div class="alert alert-danger" v-if="$page.props.flash.danger">
          {{ $page.props.flash.danger }}
        </div>
        <slot />
      </div>
    </div>
  </div>
  <!-- Wrapper END -->
  <!-- Footer -->
  <Footer />
  <nav class="iq-float-menu">
    <input
      type="checkbox"
      href="#"
      class="iq-float-menu-open"
      name="menu-open"
      id="menu-open"
    />
    <label class="iq-float-menu-open-button" for="menu-open">
      <span class="lines line-1"></span>
      <span class="lines line-2"></span>
      <span class="lines line-3"></span>
    </label>
    <button
      class="iq-float-menu-item bg-info"
      data-toggle="tooltip"
      data-placement="top"
      title="Direction Mode"
      data-mode="rtl"
    >
      <i class="ri-text-direction-r"></i>
    </button>
    <button
      class="iq-float-menu-item bg-danger"
      data-toggle="tooltip"
      data-placement="top"
      title="Color Mode"
      id="dark-mode"
      data-active="true"
    >
      <i class="ri-sun-line"></i>
    </button>
    <button
      class="iq-float-menu-item bg-warning"
      data-toggle="tooltip"
      data-placement="top"
      title="Comming Soon"
    >
      <i class="ri-palette-line"></i>
    </button>
  </nav>
</template>
<script>
export default {};
</script>