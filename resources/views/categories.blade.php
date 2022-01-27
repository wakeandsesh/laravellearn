<x-app>
    <section class="categories">
        @foreach($categories as $category)
            <div class="category__card">
                <a href="{{ route('categories.show', $category->slug) }}">
                    <div class="category__name">{{ $category->title }}</div>
                    @if(isset($category->image_desc))
                    <img src="{{ Voyager::image( $category->thumbnail('cropped', 'image_desc') ) }}" alt="{{ $category->title }}" class="category__img">
                    @else
                        <span class="category__img">
                            <h1>{{ $category->title }}</h1>
                        </span>

                    @endif
                </a>
            </div>
        @endforeach
    </section>
</x-app>
