$(document).ready(function () {
    var table = $('#datatable-buttons').DataTable({
        destroy: true,
        "ajax": {
            "url": "/data-donvi/",
            "dataSrc": ""
        },
        "columns": [{
                "data": "MaDonVi"
            },
            {
                "data": "TenDonVi",
            },
            {
                "data": "QuanSo"
            },
        ],
        "columnDefs": [{
            "targets": 3,
            "data": null,
            "defaultContent": `<a class='xem btn btn-info'><i class='fa fa-eye'></i></a><a class='sua btn btn-primary'><i class='fa fa-edit'></i></a><a class='btn btn-danger xoa'><i class='fa fa-times'></i></a>`
        }],
        // createdRow: function(row, data, dataIndex) {
            // // $(row).find('.sua').attr('data-toggle', 'modal').attr('data-target', '#exampleModal')
        // }
    });

    // Đưa dữ liệu lên modal
    $('tbody').on('click', '.sua', function() {
        $(this).attr('data-toggle', 'modal').attr('data-target', '#exampleModal')
        let data = table.row($(this).parents('tr')).data()
        $('#tendonvi').val(data['TenDonVi'])
        $('#madonvi').val(data['MaDonVi'])
    })

    // Post form để sửa thông tin đơn vị
    $('#btnpost').on('click', function() {
        var MaDonVi = $('#madonvi').val()
        var TenDonVi = $('#tendonvi').val()
        $.ajax({
            type: 'POST',
            url: location.href,
            data: {
                'MaDonVi': MaDonVi,
                'TenDonVi': TenDonVi,
                csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()
            },
            success: function() {
                table.ajax.reload(null, false)
                $('#exampleModal').modal('hide')
            }
        })
    })

    // Xóa
    $('tbody').on('click', '.xoa', function() {
        $(this).attr('data-toggle', 'modal').attr('data-target', '#modalQuestion')
        $('#modalQuestion').find('h3').css('color', 'red')
        let data = table.row($(this).parents('tr')).data()
        $('#madonvi').val(data['MaDonVi'])
    })

    $('#btnxoa').on('click', function() {
        var madonvi = $('#madonvi').val()
        $.ajax({
            type: 'POST',
            url: '/xoa/'+madonvi,
            data: {
                'MaDonVi': madonvi,
                csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()
            },
            success: function() {
                table.ajax.reload(null, false)
                $('#modalQuestion').modal('hide')
            }
        })
    })
})
