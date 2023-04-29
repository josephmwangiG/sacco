<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Loan Applications</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="row justify-content-between">
              <div class="col-sm-12 col-md-5">
                <div id="user_list_datatable_info" class="dataTables_filter">
                  <form class="mr-3 position-relative">
                    <div class="form-group mb-0">
                      <input
                        type="search"
                        v-model="search"
                        class="form-control"
                        id="exampleInputSearch"
                        placeholder="Search"
                        aria-controls="user-list-table"
                      />
                    </div>
                  </form>
                </div>
              </div>
              <div class="col-sm-12 col-md-7">
                <div class="user-list-files d-flex float-right">
                  <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
                  <a
                    class="iq-bg-primary"
                    :href="route('pdf.loan.applications')"
                  >
                    Print
                  </a>
                  <a
                    class="iq-bg-primary"
                    data-toggle="modal"
                    data-target="#formModal"
                    @click="create"
                    href="javascript:void();"
                  >
                    New
                  </a>
                </div>
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
                    <th>Amount</th>
                    <th>Service Fee</th>
                    <th>Status</th>
                    <th>Application Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(obj, index) in loanApplications.data"
                    :key="index"
                  >
                    <td>{{ obj.user.first_name }} {{ obj.user.last_name }}</td>
                    <td>{{ obj.loanType.name }}</td>
                    <td>{{ obj.interest_rate }}</td>
                    <td>{{ obj.amount_applied }}</td>
                    <td>{{ obj.service_fee }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >Active</span
                      >
                    </td>
                    <td>{{ obj.application_date.substring(0, 10) }}</td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <Link
                          class="iq-bg-primary"
                          :href="route('loanApplications.edit', obj.id)"
                          ><i class="ri-pencil-line"></i
                        ></Link>
                        <a
                          class="iq-bg-primary"
                          data-toggle="modal"
                          data-placement="top"
                          @click="
                            url = route('loanApplications.destroy', member.id)
                          "
                          data-original-title="Delete"
                          href="#confirm"
                          ><i class="ri-delete-bin-line"></i
                        ></a>
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
                  {{
                    loanApplications.total > 10 ? "10" : loanApplications.total
                  }}
                  of {{ loanApplications.total }} entries</span
                >
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li
                      class="page-item active"
                      v-for="(link, ind) in loanApplications.links"
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
        </div>
      </div>
    </div>
    <Confirm :url="url" />
    <ApplicationForm :form="form" :action="action" :item="item" />
  </Main>
</template>
<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import ApplicationForm from "./ApplicationForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  loanApplications: Object,
  filters: Object,
});

let search = ref(props.filters.search);
let url = ref("");

let action = ref("Create");

let item = ref(0);

let form = ref(
  useForm({
    member: "",
    loan_officer: "",
    loan_type: "",
    reduce_principal_early: "",
    amount_applied: "",
    periodic_payment_amount: "",
    application_date: "",
    disburse_method: "",
    disburse_note: "",
    mpesa_number: "",
    mpesa_first_name: "",
    mpesa_middle_name: "",
    mpesa_last_name: "",
    cheque_number: "",
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    witness_type: "",
    witness_first_name: "",
    witness_last_name: "",
    witness_country: "",
    witness_county: "",
    witness_city: "",
    witness_national_id: "",
    witness_phone: "",
    witness_email: "",
    witness_postal_address: "",
    witness_residential_address: "",
    witnessed_by: "",
    reviewed_by: "",
    reviewed_on: "",
    approved_on: "",
    rejected_on: "",
    rejection_notes: "",
    attach_application_form: "",
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    member: "",
    loan_officer: "",
    loan_type: "",
    reduce_principal_early: "",
    amount_applied: "",
    periodic_payment_amount: "",
    application_date: "",
    disburse_method: "",
    disburse_note: "",
    mpesa_number: "",
    mpesa_first_name: "",
    mpesa_middle_name: "",
    mpesa_last_name: "",
    cheque_number: "",
    bank_name: "",
    bank_branch: "",
    cheque_date: "",
    witness_type: "",
    witness_first_name: "",
    witness_last_name: "",
    witness_country: "",
    witness_county: "",
    witness_city: "",
    witness_national_id: "",
    witness_phone: "",
    witness_email: "",
    witness_postal_address: "",
    witness_residential_address: "",
    witnessed_by: "",
    reviewed_by: "",
    reviewed_on: "",
    approved_on: "",
    rejected_on: "",
    rejection_notes: "",
    attach_application_form: "",
  });
};

const getObject = (obj) => {
  action.value = "Edit";
  item.value = obj.id;
  form.value = useForm({
    member: obj.member,
    loan_officer: obj.loan_officer_id,
    loan_type: obj.loan_type_id,
    reduce_principal_early: obj.reduce_principal_early,
    amount_applied: obj.amount_applied,
    interest_rate: obj.interest_rate,
    periodic_payment_amount: obj.periodic_payment_amount,
    application_date: obj.application_date,
    disburse_method: obj.disburse_method_id,
    disburse_note: obj.disburse_note,
    mpesa_number: obj.mpesa_number,
    mpesa_first_name: obj.mpesa_first_name,
    mpesa_middle_name: obj.mpesa_middle_name,
    mpesa_last_name: obj.mpesa_last_name,
    cheque_number: obj.cheque_number,
    bank_name: obj.bank_name,
    bank_branch: obj.bank_branch,
    cheque_date: obj.cheque_date,
    witness_type: obj.witness_type_id,
    witness_first_name: obj.witness_first_name,
    witness_last_name: obj.witness_last_name,
    witness_country: obj.witness_country,
    witness_county: obj.witness_county,
    witness_city: obj.witness_city,
    witness_national_id: obj.witness_national_id,
    witness_phone: obj.witness_phone,
    witness_email: obj.witness_email,
    witness_postal_address: obj.witness_postal_address,
    witness_residential_address: obj.witness_residential_address,
    witnessed_by: obj.witnessed_by_user_id,
    reviewed_by: obj.reviewed_by_user_id,
    reviewed_on: obj.reviewed_on,
    approved_on: obj.approved_on,
    rejected_on: obj.rejected_on,
    rejection_notes: obj.rejection_notes,
  });
};

watch(
  search,
  debounce((value) => {
    Inertia.get(
      route("loanApplications.index"),
      { search: search.value },
      { preserveState: true, replace: true }
    );
  }, 500)
);
</script>