<x-app>
    <x-slot name="category_image">
        <img class="category_image" src="{{ Voyager::image( $category->image_desc ) }}" alt="">
    </x-slot>

    <section class="products">
        <div class="categories__mobile">
            <h1 class="categories_title">Категории меню</h1>
            <div class="categories_mob">
                @foreach($categories as $cat)
                    <a href="{{ route('categories.show', $cat->slug) }}">
                        <img class="categories__mobile__img {{ $cat->slug == $category->slug ? 'active' : ''  }}" src="{{ Voyager::image( $cat->thumbnail('cropped', 'image_mob') ) }}" alt="{{ $cat->title }}">
                        <p>{{ $cat->title }}</p>
                    </a>
                @endforeach
            </div>

        </div>

        <div class="products__title">
            {{ $category->title }}
        </div>
        @if($products->count() > 0)
            <div class="products__inner">

                @foreach($products as $product)
                    <div class="products__card">
                        <a href="{{ route('product.show', $product->slug) }}">
                            <img class="products__img" src="{{ Voyager::image( $product->thumbnail('cropped') ) }}"
                                 alt="{{ $product->title }}">
                            <div class="products__name">{{ $product->title }}</div>
                        </a>
                        <div class="products__card__footer">
                            <div class="products__price">{{ number_format($product->price, 2) }} гр.</div>
                            <a data-id="{{ $product->id }}" class="add-cart add__cart__button" href="#">
                                <img class="products__cart" src="{{ asset('/img/product-cart.png') }}" alt="">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        @else
            <h1 class="text-center">Товаров в категории <strong>"{{ $category->title }}"</strong> не найдено &#128542;</h1>
            <a class="see__another__categories" href="{{ route('categories.show', 'burgery') }}">посмотреть другие категории</a>
        @endif

    </section>
</x-app>
