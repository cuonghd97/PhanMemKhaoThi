$(document).ready(function(){
    var table_student = $('#list_student').DataTable({
        "ajax": {
            "type": "GET",
            "url": "/adminkt/manage_hocvien_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },       
        },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 10,
    });

    $("#new_student").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        if (title === 'edit'){
            $('#new_student_title').html("Chỉnh sửa học sinh")
            var hsid = button.attr('id').split('_')[1];
            var fullname = $("#full_"+hsid).text();
            $("#new_student input[name=fullname]").val(fullname);

            // $('body #list_lop').empty();
            // $('body .list_lop'+hsid).each(function(){
            //     $('#new_student input[name=search_lop]').val($(this).text());
            // });
            
            $("#new_student input[name=id]").val(hsid);
            var tuoi = $("#tuoi_"+ hsid).text();
            $("#new_student input[name=tuoi]").val(tuoi);
            var masv = $("#ma_"+hsid).text();
            $("#new_student input[name=masv]").val(masv);
            $("#new_student input[name=username]").prop("readonly", true);
            var donvi = $("#donvi_"+hsid).text();
            $("#new_student input[name=donvi]").val(donvi);
            $("#new_student  input[name=kieu]").val("edit");
            $("#create_new_student").html("Chỉnh sửa");

        }else{
            $('#new_student_title').html("Thêm mới học sinh")
            $("#new_student input[name=gvid]").val(0);
            $("#new_student input[name=fullname]").val("");
            $("#new_student input[name=tuoi]").val("");
            $("#new_student input[name=masv]").val("");
            $("#new_student input[name=donvi]").val("");
            $(".passwd").each(function() {
                $(this).show();
            });

            $("#new_student  input[name=kieu]").val("new");
            $("#create_new_student").html("Thêm mới");
        }
    });

    $('#create_new_student').click( function(){
        var kieu = $("#new_student  input[name=kieu]").val();
        var id = $("#new_student  input[name=id]").val();
        var token = $("#new_student input[name=csrfmiddlewaretoken]").val();
        var fullname = $("#new_student input[name=fullname]").val();
        var ngaysinh = $("#new_student input[name=ngaysinh]").val();
        var ma= $("#new_student input[name=masv]").val();
        var donvi ='';
        $("#ls option").each(function(){
            if($("#new_student input[name=donvi]").val() == $(this).val()){
                donvi = $(this).data("donvi");
                return false;
            }
        });
        if(donvi == ''){
            alert("Đơn vị không chính xác");
            return false;
        }
        $.ajax({
                type:'POST',
                url:location.href,
                data: {'csrfmiddlewaretoken':token,'id' : id, 'kieu':kieu, 'fullname': fullname, 'ngaysinh': ngaysinh,
                'donvi': donvi, 'ma':ma},
                success: function(){
                    $("#new_student").modal("hide");
                    $('#list_student').DataTable().ajax.reload(null,false);
                }
        });
        
    });
    var options_lop = {
        url: "lop_data",

        getValue: function(element){
            return element.ten;
         },
        list: {
            match: {
                enabled: true
            },
        },
        theme: "square"
    };
    

    $("#list_student").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    $('#list_student').DataTable().ajax.reload(null,false);
                }
           });
        }
    });

    $("#list_student").on('click', '.btn-warning', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'block':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    $('#list_student').DataTable().ajax.reload(null,false);
                }
           });
        }
    });

    var input_dom_element = document.getElementById("file");
    var result;

    function handle_fr(e) {
        result = [];
        var files = e.target.files, f = files[0];
        var reader = new FileReader();
        var rABS = !!reader.readAsBinaryString;
        reader.onload = function(e) {
            var data = e.target.result;
            if(!rABS) data = new Uint8Array(data);

            var wb = XLSX.read(data, {type: rABS ? 'binary' : 'array',cellDates: true, dateNF: 'yyyy/mm/dd;@'});
            var ws = wb.Sheets[wb.SheetNames[0]];

            result = XLSX.utils.sheet_to_json(ws,{header:1});

        };
        if(rABS) reader.readAsBinaryString(f); else reader.readAsArrayBuffer(f);
    }
    var handler = handle_fr;
    if(input_dom_element.attachEvent) input_dom_element.attachEvent('onchange', handler);
    else input_dom_element.addEventListener('change', handler, false);

    $('#create_new_student_multi').click(function(){
//        console.log(typeof result);
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (typeof result != 'undefined' ){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'csrfmiddlewaretoken':token, 'list_student':JSON.stringify(result)},
                success: function(){
                    $('#list_student').DataTable().ajax.reload(null,false);
                    $("#new_student_multi").modal("hide");
                }
           });
        }
    });

});

function change() {
    var lop_hs = '';
    $("#ls option").each(function(){
        if($('#data_lop').val() == $(this).val()){
            lop_hs = $('#data_lop').val();
        }
    });
    if(lop_hs == ''){
        alert("Lớp không chính xác");
    }else{
        if(lop_hs === 'Tất cả'){
            lop_hs = 'all'
        }
        stu_data =$("#list_student").DataTable();
        stu_data.ajax.url('/adminsc/manage_student/data_'+ lop_hs).load();
    }

};
