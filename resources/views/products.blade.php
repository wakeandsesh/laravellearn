{{--<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Продукты</title>
    <link href="{{ asset('/css/app.css') }}" rel="stylesheet">
</head>
<body>--}}
<x-app>
    <section class="products">
        <div class="products__title">
            {{ $category->title }}
        </div>
        <div class="products__inner">
            {{ $products }}
            @if($category->products()->count() > 0)
                @foreach($products as $product)
                    <div class="products__card">
                        <a href="{{ route('product.show', $product->slug) }}">
                            <img class="products__img" src="{{ Voyager::image( $product->thumbnail('cropped') ) }}" alt="{{ $product->title }}">
                            <div class="products__name">{{ $product->title }}</div>
                        </a>
                        <div class="products__card__footer">
                            <div class="products__price">{{ number_format($product->price, 2) }} гр.</div>
                            <a href="">
                                <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                            </a>
                        </div>
                    </div>
                @endforeach
            @endif

            {{--<div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>
            <div class="products__card">
                <img class="products__img" src="{{ asset('/img/product-img.png') }}" alt="">
                <div class="products__name">Бургер <br> название</div>
                <div class="products__card__footer">
                    <div class="products__price">55.00гр.</div>
                    <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                </div>
            </div>--}}
        </div>
    </section>
</x-app>

{{--

</body>
</html>--}}