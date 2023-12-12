<template>
    <div class="row">
        <div class="col-md-4 mt-3" v-if="options != null">
            <apexchart
                width="100%"
                type="bar"
                height="380"
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
import { usePage } from "@inertiajs/inertia-vue3";
import { onMounted, ref } from "vue";
const page = usePage();

const props = page.props.value;
let options = ref(null);

console.log(props.loans);

let series = ref(null);

let pieOptions = {
    title: {
        text: "Monthly Transactions",
        position: "center",
    },
    labels: ["Deposits", "Loans"],
    legend: {
        position: "top",
    },
};
let pieSeries = [props.deposits_total, props.loans_total];

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

onMounted(() => {
    const months = [];
    const today = new Date();

    for (let i = 0; i < 12; i++) {
        const month = new Date(today);
        month.setMonth(today.getMonth() - i);
        const monthName = month.toLocaleString("default", { month: "short" });
        months.unshift(monthName);
    }
    console.log(months);

    // Create an object to store loans by month
    const loansByMonth = {};

    // Get the current date and calculate the date 12 months ago
    const twelveMonthsAgo = new Date(today);
    twelveMonthsAgo.setMonth(today.getMonth() - 12);

    // Iterate through the loans and group them by month while calculating the sum
    props.loans.forEach((loan) => {
        const startDate = new Date(loan.start_date);
        if (startDate >= twelveMonthsAgo && startDate <= today) {
            const month = startDate.getMonth() + 1; // Adding 1 because months are zero-based
            const monthKey = month.toString();

            if (!loansByMonth[monthKey]) {
                loansByMonth[monthKey] = { loans: [], total: 0 };
            }

            loansByMonth[monthKey].loans.push(loan);
            loansByMonth[monthKey].total += parseFloat(loan.amount_approved);
        }
    });

    // Create an array of 12 items, one for each month, with total amounts
    const monthsArray = [];
    const totalsArray = [];
    for (let i = 12; i > 0; i--) {
        const monthKey = (today.getMonth() - i + 2).toString(); // Adding 2 to account for zero-based months and current month
        monthsArray.push({
            month: monthKey,
            loans: loansByMonth[monthKey] ? loansByMonth[monthKey].loans : [],
            total: loansByMonth[monthKey] ? loansByMonth[monthKey].total : 0,
        });
        totalsArray.push(
            loansByMonth[monthKey] ? loansByMonth[monthKey].total : 0
        );
    }

    console.log(monthsArray);
    console.log(totalsArray);

    options.value = {
        chart: {
            height: 350,
            type: "bar",
        },
        toolbar: {
            show: false,
        },
        stroke: {
            show: true,
            width: 2,
            colors: ["transparent"],
        },
        xaxis: {
            categories: months,
            position: "bottom",

            axisTicks: {
                show: false,
            },
            crosshairs: {
                fill: {
                    type: "gradient",
                    gradient: {
                        colorFrom: "#D8E3F0",
                        colorTo: "#BED1E6",
                        stops: [0, 100],
                        opacityFrom: 0.4,
                        opacityTo: 0.5,
                    },
                },
            },
            tooltip: {
                enabled: true,
            },
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    position: "top", // top, center, bottom
                },
            },
        },
        dataLabels: {
            enabled: true,
            formatter: function (val) {
                return val.toLocaleString("en-US");
            },
            offsetY: -20,
            style: {
                fontSize: "12px",
                colors: ["#304758"],
            },
        },
        yaxis: {
            axisBorder: {
                show: false,
            },
            axisTicks: {
                show: false,
            },
            labels: {
                show: false,
                formatter: function (val) {
                    return val + "%";
                },
            },
        },
        title: {
            text: "Active Loans",
            style: {
                color: "#444",
            },
        },
    };

    series.value = [
        {
            name: "Amount (KES)",
            data: totalsArray,
        },
    ];
});
</script>
