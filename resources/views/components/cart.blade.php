<div class="cart-background">
    <section class="cart-block">
        <div class="cart__inner">
            <div class="cart__header">
                <div class="cart__title">Корзина</div>
                <div class="cart__img">
                    <img src="{{ asset('/img/cart-ico.png') }}" alt="">
                    <div class="cart__ico__value">2</div>
                </div>
            </div>

            <form class="cart__form" action="#">
                <input type="name" placeholder="Имя" >
                <input type="text" placeholder="Телефон">
                <div class="input__require">
                    * это поле обязательно
                </div>
            </form>

            <div class="cart__card">
                <div class="cart__card__img">
                    <img src="{{ asset('/img/cart-card-img.png') }}" alt="">
                </div>
                <div class="cart__card__info">
                    <div class="cart__card__name">Бургер название</div>
                    <div class="product__cost">
                        <span>55.00гр.</span>
                    </div>
                    <div class="cart__card__footer">
                        <div class="product__value">
                            <div class="product__value__minus">–</div>
                            <div class="product__value__number">2</div>
                            <div class="product__value__plus">+</div>
                        </div>
                        <div class="cart__card__trash">
                            <img src="{{ asset('/img/trash-ico.png') }}" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="cart__card">
                <div class="cart__card__img">
                    <img src="{{ asset('/img/cart-card-img.png') }}" alt="">
                </div>
                <div class="cart__card__info">
                    <div class="cart__card__name">Бургер название</div>
                    <div class="product__cost">
                        <span>55.00гр.</span>
                    </div>
                    <div class="cart__card__footer">
                        <div class="product__value">
                            <div class="product__value__minus">–</div>
                            <div class="product__value__number">2</div>
                            <div class="product__value__plus">+</div>
                        </div>
                        <div class="cart__card__trash">
                            <img src="{{ asset('/img/trash-ico.png') }}" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="cart__paymethod">
                <span>Выберите метод оплаты</span>
                <div class="cart__paymethod__choose">
                    <div class="cart__paymethod__bank">
                        <label>
                            <input name="payment" type="radio">
                            <span>Картой</span>
                        </label>
                    </div>
                    <div class="cart__paymethod__cash">
                        <label>
                            <input name="payment" type="radio">
                            <span>Наличными</span>
                        </label>
                    </div>
                </div>
            </div>

            <div class="cart__totalprice">
                Всего: <span>220 грн.</span>
            </div>

            <button class="cart__button">
                Оплатить
            </button>
        </div>
    </section>
</div>

