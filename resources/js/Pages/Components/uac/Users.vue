<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Users</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
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
                    <a class="iq-bg-primary" href="javascript:void();">
                      Excel
                    </a>
                    <a class="iq-bg-primary" :href="route('pdf.members')">
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
              <table
                id="user-list-table"
                class="table table-striped table-borderless mt-4"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Profile</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="obj in users.data" :key="obj.id">
                    <td class="text-center">
                      <img
                        class="rounded-circle img-fluid avatar-40"
                        src="images/user/09.jpg"
                        alt="profile"
                      />
                    </td>
                    <td>{{ obj.first_name }} {{ obj.last_name }}</td>
                    <td>{{ obj.phone }}</td>
                    <td>{{ obj.email }}</td>
                    <td>{{ obj.role.name }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >active</span
                      >
                    </td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <a
                          class="iq-bg-primary"
                          data-placement="top"
                          @click="getItem(obj)"
                          data-toggle="modal"
                          data-target="#formModal"
                          href="javascript:void();"
                          ><i class="ri-pencil-line"></i
                        ></a>
                        <a
                          class="iq-bg-primary"
                          data-toggle="modal"
                          data-placement="top"
                          @click="url = route('deposits.destroy', obj.id)"
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
                  >Showing 1 to {{ users.total > 10 ? "10" : users.total }} of
                  {{ users.total }} entries</span
                >
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li
                      class="page-item active"
                      v-for="(link, ind) in users.links"
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
    <UserForm :form="form" :action="action" :item="item" :roles="roles" />
  </Main>
</template>

<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import UserForm from "./UserForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  users: Object,
  roles: Object,
  filters: Object,
});

let search = ref(props.filters.search);
let url = ref("");

let action = ref("Create");

let item = ref(0);

let form = ref(useForm({}));

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    first_name: "",
    last_name: "",
    phone: "",
    email: "",
    user_type: "user",
    role_id: "",
  });
};

const getItem = (obj) => {
  action.value = "Edit";
  item.value = obj.id;
  form.value = useForm({
    first_name: obj.first_name,
    last_name: obj.last_name,
    phone: obj.phone,
    email: obj.email,
    user_type: "user",
    role_id: obj.role_id,
  });
};
watch(
  search,
  debounce((value) => {
    Inertia.get(
      route("get-users"),
      { search: search.value },
      { preserveState: true, replace: true }
    );
  }, 500)
);
</script>

<style>
</style>