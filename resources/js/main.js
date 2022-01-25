$(".cart__toggle").on('click touchstart', function (e) {
    // prevent default anchor click
    if (!$(".cart-block").hasClass('cart__open')) {
        e.preventDefault();
        $(".cart-block").addClass("cart__open");
        $('.cart-bg').show();
    }
});

jQuery(function($){
    $(".cart-bg").mouseup(function (e){
        var cart = $(".cart-block");
        var cart_toggle = $(".cart-toggle");
        if (!cart.is(e.target) && cart.has(e.target).length === 0 && !cart_toggle.is(e.target) && cart_toggle.has(e.target).length === 0)
        {
            cart.removeClass("cart__open");
            $('.cart-bg').hide();
        }
    });
});
