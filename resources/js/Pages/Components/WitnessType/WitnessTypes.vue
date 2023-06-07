<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Witness Types</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="row justify-content-between">
              <div class="col-sm-12 col-md-6">
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
              <div class="col-sm-12 col-md-6">
                <div class="user-list-files d-flex float-right">
                  <a class="iq-bg-primary" href="javascript:void();"> Print </a>

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
                    <th>Witness Type</th>
                    <th>Description</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(obj, index) in witnessTypes.data" :key="index">
                    <td>{{ obj.display_name }}</td>
                    <td>
                      {{ obj.description }}
                    </td>
                    <td>
                      <div class="flex align-items-center list-user-action">
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
                          @click="url = route('witnessTypes.destroy', obj.id)"
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
                  >Showing 1 to
                  {{ witnessTypes.total > 10 ? "10" : witnessTypes.total }}
                  of {{ witnessTypes.total }} entries</span
                >
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <Confirm :url="url" />
    <WitnessTypeForm :form="form" :action="action" :item="item" />
  </Main>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { ref, watch } from "vue";
import WitnessTypeForm from "./WitnessTypeForm.vue";
import debounce from "lodash/debounce";

const props = defineProps({
  witnessTypes: Object,
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
  })
);

const create = () => {
  item.value = 0;
  action.value = "Create";
  form.value = useForm({
    name: "",
    description: "",
  });
};

const getObject = (obj) => {
  action.value = "Edit";
  item.value = obj.id;
  form.value = useForm({
    name: obj.name,
    description: obj.description,
  });
};

watch(
  search,
  debounce((value) => {
    Inertia.get(
      route("witnessTypes.index"),
      { search: search.value },
      { preserveState: true, replace: true }
    );
  }, 500)
);
</script>