$(document).ready(function () {
  $("#submit_dapan").on("click",function(){
    var formData = new FormData();
    formData.append('csrfmiddlewaretoken',$("input[name=csrfmiddlewaretoken]").val());
    kithi = $("select[name=tenkithi]").val();
    made = $("input[name=made]").val()
    formData.append('tenkithi',kithi);
    formData.append('made',made);
    formData.append('danhsachdapan',$("#file-form input[type=file]")[0].files[0]);

    $.ajax({
        type: 'POST',
        url: '/upload-dapan/',
        data : formData,
        contentType: false,
        processData: false,
        success: function (data) {
          alert(data[0].msg);
        }
      })
  });
});
