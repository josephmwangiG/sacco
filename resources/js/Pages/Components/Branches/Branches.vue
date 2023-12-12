<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Branches</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="row justify-content-between">
                            <div class="col-sm-5 col-md-5">
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
                            <div class="col-sm-7 col-md-7">
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
                                        <th>Branch</th>
                                        <th>Code</th>
                                        <th>Location</th>
                                        <th>Members</th>
                                        <th>Status</th>
                                        <th>Date Created</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(branch, index) in branches.data"
                                        :key="index"
                                    >
                                        <td>{{ branch.name }}</td>
                                        <td>{{ branch.branch_code }}</td>
                                        <td>{{ branch.town }}</td>
                                        <td>{{ branch.members.length }}</td>
                                        <td>
                                            <span class="active">Active</span>
                                        </td>
                                        <td>
                                            {{
                                                branch.created_at.substring(
                                                    0,
                                                    10
                                                )
                                            }}
                                        </td>
                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <a
                                                    class="iq-bg-primary"
                                                    data-placement="top"
                                                    @click="getBranch(branch)"
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
                                                            'branches.destroy',
                                                            branch.id
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
                                        branches.total > 10
                                            ? "10"
                                            : branches.total
                                    }}
                                    of {{ branches.total }} entries</span
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
                                            ) in branches.links"
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
        <BranchForm :form="form" :action="action" :item="item" />
    </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import BranchForm from "./BranchForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
    branches: Object,
    filters: Object,
});

let search = ref(props.filters.search);
let url = ref("");

let action = ref("Create");

let item = ref(0);

let form = ref(
    useForm({
        name: "",
        description: "",
        location: "",
        country: "",
        town: "",
        address: "",
        branch_code: "",
    })
);

const create = () => {
    item.value = 0;
    action.value = "Create";
    form.value = useForm({
        name: "",
        description: "",
        location: "",
        country: "",
        town: "",
        address: "",
        branch_code: "",
    });
};

const getBranch = (branch) => {
    action.value = "Edit";
    item.value = branch.id;
    form.value = useForm({
        name: branch.name,
        description: branch.description,
        location: branch.location,
        country: branch.country,
        town: branch.town,
        address: branch.address,
        branch_code: branch.branch_code,
    });
};

watch(
    search,
    debounce((value) => {
        Inertia.get(
            route("branches.index"),
            { search: search.value },
            { preserveState: true, replace: true }
        );
    }, 500)
);
</script>
