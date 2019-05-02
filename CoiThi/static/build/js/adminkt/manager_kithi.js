$(document).ready(function() {
    $('#quanlykithi').DataTable( {
        "ajax": {
            "type": "GET",
            "url": "/adminkt/quan_ly_ki_thi_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        
        "displayLength": 10,
    });
    $("#quanlykithi").on('click', '.btn-danger', function () {
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')) {
            $.ajax({
                type: 'POST',
                url: location.href,
                data: { 'delete': id, 'csrfmiddlewaretoken': token },
                success: function () {
                    alert('Đã xóa thành công');
                    $('#quanlykithi').DataTable().ajax.reload(null, false);
                }
            });
        }
    });
    var table_room = $('#list_room').DataTable({
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 10,
    });
    $("#detail_room").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#detail_student_title").text("Chi tiết kì thi "+title);
        table_room.ajax.url("/adminkt/manage_kithi/data_" + title).load();
    });
    $("#detail_room").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:'/adminkt/manage_add_kithi/',
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(data){
                    table_room.ajax.reload(null,false);
                    if(data.status == 200){
                        new PNotify({
                            title: 'Thông báo',
                            text: data.msg,
                            type: 'success',
                            hide: true,
                            styling: 'bootstrap3',
                            sticker: true,
                            delay:1500
                        });
                    }
                    if(data.status == 401){
                        new PNotify({
                            title: 'Thông báo',
                            text: data.msg,
                            type: 'error',
                            hide: true,
                            styling: 'bootstrap3',
                            sticker: true,
                            delay:1500
                        });
                    }
                    $("#quanlykithi").DataTable().ajax.reload(null,false);
                }
           });
        }
    });
    function getdate(){
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; 
        var yyyy = today.getFullYear();
        if (dd < 10) {
        dd = '0' + dd;
        } 
        if (mm < 10) {
        mm = '0' + mm;
        } 
        var today = yyyy + '-' + mm + '-' + dd;
        return today
    }
    $("#new_kithi").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#new_kithi  input[name=kieu]").val(title);
        if (title === 'edit'){
            var id = button.attr('id').split('_')[1];
            $("#new_kithi input[name=id]").val(id);
            var ten = $("#tenkithi_"+id).text();
            $("#new_kithi input[name=ten]").val(ten);

            var tungay = $("#tungay_"+id).data("tungay");
            $("#new_kithi input[name=tungay]").val(tungay);
            $("#new_kithi input[name=tungay]").attr('min',getdate());

            var denngay = $("#denngay_"+id).data("denngay")
            $("#new_kithi input[name=denngay]").val(denngay);
            $("#new_kithi input[name=denngay]").attr('min',getdate());

            $('#change_kithi_title').html("Chỉnh sửa kì thi")
            $("#save_new_kithi").html("Chỉnh sửa");
        }else{
            
            $("#new_kithi input[name=id]").val(0);
            $('#change_kithi_title').html("Tạo mới kì thi")
            $("#new_kithi input[name=ten]").val("");
            $("#new_kithi input[name=tungay]").val("");
            $("#new_kithi input[name=tungay]").attr('min',getdate());
            $("#new_kithi input[name=denngay]").val("");
            $("#new_kithi input[name=denngay]").attr('min',getdate());
            $("#save_new_kithi").html("Tạo mới");
        }
    });
    $('#save_new_kithi').click( function(){
        var kieu = $("#new_kithi  input[name=kieu]").val();
        var token = $("#new_kithi input[name=csrfmiddlewaretoken]").val();
        var ten = $("#new_kithi input[name=ten]").val();
        var tungay = $("#new_kithi input[name=tungay]").val();
        var denngay = $("#new_kithi input[name=denngay]").val();
        var id = $("#new_kithi input[name=id]").val();
        $.ajax({
            type:'POST',
            url:location.href,
            data: {'csrfmiddlewaretoken':token, 'kieu':kieu, 'tenkithi': ten, 'id':id, 'tungay':tungay,'denngay':denngay},
            success: function(){    
                $("#new_kithi").modal("hide");
                location.reload();
            }
        });
    });
    $('#add_room input[name=tenkithi]').change(function(){
        $("#lskithi option").each(function(){
            if($("#add_room input[name=tenkithi]").val() == $(this).val()){
                kithi = $(this).data("kt");
                // var tungay = $('#tungay_'+kithi).data('tungay');
                // var denngay = $('#denngay_'+kithi).data('denngay');
                // alert(kithi);
                $("#add_room input[name=ngaythi]").attr('min',$('#tungay_'+kithi).data('tungay'));
                $("#add_room input[name=ngaythi]").attr('max',$('#denngay_'+kithi).data('denngay'));
            }
        });
    });
    $('#save_add_room').click( function(){
        var kieu = 'new';
        var token = $("#add_room input[name=csrfmiddlewaretoken]").val();
        var tenphong = $("#add_room input[name=tenphong]").val();
        var vitri = $("#add_room input[name=vitri]").val();
        var gio = $("#add_room input[name=gio]").val();
        var ngaythi = $("#add_room input[name=ngaythi]").val();
        var thoiGianthi = $("#add_room input[name= thoiGianthi]").val();
        hinhthuc = '';
        $("#lsht option").each(function(){
            if($("#add_room input[name=hinhthuc").val() == $(this).val()){
                hinhthuc = $("#add_room input[name=hinhthuc").val();
                return false;
            }
        });
        if(hinhthuc == ''){
            alert("Hình thức thi không chính xác");
            return false;
        }
        kithi = '';
        $("#lskithi option").each(function(){
            if($("#add_room input[name=tenkithi]").val() == $(this).val()){
                kithi = $(this).data("kt");
                return false;
            }
        });
        if(kithi == ''){
            alert("Lớp không chính xác");
            return false;
        }
        lop = '';
        $("#lsl option").each(function(){
            if($("#add_room input[name=tenlop]").val() == $(this).val()){
                lop = $(this).data("lop");
                return false;
            }
        });
        if(lop == ''){
            alert("Lớp không chính xác");
            return false;
        }
        
        var cbc1 = '';
        $("#lscb1 option").each(function(){
            if($("#add_room input[name=cbc1]").val() == $(this).val()){
                cbc1 = $(this).data("cb");
                return false;
            }
        });
        if(cbc1 == ''){
            alert("Cán bộ coi 1 không chính xác");
            return false;
        }
        var cbc2 = '';
        $("#lscb2 option").each(function(){
            if($("#add_room input[name=cbc2]").val() == $(this).val()){
                cbc2 = $(this).data("cb");
                return false;
            }
        });
        if(cbc2 == ''){
            alert("Cán bộ coi 2 không chính xác");
            return false;
        }
        var canbocham1 = '';
        $("#ls1 option").each(function(){
            if($("#add_room input[name=cc1]").val() == $(this).val()){
                canbocham1 = $(this).data("cb");
                return false;
            }
        });
        if(canbocham1 == ''){
            alert("Cán bộ chấm 1 không chính xác");
            return false;
        }
        
        var canbocham2 = '';
        $("#ls2 option").each(function(){
            if($("#add_room input[name=cc2]").val() == $(this).val()){
                canbocham2 = $(this).data("cb");
                return false;
            }
        });
        if(canbocham2 == ''){
            alert("Cán bộ chấm 2 không chính xác");
            return false;
        }
        $.ajax({
            type:'POST',
            url:'/adminkt/manage_add_kithi/',
            data: {'csrfmiddlewaretoken':token,'kieu':kieu, 'lop':lop, 
                    'kithi':kithi,'cbc1':cbc1,'cbc2':cbc2,
                    'cbcham1':canbocham1 ,'cbcham2':canbocham2,
                    'tenphong':tenphong,'vitri':vitri,'ngaythi':ngaythi,'gio':gio,
                    'hinhthuc':hinhthuc,'thoigian':thoiGianthi
                    },
            success: function(data){
                $("#add_room").modal("hide");
                if(data.status == 200){
                    new PNotify({
                        title: 'Thông báo',
                        text: data.msg,
                        type: 'success',
                        hide: true,
                        styling: 'bootstrap3',
                        sticker: true,
                        delay:1500
                    });
                }
                if(data.status == 401){
                    new PNotify({
                        title: 'Thông báo',
                        text: data.msg,
                        type: 'error',
                        hide: true,
                        styling: 'bootstrap3',
                        sticker: true,
                        delay:1500
                    });
                }
                $('#quanlykithi').DataTable().ajax.reload(null,false);
                
            }
        });
    });
});