<template>
  <Main>
    <div class="row">
      <div class="col-sm-12">
        <div class="iq-card">
          <div class="iq-card-header d-flex justify-content-between">
            <div class="iq-header-title">
              <h4 class="card-title">Organizations</h4>
            </div>
          </div>
          <div class="iq-card-body">
            <div class="table-responsive">
              <div class="row justify-content-between">
                <div class="col-sm-12 col-md-6">
                  <div id="user_list_datatable_info" class="dataTables_filter">
                    <form class="mr-3 position-relative">
                      <div class="form-group mb-0">
                        <input
                          type="search"
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
                    <a class="iq-bg-primary" href="javascript:void();">
                      Print
                    </a>
                    <a class="iq-bg-primary" href="javascript:void();">
                      Excel
                    </a>

                    <Link
                      class="iq-bg-primary"
                      :href="route('organizations.create')"
                      :data="{ action: 'create' }"
                    >
                      New
                    </Link>
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
                    <th>Logo</th>
                    <th>Business Name</th>
                    <th>Business Type</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Status</th>
                    <th>Address</th>
                    <th>Created On</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(organization, index) in organizations"
                    :key="index"
                  >
                    <td class="text-center">
                      <img
                        class="rounded-circle img-fluid avatar-40"
                        src="/images/user/01.jpg"
                        alt="profile"
                      />
                    </td>
                    <td>{{ organization.business_name }}</td>
                    <td>{{ organization.business_type }}</td>
                    <td>{{ organization.phone }}</td>
                    <td>{{ organization.email }}</td>
                    <td>{{ organization.country }}</td>
                    <td>
                      <span class="badge dark-icon-light iq-bg-primary"
                        >Active</span
                      >
                    </td>
                    <td>{{ organization.physical_address }}</td>
                    <td>{{ organization.created_at.substring(0, 10) }}</td>
                    <td>
                      <div class="flex align-items-center list-user-action">
                        <Link
                          class="iq-bg-primary"
                          data-toggle="tooltip"
                          data-placement="top"
                          title=""
                          data-original-title="Add"
                          :href="route('organizations.show', organization.id)"
                          ><i class="ri-user-add-line"></i
                        ></Link>
                        <Link
                          class="iq-bg-primary"
                          data-toggle="tooltip"
                          data-placement="top"
                          title=""
                          :href="route('organizations.create')"
                          :data="{ action: 'edit', id: organization.id }"
                          data-original-title="Edit"
                          ><i class="ri-pencil-line"></i
                        ></Link>
                        <a
                          class="iq-bg-primary"
                          data-toggle="tooltip"
                          data-placement="top"
                          title=""
                          data-original-title="Delete"
                          href="#"
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
                <span>Showing 1 to 5 of 5 entries</span>
              </div>
              <div class="col-md-6">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end mb-0">
                    <li class="page-item disabled">
                      <a
                        class="page-link"
                        href="#"
                        tabindex="-1"
                        aria-disabled="true"
                        >Previous</a
                      >
                    </li>
                    <li class="page-item active">
                      <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">Next</a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Main>
</template>
<script setup>
import { usePage } from "@inertiajs/inertia-vue3";

const organizations = usePage().props.value.organizations;
</script>