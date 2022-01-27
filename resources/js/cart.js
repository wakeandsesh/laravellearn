// Add products to cart
$("body").on('click', '.add-cart', function(e){
    e.preventDefault();
    $('.spinner-bg').show();

    var dataId = $(this).attr('data-id');
    var quantity = $('.product_value').html();

    $.post({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url    : "/cart-add",
        data   : {product_id: dataId, quantity: quantity},
        success: function (data) {
            $('.cart__cards').load(location.href + ' .cart__cards');
            $('.cart__ico__value h5').html(data['total_quantity']);
            $('.cart_value h5').html(data['total_quantity']);
            $('.cart__totalprice span').html(data['total_price']);
            // $('.cart__ico__value').load("/ .cart__ico__value>*","");
            // $('.cart_value').load("/ .cart_value>*","");
            // $('.cart__totalprice').load("/ .cart__totalprice>*","");
            $('.product_value').html(1);
            $('.spinner-bg').hide();
            Swal.fire({
                timer: 1500,
                title: 'Товар добавлен!',
                icon: 'success',
                showConfirmButton: false,
            });

        }
    })
});

// Remove products from cart
$('#cartBody').on('click', '#btn-cart-remove', function (e) {
    e.preventDefault();
    $('.spinner-bg').show();

    var dataId = $(this).attr('data-id');

    $.post({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url    : "/cart-remove",
        data   : {product_id: dataId},
        success: function (data) {
            $('.cart__cards').load(location.href + ' .cart__cards');
            $('.cart__ico__value h5').html(data['total_quantity']);
            $('.cart_value h5').html(data['total_quantity']);
            $('.cart__totalprice span').html(data['total_price']);
            $('.spinner-bg').hide();
            Swal.fire({
                timer: 1500,
                title: 'Товар был удалён из корзины!',
                icon: 'warning',
                showConfirmButton: false,
            });
        }
    })
});

// Quantity of product
$("#cartBody").on('click', '.quantity-btn', function(e){
    e.preventDefault();
    $('.spinner-bg').show();

    var dataContent = $(this).attr('data-content');
    var dataAction = $(this).attr('data-action');

    $.post({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url    : "/cart-update",
        data   : {product_id: dataContent, cart_action: dataAction},
        success: function (data) {
            $('.cart__cards').load(location.href + ' .cart__cards');
            $('.cart__ico__value h5').html(data['total_quantity']);
            $('.cart_value h5').html(data['total_quantity']);
            $('.cart__totalprice span').html(data['total_price']);
            $('.spinner-bg').hide();
            //$('.cart__button_wrapper').load("/ .cart__button_wrapper>*","");
        }
    })
});

/*Cart button*/
$('#payment_cash').prop('checked', true);
$('.cart__button').html('Оформить заказ');
$('#payment_form').val( $('#payment_cash').val() );

$('#payment_card').click(function () {
    $('.cart__button').html('Оплатить');
    $('#payment_form').val( $('#payment_card').val() );
});
$('#payment_cash').click(function () {
    $('.cart__button').html('Оформить заказ');
    $('#payment_form').val( $('#payment_cash').val() );
});


// Order
$("#cartBody").on('click', '#formCheckoutBtn', function(e){
    e.preventDefault();
    $('.spinner-bg').show();

    var data = $(".cart__form").serialize();

    $.post({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url    : "/cart-order",
        type: 'POST',
        data: data,

        success: function(msg){
            if(msg == 'error') {
                $('.spinner-bg').hide();
                Swal.fire({
                    timer: 2500,
                    title: 'Ошибка',
                    html: 'заполните обязательные поля со звездочкой <span class="text-danger">*</span>',
                    icon: 'error',
                    showConfirmButton: false,
                });
            } else if(msg == 'error_body') {
                $('.spinner-bg').hide();
                Swal.fire({
                    timer: 2500,
                    title: 'Ошибка',
                    html: 'Корзина пуста',
                    icon: 'error',
                    showConfirmButton: false,
                });
            }
            else {
                $('.cart__cards').load(location.href + ' .cart__cards');
                $('.cart__ico__value h5').html(0);
                $('.cart_value h5').html(0);
                $('.cart__totalprice span').html(0);
                $('form.cart__form')[0].reset();
                $('.spinner-bg').hide();
                Swal.fire({
                    timer: 1500,
                    title: "Заказ успешно отправлен!",
                    icon: 'success',
                    showConfirmButton: false,
                });
            }
        }
    })
});
