<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-body">
                        <div
                            class="d-flex justify-content-between align-items-center"
                        >
                            <h4 class="card-title">Active Loan</h4>
                            <div
                                class="d-flex align-items-center justify-content-between"
                            >
                                <input
                                    v-model="form.start_date"
                                    type="date"
                                    style="
                                        width: 150px;
                                        border-radius: 3px;
                                        height: 35px;
                                    "
                                    class="form-control mr-2"
                                    @change="filterLoans()"
                                />
                                <input
                                    v-model="form.end_date"
                                    type="date"
                                    style="
                                        width: 150px;
                                        border-radius: 3px;
                                        height: 35px;
                                    "
                                    class="form-control mr-2"
                                    @change="filterLoans()"
                                />
                                <select
                                    v-model="form.loanType"
                                    style="width: 150px; height: 35px"
                                    class="form-control"
                                    id="selectcountry"
                                    @change="filterLoans()"
                                >
                                    <option value="">All Loan Type</option>
                                    <option
                                        :value="type"
                                        v-for="(type, index) in loanTypes"
                                        :key="index"
                                    >
                                        {{ type }}
                                    </option>
                                </select>
                                <div class="user-list-files">
                                    <a
                                        class="iq-bg-primary"
                                        :href="route('pdf.loans')"
                                        target="_blank"
                                    >
                                        Print
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive mt-3" :key="loans.length">
                            <DataTable
                                :options="options"
                                id="user-list-table"
                                class="table table-striped table-borderless mt-4"
                                role="grid"
                                aria-describedby="user-list-page-info"
                            >
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Member</th>
                                        <th>Loan</th>
                                        <th>Interest</th>
                                        <th>Amount</th>
                                        <th>Service Fee</th>
                                        <th>Status</th>
                                        <th>Start Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in loans"
                                        :key="index"
                                    >
                                        <td>{{ obj.loan_reference_number }}</td>
                                        <td>
                                            {{ obj.user.first_name }}
                                            {{ obj.user.last_name }}
                                        </td>
                                        <td>{{ obj.loanType.name }}</td>
                                        <td>{{ obj.interest_rate }}</td>
                                        <td>{{ obj.amount_approved }}</td>
                                        <td>{{ obj.service_fee }}</td>
                                        <td>
                                            <span class="active">Active</span>
                                        </td>
                                        <td>
                                            {{
                                                obj.start_date.substring(0, 10)
                                            }}
                                        </td>
                                    </tr>
                                </tbody>
                            </DataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <Confirm :url="url" />
        <!-- <Amortization :activeLoan="activeLoan" v-if="activeLoan != ''" />
      <Statement :activeLoan="activeLoan" v-if="activeLoan != ''" /> -->
    </Main>
</template>
<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { useDataTable } from "@/composables/dataTable";
//   import Amortization from "./Amortization.vue";
//   import Statement from "./Statement.vue";
import { ref, watch } from "vue";
import debounce from "lodash/debounce";

const { DataTable, options } = useDataTable();

const props = defineProps({
    activeLoans: Object,
    loanTypes: Object,
});

let url = ref("");

const loans = ref(props.activeLoans);

let form = ref(
    useForm({
        loanType: "",
        member: "",
        start_date: "",
        end_date: "",
        member: "",
    })
);

const filterLoans = () => {
    loans.value = props.activeLoans;
    if (form.value.loanType != "") {
        loans.value = loans.value.filter((x) => {
            return x.loanType.name == form.value.loanType;
        });
    }

    if (form.value.start_date != "") {
        loans.value = loans.value.filter((x) => {
            return x.start_date >= form.value.start_date;
        });
    }

    if (form.value.end_date != "") {
        loans.value = loans.value.filter((x) => {
            return x.start_date <= form.value.end_date;
        });
    }
};
</script>
