<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Leads</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="row justify-content-between">
              <div class="col-sm-12 col-md-5">
                <div id="user_list_datatable_info" class="dataTables_filter">
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
                  <a class="iq-bg-primary" href="javascript:void();"> Print </a>
                  <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
                  <a class="iq-bg-primary" href="javascript:void();"> Pdf </a>
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
                    <th>Lead</th>
                    <th>Branch</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Assigned To</th>
                    <th>Status</th>
                    <th>Date Created</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(lead, index) in leads.data" :key="index">
                    <td>{{ lead.first_name }} {{ lead.last_name }}</td>
                    <td>{{ lead.branch.name }}</td>
                    <td>{{ lead.phone }}</td>
                    <td>{{ lead.city }}, {{ lead.nationality }}</td>
                    <td>{{ lead.assignedTo.first_name }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >Active</span
                      >
                    </td>
                    <td>{{ lead.created_at.substring(0, 10) }}</td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <a
                          class="iq-bg-primary"
                          data-placement="top"
                          @click="getObject(lead)"
                          data-toggle="modal"
                          data-target="#formModal"
                          href="javascript:void();"
                          ><i class="ri-pencil-line"></i
                        ></a>
                        <a
                          class="iq-bg-primary"
                          data-toggle="modal"
                          data-placement="top"
                          @click="url = route('leads.destroy', lead.id)"
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
            <div class="row justify-content-between mt-3">
              <div id="user-list-page-info" class="col-md-6">
                <span
                  >Showing 1 to {{ leads.total > 10 ? "10" : leads.total }} of
                  {{ leads.total }} entries</span
                >
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li
                      class="page-item active"
                      v-for="(link, ind) in leads.links"
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
    <LeadForm :form="form" :action="action" :item="item" />
  </Main>
</template>
<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import LeadForm from "./LeadForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  leads: Object,
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
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
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
  });
};

const getObject = (lead) => {
  action.value = "Edit";
  item.value = lead.id;
  form.value = useForm({
    lead_id: lead.lead,
    first_name: lead.first_name,
    last_name: lead.last_name,
    date_of_birth: lead.date_of_birth,
    nationality: lead.nationality,
    county: lead.county,
    city: lead.city,
    id_number: lead.id_number,
    passport_number: lead.passport_number,
    phone: lead.phone,
    email: lead.email,
    postal_address: lead.postal_address,
    residential_address: lead.residential_address,
    status_id: lead.status_id,
  });
};

watch(
  search,
  debounce((value) => {
    Inertia.get(
      route("leads.index"),
      { search: search.value },
      { preserveState: true, replace: true }
    );
  }, 500)
);
</script>