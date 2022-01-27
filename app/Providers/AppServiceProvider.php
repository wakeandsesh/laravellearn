<?php

namespace App\Providers;

use App\Models\Category;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\ServiceProvider;

use Cart;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer(['components.app', 'products'], function($view){
            $view->with('categories', Category::get()->toTree());
        });

        view()->composer(['components.cart', 'vendor.notifications.email'], function($view){
            $view->with('cart_products', Cart::getContent()->sortByDesc('id'));
        });
    }
}
