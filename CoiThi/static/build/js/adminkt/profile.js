$(document).ready(function () {
    $('#btnluuu').on('click', function () {
      var ten = $('#tencanbo').val()
      var matkhaumoi = $('#password').val()
      var mknhaplai = $('#repassword').val()
      var idcanbo = $('#idcanbo').val()
      if (matkhaumoi != mknhaplai) {
        $('#status').text('Mật khẩu nhập lại không khớp')
        $('#btnluuu').attr("data-target", ".bd-example-modal-sm")
        $('#btnstatus').on('click', function () {
          $('.bd-example-modal-sm').modal('hide')
        })
      } else {
        if (matkhaumoi == '' && mknhaplai == '') {
          matkhaumoi = 'null'
          mknhaplai = 'notnull'
        }
        $.ajax({
          type: 'POST',
          url: 'update/',
          data: {
            'ten': ten,
            'matkhaumoi': matkhaumoi,
            'nhaplaimatkhau': mknhaplai,
            'idcanbo': idcanbo,
            csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()
          },
          success: function () {
            $('#status').text('Cập nhật thành công')
            $('.bd-example-modal-sm').modal('show')
            $('#btnstatus').on('click', function () {
              $('.bd-example-modal-sm').modal('hide')
              location.reload()
            })
          }
        })
      }
    })
  })
  