$(".cart__toggle" ).on('click touchstart', function(e) {
    // prevent default anchor click
    e.preventDefault();
    $(".cart-block").addClass("cart__open");
});

$(document).on('click', function(e) {
    $(".cart-block").removeClass("cart__open");
});
