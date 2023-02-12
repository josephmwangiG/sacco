<template>
  <EditApplication :id="id" :active="'collaterals'">
    <div class="row justify-content-between">
      <div class="col-sm-5 col-md-4">
        <h4 class="card-title">Collaterals</h4>
      </div>
      <div class="col-sm-7 col-md-6">
        <div class="user-list-files d-flex float-right">
          <a class="iq-bg-primary" href="javascript:void();"> Print </a>
          <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
          <a class="iq-bg-primary" href="javascript:void();"> Pdf </a>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table
        id="user-list-table"
        class="table table-striped table-borderless mt-2"
        role="grid"
        aria-describedby="user-list-page-info"
      >
        <thead>
          <tr>
            <th>Asset</th>
            <th>Asset No.</th>
            <th>valuation Amt.</th>
            <th>Valuation date</th>
            <th>Condition</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(obj, index) in collaterals" :key="index">
            <td>{{ obj.asset.title }}</td>
            <td>{{ obj.asset.asset_number }}</td>
            <td>{{ obj.asset.valuation_amount }}</td>
            <td>{{ obj.asset.valuation_date }}</td>
            <td>{{ obj.asset.condition }}</td>
            <td>
              <div class="flex align-items-center list-user-action">
                <a
                  class="iq-bg-primary"
                  data-placement="top"
                  @click="getObject(obj)"
                  data-toggle="modal"
                  data-target="#formModal"
                  href="javascript:void();"
                  ><i class="ri-pencil-line"></i
                ></a>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <Confirm :url="url" />
    <CollateralForm
      :assets="assets"
      :form="form"
      :action="action"
      :item="item"
      :id="id"
    />
  </EditApplication>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import CollateralForm from "./CollateralForm.vue";
import EditApplication from "./EditApplication.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  collaterals: Object,
  activeLoan: Object,
  assets: Object,
  id: Number,
});

console.log(props.collaterals);

let url = ref("");

let action = ref("Create");

let item = ref(0);

let form = ref(
  useForm({
    loan_application_id: props.activeLoan.loan_application_id,
    member_id: props.activeLoan.member_id,
    organization_id: props.activeLoan.organization_id,
    asset_number: "",
    asset: "",
    valuation_date: "",
    valuation_amount: "",
    condition: "",
  })
);

const getObject = (obj) => {
  action.value = "Edit";
  item.value = obj.id;

  props.assets.forEach((item) => {
    if (item.id == obj.asset_id) {
      form.value = useForm({
        loan_application_id: props.activeLoan.id,
        member_id: props.activeLoan.meber_id,
        organization_id: props.activeLoan.organization_id,
        asset: item.id,
        asset_number: obj.asset.asset_number,
        valuation_date: obj.asset.valuation_date,
        valuation_amount: obj.asset.valuation_amount,
        condition: obj.asset.condition,
      });
    }
  });
};
</script>