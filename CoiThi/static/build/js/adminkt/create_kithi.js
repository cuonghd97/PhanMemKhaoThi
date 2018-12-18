$(document).ready(function() {
    $('#quanlykithi').DataTable( {
        "ajax": {
            "type": "GET",
            "url": "/adminkt/quan_ly_ki_thi/data_mon",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        
        "displayLength": 10,
    });
});