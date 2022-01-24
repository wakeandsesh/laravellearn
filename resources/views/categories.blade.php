<x-app>
    <section class="categories">
        @foreach($categories as $category)
            <div class="category__card">
                <a href="{{ route('categories.show', $category->slug) }}">
                    <div class="category__name">{{ $category->title }}</div>
                    <img src="{{ Voyager::image( $category->thumbnail('cropped', 'image_desc') ) }}" alt="{{ $category->title }}" class="category__img">
                </a>
            </div>
        @endforeach
        {{--<div class="category__card">
            <a href="">
                <div class="category__name">Бургеры</div>
                <img src="{{ asset('/img/category-burger.png') }}" alt="" class="category__img">
            </a>
        </div>
        <div class="category__card">
            <a href="">
                <div class="category__name">Хотдоги</div>
                <img src="{{ asset('/img/category-hotdog.png') }}" alt="" class="category__img">
            </a>

        </div>
        <div class="category__card">
            <a href="">
                <div class="category__name">Кофе / чай</div>
                <img src="{{ asset('/img/category-coffee.png') }}" alt="" class="category__img">
            </a>

        </div>
        <div class="category__card">
            <a href="">
                <div class="category__name">Десерты</div>
                <img src="{{ asset('/img/category-sweets.png') }}" alt="" class="category__img">
            </a>

        </div>--}}
    </section>
</x-app>
