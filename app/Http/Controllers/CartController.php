<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

use Cart;

class CartController extends Controller
{
    public function addToCart(Request $request) {
        $product = Product::find($request->product_id);
        Cart::add(array(
            array(
                'id' => $product->id,
                'name' => $product->title,
                'price' => $product->price,
                'quantity' => $request->quantity ? $request->quantity : '1',
                'attributes' => array('image' => $product->image)
            )
        ));
        $data = [
          'total_price' => number_format(Cart::getTotal(),2),
          'total_quantity' => Cart::getTotalQuantity()
        ];
        return $data;
    }

    public function removeFromCart(Request $request) {
        Cart::remove($request->product_id);
        $data = [
            'total_price' => number_format(Cart::getTotal(),2),
            'total_quantity' => Cart::getTotalQuantity()
        ];
        return $data;
    }

    public function cartUpdate(Request $request) {
        $product = Product::find($request->product_id);

        if ($request->cart_action == 'increase') {

            Cart::update($product->id, array('quantity' => 1));
            if($request->ajax()){
                $cart_products = Cart::getContent()->sortByDesc('id');
                $data = [
                    'total_price' => number_format(Cart::getTotal(),2),
                    'total_quantity' => Cart::getTotalQuantity()
                ];
                return response()->view('components.cart', compact('data','cart_products'));
            }
        } elseif ($request->cart_action == 'decrease') {
            Cart::update($product->id, array('quantity' => -1));
            if($request->ajax()){
                $cart_products = Cart::getContent()->sortByDesc('id');
                return response()->view('components.cart', compact('cart_products'));
            }
        }
    }
}
