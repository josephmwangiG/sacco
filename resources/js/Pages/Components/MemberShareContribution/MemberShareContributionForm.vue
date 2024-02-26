<template>
    <div
        class="modal"
        id="formModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="formModal"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        {{ action }} Member Share Contribution
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
                            <!-- Member Field -->

                            <div class="form-group col-sm-6">
                                <label for="member">Member:</label>
                                <select
                                    required
                                    v-model="form.member_id"
                                    class="form-control"
                                    id="member"
                                    @change="selectMember($event)"
                                >
                                    <option value="">Select option</option>
                                    <option
                                        v-for="member in members"
                                        :key="member.id"
                                        :value="member.id"
                                    >
                                        {{ member.user.first_name }}
                                        {{ member.user.last_name }}
                                    </option>
                                </select>
                            </div>

                            <!-- Payment Method Field -->
                            <div class="form-group col-sm-6">
                                <label for="payment_method"
                                    >Payment Method:</label
                                >
                                <select
                                    required
                                    v-model="form.paymentmethod_id"
                                    class="form-control"
                                >
                                    <option value="">Select option</option>
                                    <option
                                        v-for="paymentMethod in paymentMethods"
                                        :key="paymentMethod.id"
                                        :value="paymentMethod.id"
                                    >
                                        {{ paymentMethod.name }}
                                    </option>
                                </select>
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="sharetype">ShareType:</label>
                                <select
                                    required
                                    v-model="form.sharetype_id"
                                    class="form-control"
                                >
                                    <option value="">Select option</option>
                                    <option
                                        v-for="sharetype in sharetypes"
                                        :key="sharetype.id"
                                        :value="sharetype.id"
                                    >
                                        {{ sharetype.category }}
                                    </option>
                                </select>
                            </div>

                            <!-- Amount Field -->
                            <div class="form-group col-md-6">
                                <label for="amount">Amount:</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    required
                                    v-model="form.amount"
                                    id="amount"
                                    placeholder="Amount"
                                />
                            </div>

                            <!-- Date of Payment Field -->
                            <div class="form-group col-md-6">
                                <label for="payment_date"
                                    >Date of Payment:</label
                                >
                                <input
                                    type="date"
                                    class="form-control"
                                    v-model="form.date_of_payment"
                                    id="payment_date"
                                    placeholder="Date of Payment"
                                />
                            </div>

                            <!-- Description Field -->
                            <div class="form-group col-md-12">
                                <label for="description">Description:</label>
                                <textarea
                                    class="form-control"
                                    v-model="form.description"
                                    id="description"
                                    placeholder="Description"
                                    rows="4"
                                ></textarea>
                            </div>

                            <!-- Account Number Field -->
                            <div class="form-group col-md-12">
                                <label for="account_number"
                                    >Account Number:</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="form.account_number"
                                    id="account_number"
                                    placeholder="Account Number"
                                    readonly
                                />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="submit" class="btn btn-primary">
                            {{ action }} Member Share Contribution
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import { usePage } from "@inertiajs/inertia-vue3";

const props = defineProps({
    form: Object,
    action: String,
});

const paymentMethods = usePage().props.value.paymentMethods;
const members = usePage().props.value.members;
const sharetypes = usePage().props.value.sharetypes

const selectMember = (event) => {
    const selectedMember = members.find(
        (member) => member.id == event.target.value
    );

    if (selectedMember) {
        props.form.id_number = selectedMember.id_number;

        // Check if the selected member has an associated account
        if (selectedMember.account && selectedMember.account.account_number) {
            props.form.account_number = selectedMember.account.account_number;
        } else {
            // Clear the account number field if the account information is not available
            props.form.account_number = "";
        }
    }
};

function saveForm() {

    if (props.action === "Edit") {
        props.form.put(route("membersharecontribution.update", props.item), {
            onSuccess: () => {
                props.form.reset();
                $("#formModal").modal("hide");
            },
        });
    } else {
        console.log("helo");
        props.form.post(route("membersharecontribution.store"), {
            onSuccess: () => {
                props.form.reset();
                $("#formModal").modal("hide");
            },
        });
    }
}

</script>
