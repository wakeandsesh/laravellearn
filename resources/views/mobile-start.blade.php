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
    <section class="mobile">
        <div class="mobile__body">
            <div class="main__logo">
                <img src="{{ asset('/img/main-logo.png') }}" alt="">
            </div>
            <h3>Проголодались ?</h3>
            @php
            $category = \App\Models\Category::query()->firstOrFail();
            @endphp
            <a href="{{ route('categories.show', $category->slug) }}" class="mobile__button">Давайте закажем поесть</a>
        </div>
    </section>
</body>
</html>
