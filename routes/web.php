<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('app');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/categories', function () {
    return view('categories');
});

Route::get('/products', function () {
    return view('products');
});

Route::get('/product', function () {
    return view('product');
});

Route::get('/cart', function () {
    return view('cart');
});

Route::get('/aboutus', function () {
    return view('aboutus');
});

Route::get('/mobile-start', function () {
    return view('mobile-start');
});
