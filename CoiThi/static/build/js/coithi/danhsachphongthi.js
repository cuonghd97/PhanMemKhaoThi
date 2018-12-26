$(document).ready(function () {
    var table = $('#datatable-buttons').DataTable({
        "deferLoading": 0,
        destroy: true,
        "ajax": {
            "type": "GET",
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
            "searchable": false,
            "orderable": false,
            "targets": 0
        }],
        "order": [[ 1, 'asc' ]],
        createdRow: function(row, data, dataIndex) {
            date = new Date(data['ngaythi'] + ' ' + data['gio'])

            if (date.setMinutes(date.getMinutes() + data['thoigianthi']) >= Date.now()) {
                $(row).find('a').attr('data-time', data['gio']).attr('data-date', data['ngaythi']).addClass('nut').attr('href', '/coithi/' + data['id'])
            }
            else {
                $(row).find('a').attr('data-time', data['gio']).attr('data-date', data['ngaythi']).addClass('disabled')
            }
        }
    })
    table.on( 'order.dt search.dt', function () {
        table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
})
