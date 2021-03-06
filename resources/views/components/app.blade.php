<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Viki Grill</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="content__wrapper">
        <aside class="sidebar">
                <div class="sidebar__header__mobile">
                    <img class="sidebar__mobile__img" src="{{ asset('img/aboutus-img.png') }}" alt="">
                    <svg class="burger-btn double-burger-btn" width="52" height="80" viewBox="0 0 40 26" xmlns="http://www.w3.org/2000/svg">
                        <rect class="burger-btn--1" width="27" height="3" rx="3" ry="3" />
                        <rect class="burger-btn--2" width="27" height="3" y="10" rx="3" ry="3" />
                        <rect class="burger-btn--3" width="27" height="3" y="20" rx="3" ry="3" />
                    </svg>
                    <div class="main__logo">
                        <a href="/">
                            <img class="sidebar__mobile__logo" src="{{ asset('/img/main-logo.png') }}" alt="">
                        </a>
                    </div>
                </div>
            <div class="sidebar__header__desctop">
                <div class="main__logo">
                    <a href="/">
                        <img src="{{ asset('/img/main-logo.png') }}" alt="">
                    </a>
                </div>
            </div>
                <div class="sidebar__categories">
                    @if(!$agent->isMobile())
                    <a href="{{ route('categories.index') }}" class="sidebar__category__link {{ Route::is('categories.index') ? 'active' : '' }}">Все категории</a>
                    @endif

                    @foreach($categories as $category)
                        <a href="{{ route('categories.show', $category->slug) }}" class="sidebar__category__link {{ request()->is("category/$category->slug") ? 'active' : '' }}">{{ $category->title }}</a>
                    @endforeach
                </div>

                <div class="sidebar__name">
                    <h2>VIKI GRILL</h2>
                    <h3>Burgers and Coffe</h3>
                </div>
                <a href="/aboutus" class="sidebar__aboutus {{ request()->is("aboutus") ? 'active' : '' }}">О нас</a>

                <div class="sidebar__contacts">
                    <a href="https://goo.gl/maps/smT7ReH72WaB3zoC9" target="_blank" class="sidebar__adress">
                        адресс: г.Никополь, <br> ул. Трубников, 91
                    </a>
                    <a class="sidebar__phone" href="tel:+380731234488">tel: +38 073 123 44 88</a>
                </div>
        </aside>

        <div class="main__content">
            <header class="header">
                    <svg class="burger-btn" width="52" height="80" viewBox="0 0 40 26" xmlns="http://www.w3.org/2000/svg">
                        <rect class="burger-btn--1" width="27" height="3" rx="3" ry="3" />
                        <rect class="burger-btn--2" width="27" height="3" y="10" rx="3" ry="3" />
                        <rect class="burger-btn--3" width="27" height="3" y="20" rx="3" ry="3" />
                    </svg>
                    <a href="/">
                        <img class="mobile-logo" src="{{ asset('/img/main-logo.png') }}" alt="">
                    </a>

                <div class="cart">
                    <a href="#" class="cart__toggle d-flex text-decoration-none">

                        <div class="cart__text">
                            Корзина
                        </div>
                        <div class="cart__img">
                            <img src="{{ asset('/img/cart-ico.png') }}" alt="">
                        </div>
                        <div class="cart_value"><h5>{{ Cart::getTotalQuantity() }}</h5></div>
                    </a>
                </div>
            </header>
            @if(isset($category_image))
                <div class="big-category-logo">
                    {{ $category_image }}
                </div>
            @endif
            <div class="main__body">
                {{ $slot }}
            </div>
        </div>

        <x-cart />
    </div>
    {{--Spiner BG--}}
    <div class="spinner-bg" style="display: none;">
        <div class="spinner-grow" role="status">
            <span class="visually-hidden"></span>
        </div>
    </div>

    {{--Cart Bg--}}
    <div class="cart-bg fixed-top w-100 h-100" style="display: none;background-color: black; opacity: 0.6;transition: 0.4s"></div>

    {{-- Jquery --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    {{--Mask input--}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js" integrity="sha512-d4KkQohk+HswGs6A1d6Gak6Bb9rMWtxjOa0IiY49Q3TeFd5xAzjWXDCBW9RS7m86FQ4RzM2BdHmdJnnKRYknxw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    {{--Sweet Alert--}}
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    {{-- App.js--}}
    <script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
