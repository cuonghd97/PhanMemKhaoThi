$(document).ready(function() {
  $('#datatable-buttons').DataTable( {
    destroy: true,
    "ajax": {
        "url": "/data-lop-json/",
        "dataSrc": ""
    },
    "columns": [
        { "data": "MaLop" },
        { "data": "TenLop" },
        { "data": "KhoaHoc" },
    ],
    "columnDefs": [{
      "targets": 3,
      "data": null,
      "defaultContent": "<button id='info' style='margin: 5px;' class='xem btn btn-info'><i class='fa fa-eye'></i></button><button class='xoa btn btn-danger'><i class='fa fa-times'></i></button>"
  }],
} );
  // $('#datatable-buttons').DataTable()
  // $.ajax({
  //   url: "/data-lop-json/",
  //   type: "GET",
  //   dataType: "json",
  //   success: function(data) {
  //     element = ``
  //     $.each(data, function(key, value) {
  //       element += `<tr>
  //         <td>${value.MaLop}</td>
  //         <td>${value.TenLop}</td>
  //         <td>${value.KhoaHoc}</td>
  //         <td>${value.id}</td>
  //       </tr>`
  //       $('#datarows').html(element)
  //     })
  //   }
  // })
})
