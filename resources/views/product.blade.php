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
                        <a class="product__value__minus product__quantity__btn" data-action="decrease">–</a>
                        <div class="product__value__number product_value">1</div>
                        <a class="product__value__plus product__quantity__btn" data-action="increase">+</a>
                    </div>
                </div>
                <a data-id="{{ $product->id }}" href="#" class="product__button add-cart">Добавить в корзину</a>
            </div>
        </div>
    </section>
</x-app>
