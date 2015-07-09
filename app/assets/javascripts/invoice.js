$(document).ready(function(){

  $('.btn-custom').on('click', function(){

    var price = $(this).parent().prev().html();
    var item = $(this).parent().prev().prev().prev().html();

    var add_item = '<div class="col-md-6">' + item + '</div>';
    var add_price = '<div class="col-md-2">' + price + '</div>';
    var add_quantity = '<div class="col-md-2">' + 1 + '</div>';

    $('#line_items').after('<div class="row text-center">' + add_item + add_price + add_quantity + '</div><hr>');
  })



});
