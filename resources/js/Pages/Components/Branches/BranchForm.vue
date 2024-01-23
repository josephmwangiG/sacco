<template>
    <div
        class="modal fade"
        id="formModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="formModal"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="formModal">
                        {{ action }} Branch.
                    </h5>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="saveForm()">
                    <div class="modal-body modal-div">
                        <div class="new-user-info">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="name">Branch Name:</label>
                                    <input
                                        type="text"
                                        v-model="form.name"
                                        class="form-control"
                                        required
                                        id="name"
                                        placeholder="Branch Name"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.name"
                                    >
                                        <small>{{ form.errors.name }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="branch_code"
                                        >Branch Code:</label
                                    >
                                    <input
                                        type="number"
                                        class="form-control"
                                        required
                                        v-model="form.branch_code"
                                        id="branch_code"
                                        placeholder="Branch Code"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.branch_code"
                                    >
                                        <small>{{
                                            form.errors.branch_code
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address"
                                        >Physical Address:</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="address"
                                        v-model="form.address"
                                        placeholder="Address"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.address"
                                    >
                                        <small>{{ form.errors.address }}</small>
                                    </div>
                                </div>

                                <div class="form-group col-sm-6">
                                    <label>Country:</label>
                                    <select
                                        required
                                        v-model="form.country"
                                        class="form-control"
                                        id="selectcountry"
                                    >
                                        <option value="">Select Country</option>
                                        <option>Kenya</option>
                                        <!-- <option>Uganda</option>
                    <option>Tanzania</option>
                    <option>South Africa</option> -->
                                    </select>
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.country"
                                    >
                                        <small>{{ form.errors.country }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="pno">County/City:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="pno"
                                        v-model="form.town"
                                        placeholder="County/State"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.town"
                                    >
                                        <small>{{ form.errors.town }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1"
                                            >Description</label
                                        >
                                        <textarea
                                            class="form-control"
                                            v-model="form.description"
                                            placeholder="Short description"
                                            id="exampleFormControlTextarea1"
                                            rows="4"
                                        ></textarea>
                                        <div
                                            class="text-danger"
                                            v-if="form.errors.description"
                                        >
                                            <small>{{
                                                form.errors.description
                                            }}</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            id="closeModal"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="submit" class="btn btn-primary">
                            {{ action }} Branch
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
const props = defineProps({
    form: Object,
    action: String,
    item: Number,
});

function saveForm() {
    if (props.action == "Edit") {
        props.form.put(route("branches.update", props.item), {
            onSuccess: () => {
                props.form.reset();
                document.getElementById("closeModal").click();
            },
        });
    } else {
        props.form.post(route("branches.store"), {
            onSuccess: () => {
                props.form.reset();
                document.getElementById("closeModal").click();
            },
        });
    }
}
</script>
