$(document).ready(function(){

  $('.btn-custom').on('click', function(){
    var price = $(this).parent().prev().html();
    var item = $(this).parent().prev().prev().prev().html();
    var add_item = '<td class="col-md-6">' + item + '</td>';
    var add_price = '<td class="col-md-2">' + price + '</td>';
    var add_quantity = '<td class="col-md-4">' + 1 + '</td>';

    $('.line_items').after(add_item + add_price + add_quantity);
  })






});
