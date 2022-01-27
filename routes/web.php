<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use Jenssegers\Agent\Agent;

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
$agent = new Agent();
if ($agent->isMobile()) {
    Route::redirect('/', '/mobile-start');
} else {
    Route::redirect('/', '/categories');
}


Route::get('/categories', [CategoryController::class, 'index'])->name('categories.index');

Route::get('/category/{category:slug}', [CategoryController::class, 'show'])->name('categories.show');

Route::get('/product/{product:slug}', [ProductController::class, 'show'])->name('product.show');

Route::get('/product', function () {
    return view('product');
});

Route::get('/aboutus', function () {
    return view('aboutus');
});

Route::get('/mobile-start', function () {
    return view('mobile-start');
});

/*cart*/
Route::post('/cart-add', [CartController::class, 'addToCart'])->name('cart.add');
Route::post('/cart-remove', [CartController::class, 'removeFromCart'])->name('cart.remove');
Route::post('/cart-update', [CartController::class, 'cartUpdate'])->name('cart.update');

Route::post('/cart-order',[OrderController::class, 'cartOrder']);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
