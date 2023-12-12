<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Loan Types</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="row justify-content-between">
                            <div class="col-sm-12 col-md-4">
                                <div
                                    id="user_list_datatable_info"
                                    class="dataTables_filter"
                                >
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
                            <div class="col-sm-12 col-md-6">
                                <div class="user-list-files d-flex float-right">
                                    <a
                                        class="iq-bg-primary"
                                        href="javascript:void();"
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
                                        <th>Loan Type</th>
                                        <th>Int. Rate</th>
                                        <th>Int. Type</th>
                                        <th>Payment FR.</th>
                                        <th>Pen. Type</th>
                                        <th>Penalty</th>
                                        <th>Svc Fee</th>
                                        <th>Period</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in loanTypes.data"
                                        :key="index"
                                    >
                                        <td>{{ obj.name }}</td>
                                        <td>
                                            {{ obj.interest_rate }}% per
                                            {{ obj.interest_duration }}
                                        </td>
                                        <td>
                                            {{ obj.interestType.display_name }}
                                        </td>
                                        <td>
                                            {{
                                                obj.paymentFrequency
                                                    .display_name
                                            }}
                                        </td>
                                        <td>
                                            <small>{{
                                                obj.penaltyType.display_name
                                            }}</small>
                                        </td>
                                        <td>{{ obj.penalty_value }}</td>
                                        <td>{{ obj.service_fee }}</td>
                                        <td>
                                            {{ obj.repayment_period }} months
                                        </td>
                                        <td>
                                            <span class="active">Active</span>
                                        </td>
                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <a
                                                    class="iq-bg-primary"
                                                    data-placement="top"
                                                    @click="getItem(obj)"
                                                    data-toggle="modal"
                                                    data-target="#formModal"
                                                    href="javascript:void();"
                                                    ><i
                                                        class="ri-pencil-line"
                                                    ></i
                                                ></a>
                                                <a
                                                    class="iq-bg-primary"
                                                    data-toggle="modal"
                                                    data-placement="top"
                                                    @click="
                                                        url = route(
                                                            'loanTypes.destroy',
                                                            obj.id
                                                        )
                                                    "
                                                    data-original-title="Delete"
                                                    href="#confirm"
                                                    ><i
                                                        class="ri-delete-bin-line"
                                                    ></i
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
                                        loanTypes.total > 10
                                            ? "10"
                                            : loanTypes.total
                                    }}
                                    of {{ loanTypes.total }} entries</span
                                >
                            </div>
                            <div class="col-md-6">
                                <nav aria-label="Page navigation example">
                                    <ul
                                        class="pagination justify-content-end mb-0"
                                    >
                                        <li
                                            class="page-item active"
                                            v-for="(
                                                link, ind
                                            ) in loanTypes.links"
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
        <LoanTypeForm :form="form" :action="action" :item="item" />
    </Main>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import LoanTypeForm from "./LoanTypeForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
    loanTypes: Object,
    filters: Object,
});
const members = usePage().props.value.members;
let search = ref(props.filters.search);
let url = ref("");

let action = ref("Add");

let item = ref(0);

let form = ref(useForm({}));

const create = () => {
    item.value = 0;
    action.value = "Add";
    form.value = useForm({
        id: "",
        name: "",
        description: "",
        interest_rate: "",
        interest_type: "",
        interest_duration: "",
        payment_frequency: "",
        repayment_period: "",
        service_fee: "",
        penalty_type: "",
        penalty_value: "",
        penalty_frequency: "",
    });
};

const getItem = (obj) => {
    action.value = "Edit";
    item.value = obj.id;
    form.value = useForm({
        name: obj.name,
        description: obj.description,
        interest_rate: obj.interest_rate,
        interest_duration: obj.interest_duration,
        interest_type: obj.interest_type_id,
        payment_frequency: obj.payment_frequency_id,
        repayment_period: obj.repayment_period,
        service_fee: obj.service_fee,
        penalty_type: obj.penalty_type_id,
        penalty_value: obj.penalty_value,
        penalty_frequency: obj.penalty_frequency_id,
    });
};

watch(
    search,
    debounce((value) => {
        Inertia.get(
            route("loanTypes.index"),
            { search: search.value },
            { preserveState: true, replace: true }
        );
    }, 500)
);
</script>
