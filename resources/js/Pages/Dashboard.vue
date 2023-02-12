<template>
  <Main>
    <div class="row">
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height-half">
          <div class="iq-card-body p-0">
            <div class="p-3 bg-primary dark-icon b-3 rounded position-relative">
              <div class="d-flex align-items-center justify-content-between">
                <div
                  class="icon iq-icon-box bg-primary dark-icon rounded border"
                  data-wow-delay="0.2s"
                >
                  <i class="ri-user-fill"></i>
                </div>
                <div class="ml-2">
                  <a
                    href="javascript:void();"
                    class="d-flex align-items-center mr-4"
                  >
                    <span class="bg-white p-1 rounded mr-2"></span>
                    <p class="text-white mb-0">Leads</p>
                  </a>
                  <div id="progress-chart-1"></div>
                </div>
              </div>
            </div>
            <div class="d-flex align-items-center pb-3">
              <div class="col-lg-6">
                <div class="ml-2">
                  <h5 class="mb-1">New Leads</h5>
                  <span
                    class="h4 text-dark mb-0 counter d-inline-block w-100"
                    >{{ leads.length }}</span
                  >
                </div>
              </div>
              <div class="col-lg-6">
                <div
                  class="
                    d-flex
                    align-items-center
                    justify-content-between
                    mt-4
                    position-relative
                  "
                >
                  <div
                    class="
                      iq-progress-bar
                      bg-primary-light
                      mt-3
                      iq-progress-bar-icon
                    "
                  >
                    <span
                      class="
                        bg-primary
                        iq-progress
                        progress-1
                        position-relative
                      "
                      data-percent="10"
                    >
                      <span class="progress-text text-primary">10%</span>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height-half">
          <div class="iq-card-body p-0">
            <div class="p-3 bg-info mb-3 rounded position-relative">
              <div class="d-flex align-items-center justify-content-between">
                <div
                  class="icon iq-icon-box bg-info rounded border"
                  data-wow-delay="0.2s"
                >
                  <i class="ri-user-fill"></i>
                </div>
                <div class="ml-2">
                  <a
                    href="javascript:void();"
                    class="d-flex align-items-center mr-4"
                  >
                    <span class="bg-white p-1 rounded mr-2"></span>
                    <p class="text-white mb-0">Active Members</p>
                  </a>
                  <div id="progress-chart-2"></div>
                </div>
              </div>
            </div>
            <div class="d-flex align-items-center pb-3">
              <div class="col-lg-6">
                <div class="ml-2">
                  <h5 class="mb-1">Members</h5>
                  <span
                    class="h4 text-dark mb-0 counter d-inline-block w-100"
                    >{{ members.length }}</span
                  >
                </div>
              </div>
              <div class="col-lg-6">
                <div
                  class="
                    d-flex
                    align-items-center
                    justify-content-between
                    mt-4
                    position-relative
                  "
                >
                  <div
                    class="
                      iq-progress-bar
                      bg-info-light
                      mt-3
                      iq-progress-bar-icon
                    "
                  >
                    <span
                      class="bg-info iq-progress progress-1 position-relative"
                      data-percent="20"
                    >
                      <span class="progress-text text-info">20%</span>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8 col-md-6">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Status Level</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
              <div class="dropdown">
                <span
                  class="dropdown-toggle"
                  id="dropdownMenuButton2"
                  data-toggle="dropdown"
                >
                  <i class="ri-more-fill"></i>
                </span>
                <div
                  class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="dropdownMenuButton2"
                  style=""
                >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-eye-fill mr-2"></i>View</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-delete-bin-6-fill mr-2"></i>Delete</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-pencil-fill mr-2"></i>Edit</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-printer-fill mr-2"></i>Print</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-file-download-fill mr-2"></i>Download</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="iq-card-body">
            <div id="progress-chart-4"></div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle dark-icon bg-primary">
                <i class="ri-home-heart-line"></i>
              </div>
              <div>
                <h5 class="mb-0">Branches</h5>
                <span
                  class="h4 text-primary mb-0 counter d-inline-block w-100"
                  >{{ branches.length }}</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle bg-success">
                <i class="las la-user-friends" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Members</h5>
                <span
                  class="h4 text-success mb-0 counter d-inline-block w-100"
                  >{{ members.length }}</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle bg-danger">
                <i class="las la-user-clock"></i>
              </div>
              <div>
                <h5 class="mb-0">Leads</h5>
                <span
                  class="h4 text-danger mb-0 counter d-inline-block w-100"
                  >{{ leads.length }}</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body iq-box-relative">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle bg-warning">
                <i class="fa fa-handshake-o" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Active Loans</h5>
                <span
                  class="h4 text-warning mb-0 counter d-inline-block w-100"
                  >{{ loans_total.toLocaleString("en-US") }}</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body iq-box-relative">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle bg-info">
                <i class="ri-building-line" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Members Deposit</h5>
                <span class="h4 text-info mb-0 counter d-inline-block w-100">{{
                  deposits_total.toLocaleString("en-US")
                }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-4">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body iq-box-relative">
            <div
              class="
                d-flex
                align-items-center
                justify-content-between
                text-right
              "
            >
              <div class="icon iq-icon-box rounded-circle bg-secondary">
                <i class="las la-chalkboard-teacher" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Withdrawals</h5>
                <span
                  class="h4 text-secondary mb-0 counter d-inline-block w-100"
                  >{{ withdrawals_total.toLocaleString("en-US") }}</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Recent Applications</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
              <div class="dropdown">
                <span
                  class="dropdown-toggle"
                  id="dropdownMenuButton3"
                  data-toggle="dropdown"
                >
                  <i class="ri-more-fill"></i>
                </span>
                <div
                  class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="dropdownMenuButton3"
                  style=""
                >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-eye-fill mr-2"></i>View</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-delete-bin-6-fill mr-2"></i>Delete</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-pencil-fill mr-2"></i>Edit</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-printer-fill mr-2"></i>Print</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ri-file-download-fill mr-2"></i>Download</a
                  >
                </div>
              </div>
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
                    <th>Member</th>
                    <th>Loan</th>
                    <th>Interest</th>
                    <th>Amount</th>
                    <th>Service Fee</th>
                    <th>Status</th>
                    <th>Application Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in applications" :key="index">
                    <td>
                      {{ obj.member.first_name }} {{ obj.member.last_name }}
                    </td>
                    <td>{{ obj.loan_type.name }}</td>
                    <td>{{ obj.interest_rate }}</td>
                    <td>{{ obj.amount_applied }}</td>
                    <td>{{ obj.service_fee }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >Active</span
                      >
                    </td>
                    <td>{{ obj.application_date.substring(0, 10) }}</td>
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
  applications: Object,
  branches: Object,
  members: Object,
  loans: Object,
  loans_total: Number,
  deposits_total: Number,
  withdrawals_total: Number,
  deposits: Object,
  withdrawals: Object,
  payments: Object,
  leads: Object,
});
</script>