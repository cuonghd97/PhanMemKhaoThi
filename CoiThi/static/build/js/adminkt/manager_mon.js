$(document).ready(function(){
    var table_mon = $('#list_mon').DataTable({
        "ajax": {
            "type": "GET",
            "url": "/adminkt/manage_mon_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        "order": [[ 0, 'asc' ], [ 1, 'asc' ]],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 50,
    });


    $("#list_mon").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    alert('Xóa thành công');
                    table_mon.ajax.reload(null,false);
                }
           });
        }
    });

    $("#new_mon").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#new_mon  input[name=kieu]").val(title);
        if (title === 'edit'){
            var id = button.attr('id').split('_')[1];
            $("#new_mon input[name=id]").val(id);
            var ten = $("#tenmon_"+id).text();
            $("#new_mon input[name=tenmon]").val(ten);
            var ma = $("#mamon_"+id).text();
            $("#new_mon input[name=mamon]").val(ma);
            $('#new_mon_title').html("Chỉnh sửa môn")
            $("#create_new_mon").html("Chỉnh sửa");
        }else{
            $("#new_mon input[name=id]").val(0);
            $("#new_mon input[name=mamon]").val("");
            $("#new_mon input[name=tenmon]").val();
            $('#new_mon_titlee').html("Tạo mới lớp")
            $("#create_new_mon").html("Tạo mới");
        }
    });

    $('#create_new_mon').click( function(){
        var kieu = $("#new_mon  input[name=kieu]").val();
        
        var token = $("#new_mon input[name=csrfmiddlewaretoken]").val();
        var id = $("#new_mon input[name=id]").val();
        var mamon = $("#new_mon input[name=mamon]").val();
        var tenmon = $("#new_mon input[name=tenmon]").val();
        $.ajax({
            type:'POST',
            url:location.href,
            data: {'csrfmiddlewaretoken':token, 'kieu':kieu, 'id':id, 'mamon': mamon, 'tenmon': tenmon},
            success: function(){
                $("#new_mon").modal("hide");
                if(kieu === 'edit')
                {
                    alert('Chỉnh sửa thành công');
                }
                else{
                    alert('Tạo mới thành công');
                }
                table_mon.ajax.reload(null,false);
            }
        });
    });


});