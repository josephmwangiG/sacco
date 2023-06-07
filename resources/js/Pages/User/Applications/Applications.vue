<template>
  <Main>
    <div class="iq-card">
      <div class="iq-card-body">
        <div class="d-flex justify-content-between mt-2">
          <h5>Loans Application</h5>
          <div class="user-list-files">
            <a class="iq-bg-primary" href="javascript:void();"> Print </a>

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
        <div class="table-responsive mt-3">
          <table class="table mb-0 table-borderless">
            <thead>
              <tr>
                <th scope="col">Loan</th>
                <th scope="col">Application Date</th>
                <th scope="col">Interest</th>
                <th scope="col">Pay Frequency</th>
                <th scope="col">Amount</th>
                <th scope="col">Service Fee</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(obj, index) in applications.data" :key="index">
                <td>{{ obj.loanType.name }}</td>
                <td>{{ obj.application_date }}</td>
                <td>{{ obj.interest_rate }}</td>
                <td>{{ obj.paymentFrequency.name }}</td>
                <td>{{ obj.amount_applied }}</td>
                <td>{{ obj.service_fee }}</td>
                <td>
                  <div class="badge badge-pill badge-success">Active</div>
                </td>
                <td>
                  <div class="flex align-items-center list-user-action">
                    <Link
                      class="iq-bg-primary"
                      data-placement="top"
                      :href="route('u.loanApplications.edit', obj.id)"
                      ><i class="ri-pencil-line"></i
                    ></Link>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <Confirm :url="url" />
    <ApplicationForm
      :form="form"
      :action="action"
      :item="item"
      :memberDetails="member"
    />
  </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import ApplicationForm from "./ApplicationForm.vue";
import { ref } from "vue";

const props = defineProps({
  member: Object,
  applications: Object,
});

let url = ref();
let action = ref("Create");

let item = ref(0);

const form = ref(
  useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: "",
    title: "",
    description: "",
    valuation_date: "",
    valued_by: "",
    valuer_phone: "",
    valuation_amount: "",
    location: "",
    registration_number: "",
    registered_to: "",
    condition: "",
    notes: "",
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: "",
    title: "",
    description: "",
    valuation_date: "",
    valued_by: "",
    valuer_phone: "",
    valuation_amount: "",
    location: "",
    registration_number: "",
    registered_to: "",
    condition: "",
    notes: "",
  });
};

const getObject = (obj) => {
  item.value = obj.id;
  action.value = "Edit";
  form.value = useForm({
    member_id: props.member.id,
    branch_id: props.member.branch_id,
    asset_number: obj.asset_number,
    title: obj.title,
    description: obj.description,
    valuation_date: obj.valuation_date,
    valued_by: obj.valued_by,
    valuer_phone: obj.valuer_phone,
    valuation_amount: obj.valuation_amount,
    location: obj.location,
    registration_number: obj.registration_number,
    registered_to: obj.asset_number,
    condition: obj.asset_number,
    notes: obj.asset_number,
  });
};
</script>