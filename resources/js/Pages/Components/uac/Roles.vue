<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Roles</h4>
            </div>
            <div class="user-list-files d-flex float-right">
              <a class="iq-bg-primary" href="javascript:void();"> Excel </a>
              <a class="iq-bg-primary" :href="route('pdf.members')"> Print </a>
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
          <div class="iq-card-body">
            <div class="table-responsive">
              <table
                id="user-list-table"
                class="table table-striped table-borderless"
                role="grid"
                aria-describedby="user-list-page-info"
              >
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Permissions</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="obj in roles.data" :key="obj.id">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.permissions.length }} out of
                      {{ permissions.length }}
                    </td>
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
                  >Showing 1 to {{ roles.total > 10 ? "10" : roles.total }} of
                  {{ roles.total }} entries</span
                >
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li
                      class="page-item active"
                      v-for="(link, ind) in roles.links"
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
    <RoleForm
      :form="form"
      :action="action"
      :item="item"
      :permissions="permissions"
    />
  </Main>
</template>

<script setup>
import { Inertia } from "@inertiajs/inertia";
import { useForm } from "@inertiajs/inertia-vue3";
import { ref, watch } from "vue";
import RoleForm from "./RoleForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  roles: Object,
  permissions: Object,
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
    name: "",
    permissions: [],
  });
};

const getItem = (obj) => {
  action.value = "Edit";
  item.value = obj.id;

  let p = [];

  obj.permissions.forEach((i) => p.push(i.id));
  form.value = useForm({
    name: obj.name,
    permissions: p,
  });
};
</script>

<style>
</style>