export const formatDate = (r_date) => {
    // Parse the input date string into a Date object
    const date = new Date(r_date);

    // Create an array to map month numbers to month names
    const monthNames = [
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
    ];

    // Extract day, month, and year
    const day = date.getDate();
    const month = monthNames[date.getMonth()];
    const year = date.getFullYear();

    // Construct the desired date format
    const formattedDate = `${day} ${month} ${year}`;

    return formattedDate;
};
