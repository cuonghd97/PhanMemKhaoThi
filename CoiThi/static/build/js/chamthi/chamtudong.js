$(document).ready(function() {
  var element = ``
  var i = 1
  $('.addcau').on('click', function() {
    element += `<tr>
      <td>${i}</td>
      <td><input type="text" class="form-control" name="" id=""></td>
    </tr>`
    $('#thanbang').html(element)
    i++
  })
})
