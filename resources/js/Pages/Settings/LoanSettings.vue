<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Interest Types</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Interest Type</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in interestTypes" :key="index">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.description }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to
                  {{ interestTypes.length > 10 ? "10" : interestTypes.length }}
                  of {{ interestTypes.length }} entries</span
                >
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Loan Payment Frequency</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Frequency</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in paymentFrequencies" :key="index">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.description }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to
                  {{
                    paymentFrequencies.length > 10
                      ? "10"
                      : paymentFrequencies.length
                  }}
                  of {{ paymentFrequencies.length }} entries</span
                >
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Penalty Types</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Penalty Type</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in penaltyTypes" :key="index">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.description }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to
                  {{ penaltyTypes.length > 10 ? "10" : penaltyTypes.length }}
                  of {{ penaltyTypes.length }} entries</span
                >
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Penalty Frequency</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Frequency</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in penaltyFrequencies" :key="index">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.description }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to
                  {{
                    penaltyFrequencies.length > 10
                      ? "10"
                      : penaltyFrequencies.length
                  }}
                  of {{ penaltyFrequencies.length }} entries</span
                >
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <Confirm :url="url" />
  </Main>
</template>
<script setup>
const props = defineProps({
  interestTypes: Object,
  paymentFrequencies: Object,
  penaltyFrequencies: Object,
  penaltyTypes: Object,
});
</script>
