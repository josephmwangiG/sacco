<template>
    <Main>
        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-4">
                <div
                    class="iq-card iq-card-block iq-card-stretch iq-card-height"
                    style="border-radius: 0px"
                >
                    <div class="iq-card-body">
                        <div
                            class="d-flex align-items-center justify-content-between text-right"
                        >
                            <div
                                class="icon iq-icon-box rounded-circle bg-success"
                            >
                                <i class="fa fa-users" aria-hidden="true"></i>
                            </div>
                            <div>
                                <h5 class="mb-0">Members</h5>
                                <span
                                    class="h5 text-success mb-0 counter d-inline-block w-100"
                                    >{{ members.length }}</span
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-4">
                <div
                    class="iq-card iq-card-block iq-card-stretch iq-card-height"
                    style="border-radius: 0px"
                >
                    <div class="iq-card-body iq-box-relative">
                        <div
                            class="d-flex align-items-center justify-content-between text-right"
                        >
                            <div
                                class="icon iq-icon-box rounded-circle bg-warning"
                            >
                                <i
                                    class="fa fa-handshake-o"
                                    aria-hidden="true"
                                ></i>
                            </div>
                            <div>
                                <h5 class="mb-0">Loans</h5>
                                <span
                                    class="h5 text-warning mb-0 counter d-inline-block w-100"
                                    >{{
                                        loans_total.toLocaleString("en-US")
                                    }}</span
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-4">
                <div
                    class="iq-card iq-card-block iq-card-stretch iq-card-height"
                    style="border-radius: 0px"
                >
                    <div class="iq-card-body iq-box-relative">
                        <div
                            class="d-flex align-items-center justify-content-between text-right"
                        >
                            <div
                                class="icon iq-icon-box rounded-circle bg-danger"
                            >
                                <i class="fa fa-money" aria-hidden="true"></i>
                            </div>
                            <div>
                                <h5 class="mb-0">Deposits</h5>
                                <span
                                    class="h5 text-info mb-0 counter d-inline-block w-100"
                                    >{{
                                        deposits_total.toLocaleString("en-US")
                                    }}</span
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div
                    class="iq-card iq-card-block iq-card-stretch iq-card-height"
                >
                    <div class="iq-card-body">
                        <statistics
                            :all_applications="all_applications"
                            :deposits_total="deposits_total"
                            :loans_total="loans_total"
                        />
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div
                    class="iq-card iq-card-block iq-card-stretch iq-card-height"
                >
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Recent Applications</h4>
                        </div>
                        <div
                            class="iq-card-header-toolbar d-flex align-items-center"
                        >
                            <Link
                                class="dropdown-item"
                                :href="route('loanApplications.index')"
                                ><i class="ri-eye-fill mr-2"></i>View All</Link
                            >
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="table-responsive">
                            <table
                                id="user-list-table"
                                class="table table-striped table-borderless"
                                role="grid"
                                aria-describedby="user-list-page-info"
                            >
                                <thead>
                                    <tr>
                                        <th>Member</th>
                                        <th>Loan</th>
                                        <th>Application Date</th>
                                        <th>Interest</th>
                                        <th>Amount</th>
                                        <th>Service Fee</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in applications"
                                        :key="index"
                                    >
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
                                                ).toLocaleString("en-US")
                                            }}
                                        </td>
                                        <td>
                                            <span class="active">Active</span>
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
import { Link } from "@inertiajs/inertia-vue3";
import Statistics from "./Statistics.vue";
import { formatDate } from "@/composables/utils";
const props = defineProps({
    applications: Object,
    all_applications: Object,
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
