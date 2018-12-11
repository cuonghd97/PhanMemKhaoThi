$(document).ready(function() {
    $('#quanlykithi').DataTable( {
        "ajax": {
            "type": "GET",
            "url": "/adminkt/quan_ly_ki_thi/data",
            "contentType": "application/json; charset=utf-8",
            "dataSrc":  ""
        },
        "columns": [
            { "data": "id" },
            { "data": "MaKyThi" },
            { "data": "MonHoc_id" },
            { "data": "KhoaHoc_id" },
            { "data": "NgayThi" }
        ],
    });
});