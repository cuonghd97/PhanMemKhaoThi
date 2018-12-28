$(document).ready(function() {
  var table = $('.danhsachphong').DataTable({
    paging: false,
    destroy: true,
    "ajax": {
      "type": "GET",
      "url": "/ds-phongcham",
      "dataSrc": ""
    },
    "columns":[
      {
        "data": "no"
      },
      {
        "data": "tenmon"
      },
      {
        "data": "tenphong"
      },
      {
        "data": "tencanbocham1"
      },
      {
        "data": "tencanbocham2"
      },
      {
        "data": "hinhthucthi"
      }
    ],
    "columnDefs": [
      {
        "width": "20%",
        "targets": 6,
        "data": null,
        "defaultContent": `
                    <li role="presentation" class="dropdown" style="list-style-type: none;">
                      <a id="drop4" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                                Chấm thi
                                <span class="caret"></span>
                            </a>
                      <ul id="menu6" class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" data-cham='chamtay' class='cham'>Chấm tay</a>
                        </li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" data-cham='chamtudong' class='cham'>Chấm tự động</a>
                        </li>
                      </ul>
                    </li>
                  `
      },
      {
        "searchable": false,
        "orderable": false,
        "targets": 0
      }
    ],
    "order": [[ 1, 'asc' ]],
    createdRow: function(row, data, dataIndex) {
      $(row).find('.cham').attr('data-id', data['idphong'])
    }
  })

  $('table').on('click', '.cham', function() {
    path = $(this).data('cham')
    id = $(this).data('id')
    $(this).attr('href', '/cham-thi/' + path + '/' + id)
  })
})
