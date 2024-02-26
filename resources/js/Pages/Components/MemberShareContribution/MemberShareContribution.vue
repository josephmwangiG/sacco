<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">
                                Member Share Contributions
                            </h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="row justify-content-between">
                            <div class="col-sm-12 col-md-5">
                                <!-- Search Form -->
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
                                <!-- Buttons for Printing and Adding New Contribution -->
                                <div class="user-list-files d-flex float-right">
                                    <a
                                        class="iq-bg-primary"
                                        href="{{ route('pdf.shareTypes') }}"
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
                        <!-- Table to Display Contributions -->
                        <div class="table-responsive">
                            <table
                                id="user-list-table"
                                class="table table-striped table-borderless mt-4"
                                role="grid"
                                aria-describedby="user-list-page-info"
                            >
                                <thead>
                                    <tr>
                                        <th>AccountNumber</th>
                                        <th>Member</th>
                                        <th>PaymentMethod</th>
                                        <th>Amount</th>
                                        <th>Date of Payment</th>
                                        <th>Description</th>
                                        <th>Share Type</th>

                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(
                                            contribution, index
                                        ) in contributions.data"
                                        :key="index"
                                    >
                                        <td>
                                            {{ contribution.account_number }}
                                        </td>
                                        <td>{{ contribution.member.name }}</td>
                                        <td>
                                            {{ contribution.paymentmethod_id }}
                                        </td>
                                        <td>{{ contribution.amount }}</td>
                                        <td>
                                            {{ contribution.date_of_payment }}
                                        </td>
                                        <td>{{ contribution.description }}</td>
                                        <td>{{ contribution.sharetype_id }}</td>

                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <a
                                                    class="iq-bg-primary"
                                                    @click="
                                                        getItem(contribution)
                                                    "
                                                    data-toggle="modal"
                                                    data-target="#formModal"
                                                >
                                                    <i
                                                        class="ri-pencil-line"
                                                    ></i>
                                                </a>
                                                <a
                                                    class="iq-bg-primary"
                                                    @click="
                                                        confirmDelete(
                                                            contribution.id
                                                        )
                                                    "
                                                >
                                                    <i
                                                        class="ri-delete-bin-line"
                                                    ></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Pagination Section -->
                        <div class="row justify-content-between mt-3">
                            <div id="user-list-page-info" class="col-md-6">
                                <span>
                                    Showing {{ contributions.from }} to
                                    {{ contributions.to }} of
                                    {{ contributions.total }} entries
                                </span>
                            </div>
                            <div class="col-md-6">
                                <nav
                                    v-if="contributions && contributions.links"
                                    aria-label="Page navigation example"
                                >
                                    <ul
                                        class="pagination justify-content-end mb-0"
                                    >
                                        <li
                                            v-for="(
                                                link, ind
                                            ) in contributions.links"
                                            :key="ind"
                                            class="page-item"
                                        >
                                            <a
                                                class="page-link"
                                                @click.prevent="
                                                    fetchData(link.url)
                                                "
                                                v-html="link.label"
                                            ></a>
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
        <MemberShareContributionForm
            :form="form"
            :action="action"
            :item="item"
            :members="members"
            :shareTypes="sharetypes"
        ></MemberShareContributionForm>
    </Main>
</template>

<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import debounce from "lodash/debounce";

import MemberShareContributionForm from "./MemberShareContributionForm.vue";
const props = defineProps({
    contributions: Object,
    filters: Object,
});

let search = ref(props.filters.search);
let url = ref("");

let action = ref("Add");
let item = ref({});

let form = ref(
    useForm({
        member_id: "",
        paymentmethod_id: "",
        amount: "",
        date_of_payment: "",
        description: "",
        sharetype_id: "",
        account_number: "",
    })
);

// Define members and make it reactive
let members = ref([]);

const openModal = () => {
    form.value.reset();
    action.value = "Add";
};

const getItem = (contribution) => {
    action.value = "Edit";
    item.value = contribution.id;
    form.value = useForm({
        member_id: contribution.member_id,
        paymentmethod_id: contribution.paymentmethod_id,
        amount: contribution.amount,
        date_of_payment: contribution.date_of_payment,
        description: contribution.description,
        sharetype_id: contribution.sharetype_id,
        account_number: contribution.account_number,
    });
};

const confirmDelete = (contributionId) => {
    // Set the URL for deleting contribution
    url.value = route("contributions.destroy", contributionId);
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
