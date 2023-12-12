<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Loan Pending Approval</h4>
                        </div>
                        <div class="user-list-files d-flex float-right">
                            <a
                                class="iq-bg-primary"
                                :href="route('pdf.loan.applications')"
                            >
                                Print
                            </a>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div
                            class="table-responsive"
                            v-if="loanApplications.length > 0"
                        >
                            <table
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
                                        <th>Application Date</th>
                                        <th>Interest</th>
                                        <th>Amount</th>
                                        <th>Service Fee</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in loanApplications"
                                        :key="index"
                                    >
                                        <td>
                                            {{ obj.application_ref_number }}
                                        </td>
                                        <td>
                                            {{ obj.member.user.first_name }}
                                            {{ obj.member.user.last_name }}
                                        </td>
                                        <td>{{ obj.loan_type.name }}</td>
                                        <td>
                                            {{
                                                formatDate(
                                                    obj.application_date.substring(
                                                        0,
                                                        10
                                                    )
                                                )
                                            }}
                                        </td>
                                        <td>{{ obj.interest_rate }}</td>
                                        <td>
                                            {{
                                                Number(
                                                    obj.amount_applied
                                                ).toLocaleString()
                                            }}
                                        </td>
                                        <td>
                                            {{
                                                Number(
                                                    obj.service_fee
                                                ).toLocaleString()
                                            }}
                                        </td>
                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <a
                                                    style="white-space: nowrap"
                                                    @click="getObject(obj)"
                                                    data-toggle="modal"
                                                    href="#formModal"
                                                    ><i
                                                        class="ri-checkbox-circle-line"
                                                    ></i>
                                                    Approve</a
                                                >
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <h5 v-else class="my-4">No items available</h5>
                    </div>
                </div>
            </div>
        </div>
        <Confirm :url="url" />
        <ApproveLoan :form="form" />
    </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { ref } from "vue";
import ApproveLoan from "./ApproveLoan.vue";
import { formatDate } from "@/composables/utils.js";

const props = defineProps({
    members: Object,
    loanApplications: Object,
});

let url = ref("");


let item = ref(0);

let form = ref(
    useForm({
        id: "",
    })
);

const getObject = (obj) => {
    item.value = obj.id;
    form.value = useForm({
        id: obj.id,
    });
};
</script>
