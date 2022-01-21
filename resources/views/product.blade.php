<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="{{ asset('/css/app.css') }}" rel="stylesheet">
</head>
<body>
    <section class="product">
        <div class="product__breadcrumb">
            <div class="product__breadcrumb__category">Бургеры</div>
            <div class="product__breadcrumb__arrow">&#8592;</div>
            <div class="product__breadcrumb__product">Бургер название</div>
        </div>

        <div class="product__inner">
            <div class="product__img">
                <img src="{{ asset('/img/product-big-image.png') }}" alt="">
            </div>
            <div class="product__menu">
                <div class="product__name">Бургер название</div>
                <div class="product__description">
                    Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt rähären. Ist depoprese. Antesk. Hexagök dosavis. Presamma heteroligen
                </div>
                <div class="product__price">
                    <div class="product__cost">
                        Цена : <span>55.00гр.</span>
                    </div>
                    <div class="product__value">
                        <div class="product__value__minus">–</div>
                        <div class="product__value__number">2</div>
                        <div class="product__value__plus">+</div>
                    </div>
                </div>
                <button class="product__button">Добавить в корзину</button>
            </div>
        </div>
    </section>
</body>
</html>