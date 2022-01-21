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
    <div class="content__wrapper">
        <aside class="sidebar">
            <div class="main__logo">
                    <img src="{{ asset('/img/main-logo.png') }}" alt="">
                </div>
                
                <div class="sidebar__categories">
                    <a href="#" class="sidebar__category__link">Все категории</a>
                    <a href="#" class="sidebar__category__link">Бургеры</a>
                    <a href="#" class="sidebar__category__link">Хотдоги</a>
                    <a href="#" class="sidebar__category__link">Кофе / чай</a>
                    <a href="#" class="sidebar__category__link">Десерты</a>
                </div>

                <div class="sidebar__name">
                    <h2>VIKI GRILL</h2>
                    <h3>Burgers and Coffe</h3>
                </div>

                <a href="#" class="sidebar__aboutus">О нас</a>

                <div class="sidebar__contacts">
                    <div class="sidebar__adress">
                        адресс: г.Никополь, <br> ул. Название
                    </div>
                    <a class="sidebar__phone" href="tel:+380731234488">tel: +38 073 123 44 88</a>
                </div>
        </aside>

        <div class="main__content">
            <header class="header">
                <div class="cart">
                    <div class="cart__text">
                        Корзина
                    </div>
                    <div class="cart__img">
                        <img src="{{ asset('/img/cart-ico.png') }}" alt="">
                    </div>
                </div>
            </header>

            <div class="main__body">
                
            </div>
        </div>
    </div>
</body>
</html>