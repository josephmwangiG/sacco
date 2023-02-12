<template>
  <Main>
    <div class="row">
      <div class="col-md-12 col-lg-12">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Account Classes</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table class="table mb-0 table-borderless">
                <thead>
                  <tr>
                    <th scope="col">Account Class</th>
                    <th scope="col">Category</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(account, index) in accounts.accountClasses"
                    :key="index"
                  >
                    <td>{{ account.name }}</td>
                    <td>{{ account.category }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <div
          class="
            iq-card iq-card-block iq-card-stretch iq-card-height
            overflow-hidden
          "
        >
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Account Types</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table class="table mb-0 table-borderless">
                <thead>
                  <tr>
                    <th scope="col">Account Type</th>
                    <th scope="col">Code</th>
                    <th scope="col">Class</th>
                    <th scope="col">Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(account, index) in accounts.accountTypes"
                    :key="index"
                  >
                    <td>{{ account.name }}</td>
                    <td>{{ account.code }}</td>
                    <td>{{ account.account_class.name }}</td>
                    <td>
                      {{ account.description }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
const props = defineProps({
  accounts: Object,
  filters: Object,
});
</script>