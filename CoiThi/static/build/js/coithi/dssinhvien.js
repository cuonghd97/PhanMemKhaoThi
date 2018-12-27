$(document).ready(function() {
  $('.danhsachsinhvien').DataTable({
    paging: false,
    "columnDefs": [
      { "width": "10%", "targets": 3 }
    ],
    "columnDefs": [
      { "width": "50px", "targets": 4 }
    ],
    "columnDefs": [
      { "width": "50px", "targets": 5 }
    ]
  })
})
