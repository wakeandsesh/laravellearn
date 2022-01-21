<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Категории</title>
    <link href="{{ asset('/css/app.css') }}" rel="stylesheet">
</head>
<body>
    <section class="categories">
        <div class="category__card">
            <div class="category__name">Бургеры</div>
            <img src="{{ asset('/img/category-burger.png') }}" alt="" class="category__img">
        </div>
        <div class="category__card">
            <div class="category__name">Хотдоги</div>
            <img src="{{ asset('/img/category-hotdog.png') }}" alt="" class="category__img">
        </div>
        <div class="category__card">
            <div class="category__name">Кофе / чай</div>
            <img src="{{ asset('/img/category-coffee.png') }}" alt="" class="category__img">
        </div>
        <div class="category__card">
            <div class="category__name">Десерты</div>
            <img src="{{ asset('/img/category-sweets.png') }}" alt="" class="category__img">
        </div>
    </section>
</body>
</html>