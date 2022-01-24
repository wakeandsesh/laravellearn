<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="content__wrapper">
        <aside class="sidebar">
            <div class="main__logo">
                <a href="{{ route('categories.index') }}">
                    <img src="{{ asset('/img/main-logo.png') }}" alt="">
                </a>

                </div>

                <div class="sidebar__categories">
                    <a href="{{ route('categories.index') }}" class="sidebar__category__link">Все категории</a>
                    @foreach($categories as $category)
                        <a href="{{ route('categories.show', $category->slug) }}" class="sidebar__category__link">{{ $category->title }}</a>
                    @endforeach
                </div>

                <div class="sidebar__name">
                    <h2>VIKI GRILL</h2>
                    <h3>Burgers and Coffe</h3>
                </div>

                <a href="/aboutus" class="sidebar__aboutus">О нас</a>

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
                    <a href="#" class="cart__toggle d-flex text-decoration-none">
                        <div class="cart__text">
                            Корзина
                        </div>
                        <div class="cart__img">
                            <img src="{{ asset('/img/cart-ico.png') }}" alt="">
                        </div>
                    </a>
                </div>
            </header>

            <div class="main__body">
                {{ $slot }}
            </div>
        </div>

        <x-cart />
    </div>

    {{-- Jquery --}}
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
