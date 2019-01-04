$(document).ready(function () {
  $.getJSON('/data-kythi', function (data) {
    element = ``
    $.each(data, function (key, value) {
      element += `
        <li>
          <a href="/danh-sach-phong/${value.makythi}">
            <span>${value.tenkythi}</span>
          </a>
        </li>`
        $('#dskythi').html(element)
    })

  })
})
