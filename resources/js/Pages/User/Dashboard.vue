<template>
  <Main>
    <div class="row">
      <div class="col-sm-6 col-md-6 col-lg-3">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height" style="border-radius: 0px">
          <div class="iq-card-body iq-box-relative">
            <div class="d-flex align-items-center justify-content-between text-right">
              <div class="icon iq-icon-box rounded-circle bg-warning">
                <i class="fa fa-handshake-o" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Loans</h5>
                <span class="h5 text-warning mb-0 counter d-inline-block w-100">{{ loans_total.toLocaleString("en-US")
                }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-3">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height" style="border-radius: 0px">
          <div class="iq-card-body iq-box-relative">
            <div class="d-flex align-items-center justify-content-between text-right">
              <div class="icon iq-icon-box rounded-circle bg-danger">
                <i class="fa fa-money" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Deposits</h5>
                <span class="h5 text-info mb-0 counter d-inline-block w-100">{{
                  deposits_total.toLocaleString("en-US")
                }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-3">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height" style="border-radius: 0px">
          <div class="iq-card-body iq-box-relative">
            <div class="d-flex align-items-center justify-content-between text-right">
              <div class="icon iq-icon-box rounded-circle bg-secondary">
                <i class="las la-chalkboard-teacher" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Withdrawals</h5>
                <span class="h5 text-secondary mb-0 counter d-inline-block w-100">{{
                  withdrawals_total.toLocaleString("en-US") }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-6 col-lg-3">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height" style="border-radius: 0px">
          <div class="iq-card-body iq-box-relative">
            <div class="d-flex align-items-center justify-content-between text-right">
              <div class="icon iq-icon-box rounded-circle bg-info">
                <i class="fa fa-money" aria-hidden="true"></i>
              </div>
              <div>
                <h5 class="mb-0">Dividends</h5>
                <span class="h5 text-secondary mb-0 counter d-inline-block w-100">{{
                  withdrawals_total.toLocaleString("en-US") }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12">
        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
          <div class="iq-card-body">
            <statistics />
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
                <span class="dropdown-toggle" id="dropdownMenuButton3" data-toggle="dropdown">
                  <i class="ri-more-fill"></i>
                </span>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton3" style="">
                  <a class="dropdown-item" href="#"><i class="ri-eye-fill mr-2"></i>View</a>
                  <a class="dropdown-item" href="#"><i class="ri-delete-bin-6-fill mr-2"></i>Delete</a>
                  <a class="dropdown-item" href="#"><i class="ri-pencil-fill mr-2"></i>Edit</a>
                  <a class="dropdown-item" href="#"><i class="ri-printer-fill mr-2"></i>Print</a>
                  <a class="dropdown-item" href="#"><i class="ri-file-download-fill mr-2"></i>Download</a>
                </div>
              </div>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <table id="user-list-table" class="table table-striped table-borderless mt-4" role="grid"
                aria-describedby="user-list-page-info">
                <thead>
                  <tr>
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
                    <td>{{ obj.loan_type.name }}</td>
                    <td>{{ obj.interest_rate }}</td>
                    <td>{{ obj.amount_applied }}</td>
                    <td>{{ obj.service_fee }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary">Active</span>
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
import Statistics from "./Statistics.vue";
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