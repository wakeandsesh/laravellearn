$(".cart__toggle").on('click touchstart', function (e) {
    // prevent default anchor click
    if (!$(".cart-block").hasClass('cart__open')) {
        e.preventDefault();
        $(".cart-block").addClass("cart__open");
    }
});


/*$(document).on('click', function(e) {
    $(".cart-block").removeClass("cart__open");
});*/


jQuery(function($){
    $(document).mouseup(function (e){ // событие клика по веб-документу
        var cart = $(".cart-block"); // тут указываем ID элемента
        var cart_toggle = $(".cart-toggle"); // тут указываем ID элемента
        if (!cart.is(e.target) // если клик был не по нашему блоку
            && cart.has(e.target).length === 0 && !cart_toggle.is(e.target) && cart_toggle.has(e.target).length === 0) { // и не по его дочерним элементам
            cart.removeClass("cart__open"); // скрываем его
        }
    });
});



/*document.addEventListener('click', function(event) {
    var e=document.getElementById('test');
    if (!e.contains(event.target)) e.style.display='none';
});*/
