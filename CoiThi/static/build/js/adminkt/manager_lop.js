$(document).ready(function(){
    var table_class = $('#list_class').DataTable({
        "ajax": {
            "type": "GET",
            "url": "/adminkt/manage_lop_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 50,
    });

    var table_teacher = $('#list_teacher').DataTable({
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 10,
    });

    // $("#detail_teacher").on('show.bs.modal', function(event){
    //     var button = $(event.relatedTarget);
    //     var title = button.data('title');
    //     $("#detail_teacher_title").text("Chi tiết lớp "+title);
    //     table_teacher.ajax.url("/adminsc/manage_teacher/data_" + title).load();
    // });

    var table_student = $('#list_student').DataTable({
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 10,
    });

    $("#detail_student").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#detail_student_title").text("Chi tiết lớp "+title);
        table_student.ajax.url("/adminkt/manage_student/data_" + title).load();
    });

    $("#list_class").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    table_class.ajax.reload(null,false);
                }
           });
        }
    });
    $("#detail_student").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:'/adminkt/manage_add_student/',
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    table_student.ajax.reload(null,false);
                    table_class.ajax.reload(null,false);
                }
           });
        }
    });
    $("#new_class").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        $("#new_class  input[name=kieu]").val(title);
        if (title === 'edit'){
            var id = button.attr('id').split('_')[1];
            $("#new_class input[name=id]").val(id);
            var ten = $("#ten_"+id).text();
            $("#new_class input[name=ten]").val(ten);
            var khoa = $("#khoa_"+id).text();
            $("#new_class input[name=khoa]").val(khoa);
            var mon = $("#mon_"+id).text();
            $("#new_class input[name=mon]").val(mon);
            $('#change_class_title').html("Chỉnh sửa lớp")
            $("#save_new_class").html("Chỉnh sửa");
        }else{
            $("#new_class input[name=id]").val(0);
            $('#change_class_title').html("Tạo mới lớp")
            $("#new_class input[name=ten]").val("");
            $("#new_class input[name=khoa]").val("");
            $("#new_class input[name=mon]").val("");
            $("#save_new_class").html("Tạo mới");
        }
    });

    $('#save_new_class').click( function(){
        var kieu = $("#new_class  input[name=kieu]").val();
        var token = $("#new_class input[name=csrfmiddlewaretoken]").val();
        var ten = $("#new_class input[name=ten]").val();
        var id = $("#new_class input[name=id]").val();
        khoa = '';
        $("#ls option").each(function(){
            if($("#new_class input[name=khoa]").val() == $(this).val()){
                khoa = $(this).data("khoa");
                return false;
            }
        });
        if(khoa == ''){
            alert("Khóa hệ - Hệ  không chính xác");
            return false;
        }
        var mon = '';
        $("#lssa option").each(function(){
            if($("#new_class input[name=mon]").val() == $(this).val()){
                 mon = $(this).data("mon");
                return false;
            }
        });
        if(mon == ''){
            alert("Môn không chính xác");
            return false;
        }
        $.ajax({
            type:'POST',
            url:location.href,
            data: {'csrfmiddlewaretoken':token, 'kieu':kieu, 'ten': ten, 'id':id , 'khoa':khoa, 'mon':mon},
            success: function(){
                $("#new_class").modal("hide");
                alert('tao thành công');
                table_class.ajax.reload(null,false);
                
            }
        });
    });
    $('#save_add_sv').click( function(){
        var kieu = 'new';
        var token = $("#add_student input[name=csrfmiddlewaretoken]").val();
        lop = '';
        $("#lsl option").each(function(){
            if($("#add_student input[name=tenlop]").val() == $(this).val()){
                lop = $(this).data("lop");
                return false;
            }
        });
        if(lop == ''){
            alert("Lớp không chính xác");
            return false;
        }
        var sinhvien = '';
        $("#lsa option").each(function(){
            if($("#add_student input[name=masv]").val() == $(this).val()){
                sinhvien = $(this).data("sv");
                return false;
            }
        });
        if(sinhvien == ''){
            alert("Sinh viên không chính xác");
            return false;
        }
        $.ajax({
            type:'POST',
            url:'/adminkt/manage_add_student/',
            data: {'csrfmiddlewaretoken':token,'kieu':kieu, 'lop':lop, 'sinhvien':sinhvien},
            success: function(){
                $("#add_student").modal("hide");
                // alert('Thêm sinh viên thành công');
                table_class.ajax.reload(null,false);
                
            }
        });
    });
//     var input_dom_element = document.getElementById("file");
//     var result;

//     function handle_fr(e) {
//         result = [];
//         var files = e.target.files, f = files[0];
//         var reader = new FileReader();
//         var rABS = !!reader.readAsBinaryString;
//         reader.onload = function(e) {
//             var data = e.target.result;
//             if(!rABS) data = new Uint8Array(data);

//             var wb = XLSX.read(data, {type: rABS ? 'binary' : 'array'});
//             var ws = wb.Sheets[wb.SheetNames[0]];
//             result = XLSX.utils.sheet_to_json(ws, {header:1});
// //            wb.SheetNames.forEach(function(sheetName) {
// //                var roa = XLSX.utils.sheet_to_json(wb.Sheets[sheetName], {header:1});
// //                if(roa.length) result[sheetName] = roa;
// //            });

//         };
//         if(rABS) reader.readAsBinaryString(f); else reader.readAsArrayBuffer(f);
//     }
//     var handler = handle_fr;
//     if(input_dom_element.attachEvent) input_dom_element.attachEvent('onchange', handler);
//     else input_dom_element.addEventListener('change', handler, false);

//     $('#create_new_class_multi').click(function(){
//         var token = $("input[name=csrfmiddlewaretoken]").val();
//         if (typeof result != 'undefined' ){
//             $.ajax({
//                 type:'POST',
//                 url:location.href,
//                 data: {'csrfmiddlewaretoken':token, 'list_class':JSON.stringify(result)},
//                 success: function(){
//                     table_class.ajax.reload(null,false);
//                     $("#new_class_multi").modal("hide");
//                 }
//            });
//         }
//     });


});