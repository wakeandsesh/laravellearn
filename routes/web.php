<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
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

Route::get('/', [CategoryController::class, 'index'])->name('categories.index');

Route::get('/category/{category:slug}', [CategoryController::class, 'show'])->name('categories.show');

Route::get('/product/{product:slug}', [ProductController::class, 'show'])->name('product.show');

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

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
