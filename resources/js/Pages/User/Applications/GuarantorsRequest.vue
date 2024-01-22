<template>
      <Main>
    <div class="iq-card">
      <div class="iq-card-body">
       
        <div class="row justify-content-between">
            <div class="col-sm-5 col-md-4">
                <h4 class="card-title">Requests</h4>
            </div>
            <div class="col-sm-7 col-md-6">
                <div class="user-list-files d-flex float-right">
                    <a class="iq-bg-primary" href="javascript:void();">
                        Print
                    </a>
                </div>
            </div>
        </div>
        <div class="table-responsive" v-if="guarantors.length > 0">
            <table
                id="user-list-table"
                class="table table-striped table-borderless mt-2"
                role="grid"
                aria-describedby="user-list-page-info"
            >
                <thead>
                    <tr>
                        <th>Loan</th>
                        <th>Loan Number</th>
                        <th>Applicant</th>
                        <th>Applicant AC No.</th>
                        <th>Applicant Phone</th>
                        <th>Amount</th>
                        <th>Confirmed Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(obj, index) in guarantors" :key="index">
                        <td>
                            {{ obj.loan_application.loan_type.name }}
                        </td>
                        <td>{{ obj.loan_application.application_ref_number }}</td>
                        <td>{{ obj.loan_application.member.user.first_name }} {{ obj.loan_application.member.user.last_name }}</td>
                        <td>{{ obj.loan_application.member.account.account_number }}</td>
                        <td>{{ obj.loan_application.member.user.phone }}</td>
                        <td>{{ Number(obj.guarantee_amount).toLocaleString() }}</td>
                        <td>{{ Number(obj.guarantee_amount).toLocaleString() }}</td>
                        <td>
                            <span class="active">{{obj.status}}</span>
                        </td>
                        <td>
                            <div
                                class="flex align-items-center list-user-action"
                            >
                                <a
                                    class="iq-bg-primary"
                                    data-placement="top"
                                    @click="getObject(obj)"
                                    data-toggle="modal"
                                    data-target="#formModal"
                                    href="javascript:void();"
                                    ><i class="ri-pencil-line"></i
                                ></a>
                                <a
                                    class="iq-bg-primary"
                                    data-toggle="modal"
                                    data-placement="top"
                                    @click="
                                        url = route(
                                            'loanApplications.delete.guarantors',
                                            obj.id
                                        )
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
        <div class="my-4 text-center" v-else>No guarantors added.</div>
        <Confirm :url="url" />
        <GuarantorsForm
            :m_id="loanApplication.member_id"
            :form="gform"
            :action="action"
            :item="item"
            :id="id"
        />
      
        </div>
        </div>
        </Main>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import GuarantorsForm from "./GuarantorsForm.vue";
import EditApplication from "./EditApplication.vue";
import debounce from "lodash/debounce";

const props = defineProps({
    loanApplication: Object,
    guarantors: Object,
});

console.log(props.guarantors);

const members = usePage().props.value.members;

let url = ref("");

let action = ref("Create");

let item = ref(0);

let gform = ref(
    useForm({
        member: "",
        notes: "",
        guarantee_amount: "",
        id_number: "",
        account_number: "",
    })
);

const create = () => {
    item.value = 0;
    action.value = "Create";
    gform.value = useForm({
        member: "",
        notes: "",
        guarantee_amount: "",
        id_number: "",
        account_number: "",
    });
};

const getObject = (obj) => {
    action.value = "Edit";
    item.value = obj.id;

    members.forEach((item) => {
        if (item.id == obj.member_id) {
            gform.value = useForm({
                id_number: item.id_number,
                account_number: item.account.account_number,
                member: obj.member_id,
                notes: obj.notes,
                guarantee_amount: obj.guarantee_amount,
            });
        }
    });
};
</script>
