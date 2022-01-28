/*Toggle Cart and Sidebar*/
$(".cart__toggle").on('click', function (e) {
        e.preventDefault();
        $(".cart-block").toggleClass("cart__open");
        $('.cart-bg').toggle();
});

let burger = $('.burger-btn');
burger.click(function(){
    $(burger).toggleClass('active');
    $('.sidebar').toggleClass('sidebar-open');
    $('.cart-bg').toggle();
});

$(".cart-bg").on('click', function (e) {
    e.preventDefault();
    $(".cart-block").removeClass("cart__open");
    $('.burger-btn').removeClass('active');
    $('.sidebar').removeClass('sidebar-open');
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

