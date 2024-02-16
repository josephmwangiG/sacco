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
                        {{ action }} Share.
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
                                    <label for="category">Category:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="category"
                                        v-model="form.category"
                                        placeholder="Category"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.category"
                                    >
                                        <small>{{
                                            form.errors.category
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="has_recurrent_contribution"
                                        >Recurrent Contribution:</label
                                    ><br />
                                    <input
                                        type="checkbox"
                                        v-model="
                                            form.has_recurrent_contribution
                                        "
                                        id="has_recurrent_contribution"
                                    />
                                    Active
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="contribution_period"
                                        >Contribution Period:</label
                                    >
                                    <select
                                        required
                                        v-model="form.contribution_period"
                                        class="form-control"
                                        id="contribution_period"
                                    >
                                        <option value="">Select period</option>
                                        <option value="weekly">Weekly</option>
                                        <option value="monthly">Monthly</option>
                                        <option value="yearly">Yearly</option>
                                    </select>
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.contribution_period"
                                    >
                                        <small>{{
                                            form.errors.contribution_period
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="dividend_percentage"
                                        >Dividend Percentage:</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="dividend_percentage"
                                        v-model="form.dividend_percentage"
                                        placeholder="Dividend Percentage"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.dividend_percentage"
                                    >
                                        <small>{{
                                            form.errors.dividend_percentage
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="can_be_withdrawn"
                                        >Can be Withdrawn:</label
                                    >
                                    <select
                                        required
                                        v-model="form.can_be_withdrawn"
                                        class="form-control"
                                        id="can_be_withdrawn"
                                    >
                                        <option value="">Select option</option>
                                        <option value="yes">Yes</option>
                                        <option value="no">No</option>
                                    </select>
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.can_be_withdrawn"
                                    >
                                        <small>{{
                                            form.errors.can_be_withdrawn
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="min_amount">Min Amount:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="min_amount"
                                        v-model="form.min_amount"
                                        placeholder="Min Amount"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.min_amount"
                                    >
                                        <small>{{
                                            form.errors.min_amount
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="max_amount">Max Amount:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="max_amount"
                                        v-model="form.max_amount"
                                        placeholder="Max Amount"
                                    />
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.max_amount"
                                    >
                                        <small>{{
                                            form.errors.max_amount
                                        }}</small>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="can_be_transferred"
                                        >Can be Transferred:</label
                                    >
                                    <label>
                                        <input
                                            type="radio"
                                            value="yes"
                                            v-model="form.can_be_transferred"
                                        />
                                        Yes
                                    </label>
                                    <label>
                                        <input
                                            type="radio"
                                            value="no"
                                            v-model="form.can_be_transferred"
                                        />
                                        No
                                    </label>
                                    <div
                                        class="text-danger"
                                        v-if="form.errors.can_be_transferred"
                                    >
                                        <small>{{
                                            form.errors.can_be_transferred
                                        }}</small>
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
                            {{ action }} Share
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script setup>
// Import the necessary functions from @inertiajs/inertia
// import { post, route } from "@inertiajs/inertia";
import { defineProps, ref } from "vue";

// Define form fields and methods
const props = defineProps({
    form: Object,
    item: Object,
    action: String,
});

// Define the action variable to be provided by the parent component
const action = ref("");

// Function to handle form submission
const saveForm = async () => {
    try {
        if (action === "Edit") {
            await props.form.put(route("shares-types.update", props.items), {
                onSuccess: () => {
                    props.form.reset();
                    document.getElementById("closeModal").click();
                },
            });
        } else {
            await props.form.post(route("shares-types.store"), {
                onSuccess: () => {
                    props.form.reset();
                    document.getElementById("closeModal").click();
                },
            });
        }
    } catch (error) {
        console.error(error);
    }
};
</script>
