<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-body">
            <div class="d-flex justify-content-between mt-2">
              <h5>Active Loans</h5>
              <div class="user-list-files">
                <a class="iq-bg-primary" href="javascript:void();"> Print </a>
              </div>
            </div>
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Ref No.</th>
                    <th>Loan</th>
                    <th>Interest</th>
                    <th>Amount</th>
                    <th>Service Fee</th>
                    <th>Status</th>
                    <th>Start Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in activeLoans.data" :key="index">
                    <td>{{ obj.loan_reference_number }}</td>
                    <td>{{ obj.loanType.name }}</td>
                    <td>{{ obj.interest_rate }}</td>
                    <td>{{ obj.amount_approved }}</td>
                    <td>{{ obj.service_fee }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >Active</span
                      >
                    </td>
                    <td>{{ obj.start_date.substring(0, 10) }}</td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <div class="dropdown">
                          <span
                            class=""
                            id="dropdownMenuButton2"
                            data-toggle="dropdown"
                          >
                            <strong><i class="ri-more-fill"></i></strong>
                          </span>
                          <div
                            class="dropdown-menu dropdown-menu-right"
                            aria-labelledby="dropdownMenuButton2"
                            style=""
                          >
                            <Link
                              class="dropdown-item"
                              :href="route('u.view.loan', obj.id)"
                              ><i class="ri-eye-fill mr-2"></i> View</Link
                            >
                            <a
                              class="dropdown-item"
                              @click="activeLoan = obj"
                              href="#formModal"
                              data-toggle="modal"
                              ><i class="ri-printer-fill mr-2"></i
                              >Amortization</a
                            >
                            <a
                              class="dropdown-item"
                              href="#loanStatement"
                              @click="activeLoan = obj"
                              data-toggle="modal"
                              ><i class="ri-file-download-fill mr-2"></i
                              >Statement</a
                            >
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to
                  {{ activeLoans.total > 10 ? "10" : activeLoans.total }}
                  of {{ activeLoans.total }} entries</span
                >
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li
                      class="page-item active"
                      v-for="(link, ind) in activeLoans.links"
                      :key="ind"
                    >
                      <Link
                        class="page-link"
                        :href="link.url"
                        v-html="link.label"
                      ></Link>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="d-flex justify-content-between mt-2">
              <h5>Guaranteed Loans</h5>
              <div class="user-list-files">
                <a class="iq-bg-primary" href="javascript:void();"> Print </a>
              </div>
            </div>
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
                    <th>Loan Amount</th>
                    <th>Service Fee</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>G. Amount</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in guarantors" :key="index">
                    <td>
                      {{ obj.loan_application.member.user.first_name }}
                      {{ obj.loan_application.member.user.last_name }}
                    </td>
                    <td>{{ obj.loan_application.loan_type.name }}</td>
                    <td>{{ obj.loan_application.interest_rate }}</td>
                    <td>
                      {{
                        obj.loan_application.loan == null
                          ? obj.loan_application.amount_applied
                          : obj.loan_application.loan.amount_approved
                      }}
                    </td>
                    <td>{{ obj.loan_application.service_fee }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary">{{
                        obj.loan_application.loan == null ? "Pending" : "Active"
                      }}</span>
                    </td>
                    <td>
                      {{
                        obj.loan_application.application_date.substring(0, 10)
                      }}
                    </td>
                    <td>{{ obj.guarantee_amount }}</td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <div class="dropdown">
                          <span
                            class=""
                            id="dropdownMenuButton2"
                            data-toggle="dropdown"
                          >
                            <strong><i class="ri-more-fill"></i></strong>
                          </span>
                          <div
                            class="dropdown-menu dropdown-menu-right"
                            aria-labelledby="dropdownMenuButton2"
                            style=""
                          >
                            <Link
                              class="dropdown-item"
                              :href="route('activeLoans.edit', obj.id)"
                              ><i class="ri-pencil-fill mr-2"></i> Edit</Link
                            >
                            <a
                              class="dropdown-item"
                              @click="activeLoan = obj"
                              href="#formModal"
                              data-toggle="modal"
                              ><i class="ri-printer-fill mr-2"></i
                              >Amortization</a
                            >
                            <a
                              class="dropdown-item"
                              href="#loanStatement"
                              @click="activeLoan = obj"
                              data-toggle="modal"
                              ><i class="ri-file-download-fill mr-2"></i
                              >Statement</a
                            >
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <Amortization :activeLoan="activeLoan" v-if="activeLoan != ''" />
    <Statement :activeLoan="activeLoan" v-if="activeLoan != ''" />
    <Confirm :url="url" />
  </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { ref } from "vue";

import Amortization from "./Amortization.vue";
import Statement from "./Statement.vue";

const props = defineProps({
  member: Object,
  activeLoans: Object,
  guarantors: Object,
});

let url = ref();
let activeLoan = ref("");

let item = ref(0);

// const form = ref(
//   useForm({
//     member_id: props.member.id,
//     branch_id: props.member.branch_id,
//     asset_number: "",
//     title: "",
//     description: "",
//     valuation_date: "",
//     valued_by: "",
//     valuer_phone: "",
//     valuation_amount: "",
//     location: "",
//     registration_number: "",
//     registered_to: "",
//     condition: "",
//     notes: "",
//   })
// );

// const create = () => {
//   item.value = 0;
//   action.value = "Create";
//   form.value = useForm({
//     member_id: props.member.id,
//     branch_id: props.member.branch_id,
//     asset_number: "",
//     title: "",
//     description: "",
//     valuation_date: "",
//     valued_by: "",
//     valuer_phone: "",
//     valuation_amount: "",
//     location: "",
//     registration_number: "",
//     registered_to: "",
//     condition: "",
//     notes: "",
//   });
// };

// const getObject = (obj) => {
//   item.value = obj.id;
//   action.value = "Edit";
//   form.value = useForm({
//     member_id: props.member.id,
//     branch_id: props.member.branch_id,
//     asset_number: obj.asset_number,
//     title: obj.title,
//     description: obj.description,
//     valuation_date: obj.valuation_date,
//     valued_by: obj.valued_by,
//     valuer_phone: obj.valuer_phone,
//     valuation_amount: obj.valuation_amount,
//     location: obj.location,
//     registration_number: obj.registration_number,
//     registered_to: obj.asset_number,
//     condition: obj.asset_number,
//     notes: obj.asset_number,
//   });
// };
</script>