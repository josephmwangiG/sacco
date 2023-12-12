<template>
    <EditApplication
        :loanApplication="loanApplication"
        :active="'disbursement'"
    >
        <div class="my-3">
            <div class="table-responsive w-100">
                <div class="d-flex justify-content-between w-100">
                    <h5>List of Approvers</h5>
                    <button type="button" class="btn btn-primary">
                        Update List of Approvers
                    </button>
                </div>
                <hr />
                <table
                    id="user-list-table"
                    class="table table-striped table-borderless mt-2 w-100"
                    role="grid"
                    aria-describedby="user-list-page-info"
                >
                    <thead>
                        <tr>
                            <th>Profile</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Approval Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-if="loanApplication.approver1 != null">
                            <td class="">
                                <img
                                    class="rounded-circle img-fluid avatar-40"
                                    src="/images/user/01.jpg"
                                    alt="profile"
                                />
                            </td>
                            <td>
                                {{ loanApplication.approver1.first_name }}
                                {{ loanApplication.approver1.last_name }}
                            </td>
                            <td>{{ loanApplication.approver1.phone }}</td>
                            <td>{{ loanApplication.approver1.email }}</td>
                            <td>
                                <span
                                    v-if="
                                        loanApplication.approver_1_status !=
                                        'Approved'
                                    "
                                    class="active"
                                    >Pending</span
                                >
                                <span
                                    v-else
                                    class="badge dark-icon-light iq-bg-success"
                                    >Approved</span
                                >
                            </td>
                        </tr>
                        <tr v-if="loanApplication.approver2 != null">
                            <td class="">
                                <img
                                    class="rounded-circle img-fluid avatar-40"
                                    src="/images/user/01.jpg"
                                    alt="profile"
                                />
                            </td>
                            <td>
                                {{ loanApplication.approver2.first_name }}
                                {{ loanApplication.approver2.last_name }}
                            </td>
                            <td>{{ loanApplication.approver2.phone }}</td>
                            <td>{{ loanApplication.approver2.email }}</td>
                            <td>
                                <span
                                    v-if="
                                        loanApplication.approver_2_status !=
                                        'Approved'
                                    "
                                    class="active"
                                    >Pending</span
                                >
                                <span
                                    v-else
                                    class="badge dark-icon-light iq-bg-success"
                                    >Approved</span
                                >
                            </td>
                        </tr>
                        <tr v-if="loanApplication.approver3 != null">
                            <td class="">
                                <img
                                    class="rounded-circle img-fluid avatar-40"
                                    src="/images/user/01.jpg"
                                    alt="profile"
                                />
                            </td>
                            <td>
                                {{ loanApplication.approver3.first_name }}
                                {{ loanApplication.approver3.last_name }}
                            </td>
                            <td>{{ loanApplication.approver3.phone }}</td>
                            <td>{{ loanApplication.approver3.email }}</td>
                            <td>
                                <span
                                    v-if="
                                        loanApplication.approver_3_status !=
                                        'Approved'
                                    "
                                    class="active"
                                    >Pending</span
                                >
                                <span
                                    v-else
                                    class="badge dark-icon-light iq-bg-success"
                                    >Approved</span
                                >
                            </td>
                        </tr>
                        <tr v-if="loanApplication.approver4 != null">
                            <td class="">
                                <img
                                    class="rounded-circle img-fluid avatar-40"
                                    src="/images/user/01.jpg"
                                    alt="profile"
                                />
                            </td>
                            <td>
                                {{ loanApplication.approver4.first_name }}
                                {{ loanApplication.approver4.last_name }}
                            </td>
                            <td>{{ loanApplication.approver4.phone }}</td>
                            <td>{{ loanApplication.approver4.email }}</td>
                            <td>
                                <span
                                    v-if="
                                        loanApplication.approver_3_status !=
                                        'Approved'
                                    "
                                    class="active"
                                    >Pending</span
                                >
                                <span
                                    v-else
                                    class="badge dark-icon-light iq-bg-success"
                                    >Approved</span
                                >
                            </td>
                        </tr>
                    </tbody>
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
    loanApplication: Object,
});

const paymentMethods = usePage().props.value.paymentMethods;

function saveForm() {
    form.value.put(
        route("loanApplications.update.disbusement", props.loanApplication.id),
        {
            onSuccess: () => {},
        }
    );
}
</script>
