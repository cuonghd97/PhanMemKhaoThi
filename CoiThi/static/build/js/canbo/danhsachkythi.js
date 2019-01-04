$(document).ready(function () {
  $('#datatable-buttons').DataTable({
    destroy: true,
    "ajax": {
      "type": "get",
      "url": "/data-kythi",
      "dataSrc": "",
    },
    "columns": [
      {
        "data": "no"
      },
      {
        "data": "tenkythi"
      },
      {
        "data": "ngaybatdau"
      },
      {
        "data": "ngayketthuc"
      }
    ],
    "columnDefs": [
      {
        "targets": 4,
        "data": null,
        "defaultContent": `
          <a class='btn btn-primary' href="/danh-sach-phong/">Chi tiết</a>
        `
      }
    ],
    createdRow: function (row, data, dataIndex) {
      $(row).find('a').attr('href', '/danh-sach-phong/' + data["makythi"])
    }
  })
})
