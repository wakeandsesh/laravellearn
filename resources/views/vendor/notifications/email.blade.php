@component('mail::layout')
{{-- Header --}}
@slot('header')
@component('mail::header', ['url' => config('app.url')])
{{ config('app.name') }}
@endcomponent
@endslot

{{-- Body --}}

@component('mail::table')
|  |  |
| ----- | :-------------- |
| ФИО | {{ $data["name"] }} |
| Тел. | {{ $data["phone"] }} |
| Способ оплаты. | {{ $data["payment"] }} |
| Статус оплаты. | {{ $data["paid"] }} |
@endcomponent

@component('mail::table')
| | Название  | Кол-во | Цена | Всего |
| :---: | ------------- | :----: | :----: | :----: |
@foreach($cart_products as $product)
| <img src="{{ Voyager::image($product->attributes->image) }}" alt="" width="40" /> | {{ $product->name }} | {{ $product->quantity }} |  &#8372; {{ $product->price }} | &#8372; {{ $product->getPriceSum() }} |
@endforeach
@endcomponent

@component('mail::panel')
Полная сумма заказа: &#8372; {{ Cart::getTotal() }}
@endcomponent

{{-- Footer --}}
@slot('footer')
@component('mail::footer')
© {{ date('Y') }} VikiGrill
@endcomponent
@endslot
@endcomponent
