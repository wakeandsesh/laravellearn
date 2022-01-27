<div class="cart-background" id="cartBody">
    <section class="cart-block">
        <button class="cart__close__button" type="button">X</button>
        <div class="cart__inner">
            <div class="cart__header">
                <div class="cart__title">Корзина</div>
                <div class="cart__img">
                    <img src="{{ asset('/img/cart-ico.png') }}" alt="">
                    <div class="cart__ico__value"><h5>{{ Cart::getTotalQuantity() }}</h5></div>
                </div>
            </div>

            <form class="cart__form" method="POST" action="#">
                <input type="text" name="name" placeholder="Имя" autocomplete="off">
                <input type="text" name="phone" id="phone" placeholder="Телефон" autocomplete="off">
                <div class="input__require">
                    * это поле обязательно
                </div>
                <input name="payment" value="" id="payment_form" type="text" style="display: none">
            </form>

            <div class="cart__cards">
                @if($cart_products->count() > 0)
                    @foreach($cart_products as $cart_product)
                        <div class="cart__card">
                            <div class="cart__card__img">
                                <img src="{{ Voyager::image($cart_product->attributes->image) }}"
                                     alt="{{ $cart_product->name }}">
                            </div>
                            <div class="cart__card__info">
                                <div class="cart__card__name">{{ $cart_product->name }}</div>
                                <div class="product__cost">
                                    <span>{{ number_format($cart_product->price,2) }} грн.</span>
                                </div>
                                <div class="cart__card__footer">
                                    <div class="product__value">
                                        <a class="product__value__minus quantity-btn" data-action="decrease"
                                           data-content="{{ $cart_product->id }}">–</a>
                                        <div class="product__value__number">{{ $cart_product->quantity }}</div>
                                        <a class="product__value__plus quantity-btn" data-action="increase"
                                           data-content="{{ $cart_product->id }}">+</a>
                                    </div>
                                    <a href="#" data-id="{{ $cart_product->id }}" class="cart__card__trash"
                                       id="btn-cart-remove">
                                        <img src="{{ asset('/img/trash-ico.png') }}" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <h2 class="my-5">Корзина пуста &#128549;</h2>
                @endif
            </div>

            <div class="cart__paymethod">
                <span>Выберите метод оплаты</span>
                <div class="cart__paymethod__choose">
                    <div class="cart__paymethod__bank">
                        <label>
                            <input name="payment" value="payment_card" id="payment_card" type="radio">
                            <span>Картой</span>
                        </label>
                    </div>
                    <div class="cart__paymethod__cash">
                        <label>
                            <input name="payment" value="payment_cash" id="payment_cash" type="radio">
                            <span>Наличными</span>
                        </label>
                    </div>
                </div>
            </div>

            <div class="cart__totalprice">
                <h4>Всего: <span class="get_total">{{ number_format(Cart::getTotal(), 2) }}</span> грн.</h4>
            </div>

            <div class="cart__button_wrapper">
                <button class="cart__button" id="formCheckoutBtn"></button>
            </div>

        </div>

    </section>
</div>

