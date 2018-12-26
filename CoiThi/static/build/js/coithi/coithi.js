$(document).ready(function () {
    $.getJSON('/ds-phongthi', function(data) {
        console.log(data)
    })
    var table = $('#datatable-buttons').DataTable({
        destroy: true,
        "ajax": {
            "url": "/ds-phongthi",
            "dataSrc": ""
        },
        "columns": [{
                "data": "tenphong"
            },
            {
                "data": "monthi",
            },
            {
                "data": "tenlop"
            },
            {
                "data": "gio"
            }
        ],
        "columnDefs": [ {
            "targets": 4,
            "data": null,
            "defaultContent": "<a class='btn btn-primary'>Vào coi thi</a>"
        },
        {
            "targets": [ 3 ],
            "visible": false
        } ]
    });
    $('tbody').find('button')
})
