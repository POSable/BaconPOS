$(document).ready(function(){

    $('.btn-item').on('click', function(){
      var allItems = [];
      var total = 0;
      var price = $(this).parent().prev().children('#price').html();
      var item = $(this).parent().parent().prev().prev().prev().children('#name').html();
      var id = $(this).parent().attr('id');
      var delete_button = '<div class="col-md-1"><button type="button" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>';
      var add_item = '<div class="col-md-7 item_name" id=' + id + '>' + item + '</div>';
      var add_quantity = '<div class="col-md-2 item_qty">' + 1 + '</div>';
      var add_price = '<div class="col-md-2 item_price">' + price + '</div>';

      $('.line_items').after('<div class="row text-center" id="item">' + delete_button + add_item + add_quantity + add_price + '</div><hr>');

      $('#invoice_list #item').each(function(){
        var itemCheck = $(this).children('.item_name').html();
        var itemQty = $(this).children('.item_qty').html();
        var newQty = parseInt(itemQty) + 1;
        var newPrice = price * newQty;

        if ($.inArray(itemCheck, allItems) > -1) {
          $('#invoice_list #item').first().next().remove();
          $('#invoice_list #item').first().remove();
          $('.item_qty', this).html(newQty);
          $('.item_price', this).html(newPrice.toFixed(2));
        } else {
          allItems.push(itemCheck);
        }
      })

      $('.btn-xs').on('click', function(){
        var trashItem = $(this).parent().parent();
        var divider = trashItem.next();
        var trashPrice = trashItem.children('.item_price').html();
        var newTotal = total - trashPrice;
        trashItem.remove();
        divider.remove();
        if ($('.item_price').length == 0) {
          var empty = 0;
          $('#total').text(empty.toFixed(2));
        } else {
          $('#total').text(newTotal.toFixed(2));
        }
      })

      $('.item_price').each(function(){
        total += parseFloat($(this).html());
      })
      $('#total').text(total.toFixed(2));

    });

    $('#pay').on('click', function(e){

      var invoiceTrans = [];

      $('#invoice_list #item').each(function(){
        var itemID = $(this).children('.item_name').attr('id');
        var quantity = $(this).children('.item_qty').html();
        invoiceTrans.push({"item_id": itemID, "item_qty": quantity});
      })
      var test = JSON.stringify(invoiceTrans)
      $.ajax({
        type: 'POST',
        url: "invoice/ajax_create",
        traditional: true,
        dataType: 'json',
        data: {"transactions": test, "customer_id": 1, "pos_id": 1},
        error: function(error){
          console.log(error);
        },
        success: function(new_invoice){
          console.log(new_invoice);
        }
      });
      e.preventDefault();
    })

    $('#add_customer').on('click', function(){
      var newCustomer = $('#new_name').val();
      $('#select').append('<option>' + newCustomer + '</option>');
      $('#new-customer').toggleClass('in');
      $('#new-customer').css('display', 'none');
      $('.modal-backdrop').hide();
    })

    $('#clear').on('click', function(){
      $('#invoice_list #item').each(function(){
        var reset = 0;
        $(this).next().remove();
        $(this).remove();
        $('#total').text(reset.toFixed(2));
      })
    })

});
