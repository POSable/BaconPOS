$(document).ready(function(){

  var invoice = (function(){
    return {
      addProduct: addProduct,
      updateInvoice: updateInvoice,
    }

  function addProduct() {
    $('.btn-custom').on('click', function(){

      var price = $(this).parent().prev().children('#price').html();
      var item = $(this).parent().parent().prev().prev().prev().children('#name').html();

      if ($('#item').length == 0) {
        var delete_button = '<div class="col-md-1"><span class="glyphicon glyphicon-remove"></span></div>';
        var add_item = '<div class="col-md-7 item_name">' + item + '</div>';
        var add_quantity = '<div class="col-md-2 item_qty">' + 1 + '</div>';
        var add_price = '<div class="col-md-2 item_price">' + price + '</div>';

        $('.line_items').after('<div class="row text-center" id="item">' + delete_button + add_item + add_quantity + add_price + '</div><hr>');
      } else {
          if (item == $('#item .item_name').html()) {
            var oldQty = $('#item .qty').html();
            var newQty = parseInt(oldQty) + 1;
            $('.qty').html(newQty);
          } else {
            var delete_button = '<div class="col-md-1"><span class="glyphicon glyphicon-remove"></span></div>';
            var add_item = '<div class="col-md-7 item_name">' + item + '</div>';
            var add_quantity = '<div class="col-md-2 qty">' + 1 + '</div>';
            var add_price = '<div class="col-md-2 price">' + price + '</div>';

            $('.line_items').after('<div class="row text-center" id="item">' + delete_button + add_item + add_quantity + add_price + '</div><hr>');
        }

      }

      })

  }

  function updateInvoice() {
    $('.btn-custom').on('click', function(){
      var itemCount = 0;
      $('#item').each(function(){
        var count = $('.qty').html();

      })
    })
  }

})();

  invoice.addProduct();
  invoice.updateInvoice();

})
