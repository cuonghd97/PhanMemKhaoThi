$(document).ready(function () {
    var table_khoa = $('#list_khoa').DataTable({
        "ajax": {
            "type": "GET",
            "url": "/adminkt/manage_khoa_data",
            "contentType": "application/json; charset=utf-8",
            "data": function (result) {
                return JSON.stringify(result);
            },
        },
        "displayLength": 10,
    });
    $("#list_khoa").on('click', '.btn-danger', function () {
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')) {
            $.ajax({
                type: 'POST',
                url: location.href,
                data: { 'delete': id, 'csrfmiddlewaretoken': token },
                success: function () {
                    alert('Đã xóa thành công');
                    table_khoa.ajax.reload(null, false);
                }
            });
        }
    });
    $("#new_khoa").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#new_khoa  input[name=kieu]").val(title);
        if (title === 'edit'){
            var id = button.attr('id').split('_')[1];
            $("#new_khoa input[name=id]").val(id);
            var ten = $("#ten_"+id).text();
            $("#new_khoa input[name=khoa]").val(ten);
            var he = $("#he_"+id).text();
            $("#new_khoa textarea[name=he]").val(he);
            $('#change_khoa_title').html("Chỉnh sửa khóa")
            $("#save_new_khoa").html("Chỉnh sửa");
        }else{
            $("#new_khoa input[name=id]").val(0);
            $('#change_khoa_title').html("Tạo mới khóa")
            $("#new_khoa input[name=khoa]").val("");
            $("#new_khoa textarea[name=he]").val("");
            $("#save_new_khoa").html("Tạo mới");
        }
    });

    $('#save_new_khoa').click( function(){
        var kieu = $("#new_khoa  input[name=kieu]").val();
        var token = $("#new_khoa input[name=csrfmiddlewaretoken]").val();
        var khoa = $("#new_khoa input[name=khoa]").val();
        var he = $("#new_khoa textarea[name=he]").val();
        var id = $("#new_khoa input[name=id]").val();
        $.ajax({
            type:'POST',
            url:location.href,
            data: {'csrfmiddlewaretoken':token, 'kieu':kieu, 'khoa': khoa, 'id':id, 'he':he},
            success: function(){    
                $("#new_khoa").modal("hide");
                table_khoa.ajax.reload(null,false);
                if(kieu == 'edit'){
                    alert('Chỉnh sửa thành công');
                }
                else
                {
                    alert('Tạo mới thành công');
                }
            }
        });
    });
});