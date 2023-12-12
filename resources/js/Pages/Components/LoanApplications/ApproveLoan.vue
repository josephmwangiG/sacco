<template>
    <div
        class="modal fade"
        id="formModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="formModal"
        aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="formModal">Approve Loan</h5>
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
                        <div class="new-user-info my-3">
                            <h6>Are you sure you want to approve this loan?</h6>
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
                            Approve Loan
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
});

function saveForm() {
    props.form.post(route("loanApplications.approve"), {
        onSuccess: () => {
            props.form.reset();
            document.getElementById("closeModal").click();
        },
    });
}
</script>
