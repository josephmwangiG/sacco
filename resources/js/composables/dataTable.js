import jszip from 'jszip';
import pdfmake from 'pdfmake';
import DataTable from "datatables.net-vue3";
import DataTablesLib from "datatables.net-bs5";
import "datatables.net-buttons/js/buttons.colVis.mjs";
import "datatables.net-buttons/js/buttons.html5.mjs";
import "datatables.net-dt/css/jquery.dataTables.min.css";

export function useDataTable() {
    DataTable.use(DataTablesLib);
    DataTablesLib.Buttons.jszip(jszip);
    // pdfmake.vfs = pdfFonts;

    const eo = {
        columns: [ ':visible' ]
    };
    
    const options = {
        dom: "lfBrtip",
        buttons: [
            'colvis',
            {
                extend: 'excelHtml5',
                exportOptions: eo
            },
            {
                extend: 'pdfHtml5',
                exportOptions: eo
            }
        ]
    };

    return {DataTable, options}
    
}