<template>
    <Main>
        <div class="row">
            <div class="col-sm-12">
                <div class="iq-card">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">Members</h4>
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
                                        :href="route('pdf.members')"
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
                                        <th>Ac Number</th>
                                        <th>Member</th>
                                        <th>Branch</th>
                                        <th>Phone Number</th>
                                        <th>Address</th>
                                        <th>Status</th>
                                        <th>Date Joined</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(member, index) in members.data"
                                        :key="index"
                                    >
                                        <td>
                                            {{ member.account.account_number }}
                                        </td>
                                        <td>
                                            {{ member.first_name }}
                                            {{ member.last_name }}
                                        </td>
                                        <td>{{ member.branch.name }}</td>
                                        <td>{{ member.phone }}</td>
                                        <td>
                                            {{ member.city }},
                                            {{ member.user.country }}
                                        </td>
                                        <td>
                                            <span class="active">Active</span>
                                        </td>
                                        <td>
                                            {{
                                                member.date_became_member.substring(
                                                    0,
                                                    10
                                                )
                                            }}
                                        </td>
                                        <td>
                                            <div
                                                class="flex align-items-center list-user-action"
                                            >
                                                <Link
                                                    class="iq-bg-primary"
                                                    @click="getObject(member)"
                                                    :href="
                                                        route(
                                                            'members.edit',
                                                            member.id
                                                        )
                                                    "
                                                    ><i
                                                        class="ri-pencil-line"
                                                    ></i
                                                ></Link>
                                                <a
                                                    class="iq-bg-primary"
                                                    data-toggle="modal"
                                                    data-placement="top"
                                                    @click="
                                                        url = route(
                                                            'members.destroy',
                                                            member.id
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
                                        members.total > 10
                                            ? "10"
                                            : members.total
                                    }}
                                    of {{ members.total }} entries</span
                                >
                            </div>
                            <div class="col-md-6">
                                <nav aria-label="Page navigation example">
                                    <ul
                                        class="pagination justify-content-end mb-0"
                                    >
                                        <li
                                            class="page-item active"
                                            v-for="(link, ind) in members.links"
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
        <MemberForm :form="form" :action="action" :item="item" />
    </Main>
</template>
<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import MemberForm from "./MemberForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
    members: Object,
    filters: Object,
});

let search = ref(props.filters.search);
let url = ref("");

let action = ref("Create");

let item = ref(0);

let form = ref(
    useForm({
        branch_id: "",
        assigned_to: "",
        first_name: "",
        last_name: "",
        date_of_birth: "",
        nationality: "",
        county: "",
        city: "",
        id_number: "",
        passport_number: "",
        phone: "",
        email: "",
        postal_address: "",
        residential_address: "",
        status_id: "",
        passport_photo: "",
        extra_images: "",
        membership_form: "",
        kra_pin: "",
        employer_name: "",
        residence: "",
        income_bracket: "0 - 50, 000",
        bank_name: "",
        bank_branch: "",
        bank_account_number: "",
        next_of_kin: "",
        next_of_kin_relationship: "",
        next_of_kin_postal_address: "",
        next_of_kin_phone_number: "",
        next_of_kin_email: "",
        date_became_member: "date_became_member",
    })
);

const create = () => {
    item.value = 0;
    action.value = "Create";
    form.value = useForm({
        branch_id: "",
        assigned_to: "",
        first_name: "",
        last_name: "",
        date_of_birth: "",
        nationality: "",
        county: "",
        city: "",
        id_number: "",
        passport_number: "",
        phone: "",
        email: "",
        postal_address: "",
        residential_address: "",
        status_id: "",
        passport_photo: "",
        extra_images: "",
        membership_form: "",
        kra_pin: "",
        employer_name: "",
        residence: "",
        income_bracket: "0 - 50, 000",
        bank_name: "",
        bank_branch: "",
        bank_account_number: "",
        next_of_kin: "",
        next_of_kin_relationship: "",
        next_of_kin_postal_address: "",
        next_of_kin_phone_number: "",
        next_of_kin_email: "",
        date_became_member: "",
    });
};

const getObject = (member) => {
    action.value = "Edit";
    item.value = member.id;
    form.value = useForm({
        member_id: member.member,
        first_name: member.first_name,
        last_name: member.last_name,
        date_of_birth: member.date_of_birth,
        date_became_member: member.date_became_member,
        nationality: member.nationality,
        county: member.county,
        city: member.city,
        id_number: member.id_number,
        passport_number: member.passport_number,
        phone: member.phone,
        email: member.email,
        postal_address: member.postal_address,
        residential_address: member.residential_address,
        status_id: member.status_id,
    });
};

watch(
    search,
    debounce((value) => {
        Inertia.get(
            route("members.index"),
            { search: search.value },
            { preserveState: true, replace: true }
        );
    }, 500)
);
</script>
