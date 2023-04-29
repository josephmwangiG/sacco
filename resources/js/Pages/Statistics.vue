<template>
  <div class="row">
    <div class="col-md-4 mt-3">
      <apexchart
        width="100%"
        height="380"
        type="bar"
        :options="options"
        :series="series"
      ></apexchart>
    </div>
    <div class="col-md-4 mt-3">
      <apexchart
        width="100%"
        height="380"
        type="bar"
        :options="columnOptions"
        :series="columnSeries"
      ></apexchart>
    </div>
    <div class="col-md-4 mt-3">
      <apexchart
        width="100%"
        class=""
        height="380"
        type="donut"
        :options="pieOptions"
        :series="pieSeries"
      >
      </apexchart>
    </div>
  </div>
</template>
<script setup>
let options = {
  chart: {
    id: "vuechart-example",
  },
  toolbar: {
    show: false,
  },
  title: {
    text: "Loan Appliccations",
  },
  xaxis: {
    categories: [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ],
  },
};

let series = [
  {
    name: "Millions KES",
    data: [60, 50, 45, 50, 49, 60, 57, 50, 62, 66, 60, 60],
  },
];

let pieOptions = {
  title: {
    text: "Monthly Transactions",
  },
  labels: ["Deposits", "Withdrawals", "Loans"],
  legend: {
    position: "top",
  },
};
let pieSeries = [30, 40, 45];

let columnOptions = {
  chart: {
    stacked: true,
    type: "bar",
  },
  title: {
    text: "Arrears",
  },
};
let columnSeries = [
  {
    name: "Paid",
    data: [
      {
        x: "Loans",
        y: 10,
      },
      {
        x: "Deposits",
        y: 18,
      },
      {
        x: "Disbursments",
        y: 5,
      },
    ],
  },
  {
    name: "Due Payments",
    data: [
      {
        x: "Loans",
        y: 5,
      },
      {
        x: "Deposits",
        y: 6,
      },
      {
        x: "Disbursments",
        y: 13,
      },
    ],
  },
];
</script>