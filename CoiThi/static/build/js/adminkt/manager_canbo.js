$(document).ready(function(){
    // setTimeout(function(){$(".easy-autocomplete.eac-square").css("width","100%");},500);
    var table_teacher = $('#list_canbo').DataTable({
        "ajax": {
            "type": "GET",
            "url": "/adminkt/manage_can_bo_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "displayLength": 10,
    });

    $("#new_teacher").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);
        var title = button.data('title');
        if (title === 'edit'){
            $('#teacher_title').html("Chỉnh sửa cán bộ")
            var gvid = button.attr('id').split('_')[1];

            var fullname = $("#full_"+gvid).text();
            $("#new_teacher input[name=fullname]").val(fullname);
            var donvi = $("#donvi_"+gvid).text();
            $("#new_teacher input[name=donvi]").val(donvi);
            var quanham = $("#quanham_"+gvid).text();
            $("#new_teacher input[name=quanham]").val(quanham);
            var macb = $("#macb_"+gvid).text();
            $("#new_teacher input[name=ma]").val(macb);
            var username = $("#user_"+gvid).text();
            $("#new_teacher input[name=username]").val(username);
            $("#new_teacher input[name=username]").prop("readonly", true);

            var email = $("#email_"+gvid).text();
            $("#new_teacher input[name=email]").val(email);

            $(".passwd").each(function() {
                $(this).hide();
            });

            $("#new_teacher input[name=kieu]").val("edit");
            $("#create_new_teacher").html("Chỉnh sửa");

        }else{
            $('#teacher_title').html("Thêm mới giáo viên")
            $("#new_teacher input[name=gvid]").val(0);
            $("#new_teacher input[name=fullname]").val("");
            $("#new_teacher input[name=macanbo]").val("");
            $("#new_teacher input[name=quanham]").val("");
            $("#new_teacher input[name=donvi]").val("");
            $("#new_teacher input[name=username]").val("");
            $("#new_teacher input[name=password]").val("");
            $("#new_teacher input[name=password2]").val("");
            $("#new_teacher input[name=email]").val("");
            $("#new_teacher input[name=username]").prop("readonly", false);

            $(".passwd").each(function() {
                $(this).show();
            });

            $("#new_teacher  input[name=kieu]").val("new");
            $("#create_new_teacher").html("Thêm mới");
        }
    });

    $('#create_new_teacher').click( function(){
        var kieu = $("#new_teacher  input[name=kieu]").val();
        var token = $("#new_teacher input[name=csrfmiddlewaretoken]").val();
        var fullname = $("#new_teacher input[name=fullname]").val();
        var macanbo= $("#new_teacher input[name=macanbo]").val();
        var quanham = $("#new_teacher input[name=quanham]").val();
        var donvi= '';
        $("#ls option").each(function(){
            if($("#new_teacher input[name=donvi]").val() == $(this).val()){
                donvi = $(this).data("donvi");
                return false;
            }
        });
        if(donvi == ''){
            alert("Đơn vị không chính xác");
            return false;
        }
        var username = $("#new_teacher input[name=username]").val();
        var email = $("#new_teacher input[name=email]").val();
        var password = $("#new_teacher input[name=password]").val();
        var password2 = $("#new_teacher input[name=password2]").val();
        if(password === password2){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'csrfmiddlewaretoken':token, 'kieu':kieu, 'fullname': fullname, 'macanbo': macanbo,
                'donvi':donvi ,'quanham':quanham,'username': username,
                'email': email, 'password': password},
                success: function(){
                    $("#new_teacher").modal("hide");
                    $('#list_canbo').DataTable().ajax.reload(null,false);
                }
            });
        }
    });

    var options_mon = {
        url: "mon_data",

        getValue: function(element){
            return element.ten+" - "+element.lop;
         },

        list: {
            match: {
                enabled: true
            },
            onChooseEvent: function() {
                var ten = $("#search_mon").getSelectedItemData().ten;
                var lop = $("#search_mon").getSelectedItemData().lop;
                var element = '<div><input type="checkbox" style="transform: scale(1.3)" class="check_mon" name="'+ten+" - "+lop+'" value="'+ten+" - "+lop+'" checked > '+ten+" - "+lop+'</div>';
                var list_old = $("#list_mon").text();
                if (list_old.includes(ten+" - "+lop) == false){
                    $('#list_mon').append(element);
                }
                $("#search_mon").val("");
            }
        },
        theme: "square"
    };
    // $("#search_mon").easyAutocomplete(options_mon);

    $('body #list_mon').on('change', '.check_mon', function() {
        $(this).parent().remove();
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
            onChooseEvent: function() {
                var ten = $("#search_lop").getSelectedItemData().ten;
                var element = '<div><input type="checkbox" style="transform: scale(1.3)" class="check_lop" name="'+ten+'" value="'+ten+'" checked > '+ten+'</div>';
                var list_old = $("#list_lop").text();
                if (list_old.includes(ten) == false){
                    $('#list_lop').append(element);
                }
                $("#search_lop").val("");
            }
        },
        theme: "square"
    };
    // $("#search_lop").easyAutocomplete(options_lop);

    $('body #list_lop').on('change', '.check_lop', function() {
        $(this).parent().remove();
    });

    $("#list_canbo").on('click', '.btn-danger', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'delete':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    $('#list_canbo').DataTable().ajax.reload(null,false);
                }
           });
        }
    });

    $("#list_canbo").on('click', '.btn-warning', function(){
        var id = $(this).attr('id').split('_')[1];
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (confirm('Bạn có chắc ?')){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'block':id, 'csrfmiddlewaretoken':token},
                success: function(){
                    $('#list_canbo').DataTable().ajax.reload(null,false);
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

            var wb = XLSX.read(data, {type: rABS ? 'binary' : 'array'});
            var ws = wb.Sheets[wb.SheetNames[0]];
            result = XLSX.utils.sheet_to_json(ws, {header:1});
//            wb.SheetNames.forEach(function(sheetName) {
//                var roa = XLSX.utils.sheet_to_json(wb.Sheets[sheetName], {header:1});
//                if(roa.length) result[sheetName] = roa;
//            });

        };
        if(rABS) reader.readAsBinaryString(f); else reader.readAsArrayBuffer(f);
    }
    var handler = handle_fr;
    if(input_dom_element.attachEvent) input_dom_element.attachEvent('onchange', handler);
    else input_dom_element.addEventListener('change', handler, false);

    $('#create_new_teacher_multi').click(function(){
        var token = $("input[name=csrfmiddlewaretoken]").val();
        if (typeof result != 'undefined' ){
            $.ajax({
                type:'POST',
                url:location.href,
                data: {'csrfmiddlewaretoken':token, 'list_canbo':JSON.stringify(result)},
                success: function(){
                    $("#new_teacher_multi").modal("hide");
                    $('#list_canbo').DataTable().ajax.reload(null,false);
                }
           });
        }
    });

});