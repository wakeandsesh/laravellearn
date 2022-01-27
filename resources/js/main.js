/*Cart open/close*/
$(".cart__toggle").on('click touchstart', function (e) {
    // prevent default anchor click
        e.preventDefault();
        $(".cart-block").addClass("cart__open");
        $('.cart-bg').show();
});
jQuery(function($){
    $(".cart-bg").mouseup(function (e){
        var cart = $(".cart-block");
        var cart_toggle = $(".cart-toggle");
        if (!cart.is(e.target) && cart.has(e.target).length === 0 && !cart_toggle.is(e.target) && cart_toggle.has(e.target).length === 0)
        {
            cart.removeClass("cart__open");
            $('.burger-btn').removeClass('active');
            $('.sidebar').removeClass('sidebar-open');
            $('.cart-bg').hide();
        }
    });
});

$('.cart__close__button').click(function () {
    $(".cart-block").removeClass("cart__open");
    $('.cart-bg').hide();
});
/**/


/*Product quantity in product page*/
$('.product__quantity__btn').click(function () {
    let action = $(this).attr('data-action');
    let quantity = $('.product__value__number').html();
    if (action == 'increase') {
        let totalQuantity = Number(quantity) + 1;
        $('.product_value').html(totalQuantity);
    }
    if(action == 'decrease' && (Number(quantity) > 1)) {
        let totalQuantity = Number(quantity) - 1;
        $('.product_value').html(totalQuantity);
    }
});
/**/

/*Burger mobile menu*/
let burger = $('.burger-btn');
burger.click(function(){
    $(burger).toggleClass('active');
    $('.sidebar').toggleClass('sidebar-open');
    $('.cart-bg').toggle();
});
