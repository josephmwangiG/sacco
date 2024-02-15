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
                                        @click="openModal"
                                        data-toggle="modal"
                                        href="#formModal"
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
                                        <th>Category</th>
                                        <th>Has_recurrent_contribution</th>
                                        <th>Contribution_period</th>
                                        <th>Dividend_percentage</th>
                                        <th>Can_be_withdrawn</th>
                                        <th>Max_amount</th>
                                        <th>Min_amount</th>
                                        <th>Can_be_transferred</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(obj, index) in sharetypes.data"
                                        :key="index"
                                    >
                                        <td>{{ obj.receipt_number }}</td>
                                        <td></td>
                                        <td></td>
                                        <td>{{ obj.method_id }}</td>
                                        <td></td>
                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <a
                                                    class="iq-bg-primary"
                                                    data-placement="top"
                                                    @click="getItem(obj)"
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
                                                            'shares-types.destroy',
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
                                        sharetypes.total > 10
                                            ? "10"
                                            : sharetypes.total
                                    }}
                                    of {{ sharetypes.total }} entries</span
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
                                            ) in sharetypes.links"
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
        <shareform :form="form" :action="action" :item="item" />
    </Main>
</template>

<script setup>
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import debounce from "lodash/debounce";
import shareform from "./shareform.vue";

const props = defineProps({
    sharetypes: Object,
    filters: Object,
});
const members = usePage().props.value.members;
let search = ref(props.filters.search);
let url = ref("");

let action = ref("Add");

let item = ref({});

let form = ref(
    useForm({
        category: "",
        has_recurrent_contribution: "",
        contribution_period: "",
        dividend_percentage: "",
        can_be_withdrawn: "",
        min_amount: "",
        max_amount: "",
        can_be_transferred: "",
    })
);

const openModal = () => {
    // Reset the form fields
    form.value.reset();
    // Set action to "Add" to indicate a new entry
    action.value = "Add";
};

const getItem = (obj) => {
    action.value = "Edit";
    item.value = obj.id;
    members.filter((item) => {
        if (obj.member_id == item.id && obj.id) {
            return item;
        }
    });
    // Populate the form fields with data from the selected item
    form.value = useForm({
        category: obj.category,
        has_recurrent_contribution: obj.has_recurrent_contribution,
        contribution_period: obj.contribution_period,
        dividend_percentage: obj.dividend_percentage,
        can_be_withdrawn: obj.can_be_withdrawn,
        min_amount: obj.min_amount,
        max_amount: obj.max_amount,
        can_be_transferred: obj.can_be_transferred,
    });
};

watch(
    search,
    // Debounce the search input to prevent excessive requests
    debounce((value) => {
        // Perform an Inertia GET request to fetch filtered data
        Inertia.get(
            route("shares-types.index"),
            { search: search.value },
            { preserveState: true, replace: true }
        );
    }, 500)
);
</script>
