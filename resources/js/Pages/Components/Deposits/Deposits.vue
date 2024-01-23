<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Deposits</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="row justify-content-between">
                            <div class="col-sm-12 col-md-5">
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
                            <div class="col-sm-12 col-md-7">
                                <div class="user-list-files d-flex float-right">
                                    <a
                                        class="iq-bg-primary"
                                        :href="route('pdf.deposits')"
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
                                        <th>Receipt</th>
                                        <th>Member</th>
                                        <th>Payment Date</th>
                                        <th>Method</th>
                                        <th>Amount</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in deposits.data"
                                        :key="index"
                                    >
                                        <td>{{ obj.receipt_number }}</td>
                                        <td>
                                            {{ obj.member?.user.first_name }}
                                            {{ obj.member?.user.last_name }}
                                        </td>
                                        <td>
                                            {{ formatDate(obj.payment_date) }}
                                        </td>
                                        <td>{{ obj.method_id }}</td>
                                        <td>{{ Number(obj.amount).toLocaleString('en-US') }}</td>
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
                                                            'deposits.destroy',
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
                                        deposits.total > 10
                                            ? "10"
                                            : deposits.total
                                    }}
                                    of {{ deposits.total }} entries</span
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
                                            ) in deposits.links"
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
        <DepositForm :form="form" :action="action" :item="item" />
    </Main>
</template>
<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import DepositForm from "./DepositForm.vue";
import debounce from "lodash/debounce";
import { formatDate } from "@/composables/utils.js";

const props = defineProps({
    deposits: Object,
    filters: Object,
});
const members = usePage().props.value.members;
let search = ref(props.filters.search);
let url = ref("");

let action = ref("Add");

let item = ref(0);

let form = ref(
    useForm({
        member: "",
        amount: "",
        payment_method: "",
        payment_date: "",
        description: "",
        account_number: "",
        id_number: "",
        bank_name: "",
        bank_branch: "",
        cheque_date: "",
        cheque_number: "",
    })
);

const create = () => {
    item.value = 0;
    action.value = "Add";
    form.value = useForm({
        member: "",
        amount: "",
        payment_method: "",
        payment_date: "",
        description: "",
        account_number: "",
        id_number: "",
        bank_name: "",
        bank_branch: "",
        cheque_date: "",
        cheque_number: "",
    });
};

const getItem = (obj) => {
    action.value = "Edit";
    item.value = obj.id;
    members.filter((item) => {
        if (obj.member_id == item.id && obj.id) {
            return item;
        }
    });
    form.value = useForm({
        member: obj.member_id,
        amount: obj.amount,
        id_number: obj.member.id_number,
        account_number: obj.member.account.account_number,
        payment_method: obj.method_id,
        payment_date: obj.payment_date,
        description: obj.notes,
        bank_name: obj.bank_name,
        bank_branch: obj.bank_branch,
        cheque_date: obj.cheque_date,
        cheque_number: obj.cheque_number,
    });
};

watch(
    search,
    debounce((value) => {
        Inertia.get(
            route("deposits.index"),
            { search: search.value },
            { preserveState: true, replace: true }
        );
    }, 500)
);
</script>
