<x-app>
    <section class="product">
        <div class="product__breadcrumb">
            <div class="product__breadcrumb__category">
                <a href="{{ route('categories.show', $product->category->slug) }}">
                    {{ $product->category->title }}
                </a>
            </div>
            <div class="product__breadcrumb__arrow">&#8592;</div>
            <div class="product__breadcrumb__product">{{ $product->title }}</div>
        </div>

        <div class="product__inner d-flex">
            <div class="product__img">
                <img src="{{ Voyager::image( $product->thumbnail('cropped') ) }}" alt="">
            </div>
            <div class="product__menu">
                <div class="product__name">{{ $product->title }}</div>
                <div class="product__description">
                    {!! $product->description !!}
                </div>
                <div class="product__price">
                    <div class="product__cost">
                        Цена : <span>{{ number_format($product->price, 2) }} гр.</span>
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
</x-app>
