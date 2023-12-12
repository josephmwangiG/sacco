<template>
    <EditApplication :id="id" :active="'accrue'">
        <div class="mt-5">
            <div
                class="card-header bg-primary py-2"
                @click="shows = 'principle'"
            >
                <h6 class="text-white">Principle</h6>
            </div>
            <div class="table-responsive" v-if="shows == 'principle'">
                <table
                    id="user-list-table"
                    class="table table-striped table-borderless mt-2"
                    role="grid"
                >
                    <thead>
                        <tr>
                            <th>Loan No.</th>
                            <th>Current Principle</th>
                            <th>Amount Paid</th>
                            <th>Total Interests</th>
                            <th>Total Penalties</th>
                            <th>Status</th>
                            <th>Due Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-if="pays.payments.length > 0">
                            <td>
                                {{
                                    pays.payments[pays.payments.length - 1]
                                        .period
                                }}
                            </td>
                            <td>
                                {{
                                    pays.payments[
                                        pays.payments.length - 1
                                    ].principle.toLocaleString("en-US", {
                                        minimumFractionDigits: 1,
                                        maximumFractionDigits: 1,
                                    }) + "0"
                                }}
                            </td>
                            <td>
                                {{
                                    payments_sum.toLocaleString("en-US", {
                                        minimumFractionDigits: 1,
                                        maximumFractionDigits: 1,
                                    }) + "0"
                                }}
                            </td>
                            <td>
                                {{
                                    pays.payments[
                                        pays.payments.length - 1
                                    ].payment_amount.toLocaleString("en-US", {
                                        minimumFractionDigits: 1,
                                        maximumFractionDigits: 1,
                                    }) + "0"
                                }}
                            </td>

                            <td>
                                {{ "00.0" }}
                            </td>
                            <td>
                                <span class="active">Active</span>
                            </td>
                            <td>2024-03-01</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mt-5">
            <div
                class="card-header bg-primary py-2"
                @click="shows = 'interest'"
            >
                <h6 class="text-white">Interest</h6>
            </div>
            <div class="table-responsive" v-if="shows == 'interest'">
                <table
                    id="user-list-table"
                    class="table table-striped table-borderless mt-2"
                    role="grid"
                >
                    <thead>
                        <tr>
                            <th>Inst. No</th>
                            <th>Principle</th>
                            <th>Interest</th>
                            <th>Installments</th>
                            <th>Outstanding</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, index) in pays.payments" :key="index">
                            <td>
                                {{ item.period }}
                            </td>
                            <td>
                                {{
                                    item.principle.toLocaleString("en-US", {
                                        minimumFractionDigits: 1,
                                        maximumFractionDigits: 1,
                                    }) + "0"
                                }}
                            </td>
                            <td>
                                {{
                                    item.interest_amount.toLocaleString(
                                        "en-US",
                                        {
                                            minimumFractionDigits: 1,
                                            maximumFractionDigits: 1,
                                        }
                                    ) + "0"
                                }}
                            </td>
                            <td>
                                {{
                                    item.payment_amount.toLocaleString(
                                        "en-US",
                                        {
                                            minimumFractionDigits: 1,
                                            maximumFractionDigits: 1,
                                        }
                                    ) + "0"
                                }}
                            </td>

                            <td>
                                {{
                                    (
                                        item.principle - item.payment_amount
                                    ).toLocaleString("en-US", {
                                        minimumFractionDigits: 1,
                                        maximumFractionDigits: 1,
                                    }) + "0"
                                }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mt-5">
            <div
                class="card-header bg-primary py-2"
                @click="shows = 'penalties'"
            >
                <h6 class="text-white">Penalties</h6>
            </div>
            <div class="table-responsive" v-if="shows == 'penalties'">
                <table
                    id="user-list-table"
                    class="table table-striped table-borderless mt-2"
                    role="grid"
                >
                    <thead>
                        <tr>
                            <th>Loan No.</th>
                            <th>Principle</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </EditApplication>
</template>

<script setup>
import { usePage, useForm } from "@inertiajs/inertia-vue3";
import EditApplication from "./EditApplication.vue";
import { ref } from "vue";

const props = defineProps({
    activeLoan: Object,
    id: Number,
    payments_sum: Number,
    months: Number,
});
let pays = ref();
let shows = ref("principle");

const calculateLoan = () => {
    let periods = 0;
    let payments = props.payments_sum;
    let principle = 0;
    let interest = 0;

    // Fixed balance = P *(r/12) * duration
    // Reducing balance = P *(1 + r/12)

    const duration_years = props.activeLoan.repayment_period / 12;
    const pFreq = props.activeLoan.payment_frequency.display_name;

    if (pFreq == "Annually") {
        periods = 1;
    } else if (pFreq == "semi_annualy") {
        periods = 2;
    } else if (pFreq == "quaterly") {
        periods = 4;
    } else if (pFreq == "Monthly") {
        periods = 12;
    } else if (pFreq == "Weekly") {
        periods = 52.1786;
    } else if (pFreq == "daily") {
        periods = 365;
    }

    pays.value = {
        principle: principle,
        amount_applied: props.activeLoan.amount_approved,
        periods: periods,
        payments: [],
    };
    principle = props.activeLoan.amount_approved;
    if (props.activeLoan.interest_type.display_name == "Fixed Rate") {
        let full_int =
            principle * (props.activeLoan.interest_rate / 100) * duration_years;

        let new_principle = Number(principle) + Number(full_int);
        let payment_per_month = new_principle / (periods * duration_years);
        let intr = full_int / (periods * duration_years);

        for (let i = 1; i <= props.months; i++) {
            pays.value.payments.push({
                period: i,
                principle: new_principle,
                payment_per_month: payment_per_month,
                payment_amount: payment_per_month,
                payments: payments + payment_per_month,
                interest: interest + intr,
                interest_amount: intr,
            });

            principle = new_principle - payment_per_month;
            new_principle = principle;
            payments = payments + payment_per_month;
            interest = interest + intr;
        }
    } else {
        let payment_per_month = principle / (periods * duration_years);
        let new_principle =
            principle * (1 + props.activeLoan.interest_rate / 100 / 12);

        for (let i = 1; i <= props.months; i++) {
            if (principle < payment_per_month) {
                pays.value.payments.push({
                    period: i,
                    principle: new_principle,
                    payment_per_month: payment_per_month,
                    payment_amount:
                        payment_per_month + new_principle - principle,
                    payments:
                        payments +
                        payment_per_month +
                        new_principle -
                        principle,
                    interest: interest + new_principle - principle,
                    interest_amount: new_principle - principle,
                });
            }

            let intr = new_principle - principle;

            pays.value.payments.push({
                period: i,
                principle: new_principle,
                payment_per_month: payment_per_month,
                payment_amount: payment_per_month + intr,
                payments: payments + payment_per_month + intr,
                interest: interest + intr,
                interest_amount: intr,
            });

            principle = new_principle - (payment_per_month + intr);
            new_principle =
                principle * (1 + props.activeLoan.interest_rate / 100 / 12);
            payments = payments + payment_per_month + intr;
            interest = interest + intr;
        }
    }

    console.log(pays.value);
};

calculateLoan();
</script>
