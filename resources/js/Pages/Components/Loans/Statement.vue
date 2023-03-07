<template>
  <div
    class="modal fade"
    id="loanStatement"
    tabindex="-1"
    role="dialog"
    aria-labelledby="loanStatement"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content modal-div">
        <div class="modal-header">
          <h5 class="modal-title" id="loanStatement">Loan Statement.</h5>
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-label="Close"
          >
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
            <table
              id="user-list-table"
              class="table table-striped table-borderless mt-2"
              role="grid"
            >
              <thead>
                <tr>
                  <th>Loan No.</th>
                  <th>Current Principle</th>
                  <th>Amount Paid</th>
                  <th>Total Interests</th>
                  <th>Total Penalties</th>
                  <th>Status</th>
                  <th>Due Date</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
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
          <button type="submit" class="btn btn-primary">Download</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>

