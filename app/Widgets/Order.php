<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;


class Order extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\Models\Order::count();
        $string = trans_choice('Заказов', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'icon voyager-wallet',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.post_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => __('Все Заказы'),
                'link' => route('voyager.orders.index'),
            ],
            'image' => '/img/admin-order.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    /*    public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', Voyager::model('Post'));
        }*/
}
