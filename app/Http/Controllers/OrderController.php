<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Notification;
use App\Mail\MailClass;
use App\Models\Order;
use App\Notifications\Telegram;
use Illuminate\Http\Request;
use Cart;

class OrderController extends Controller
{
    public function cartOrder(Request $request)
    {
        if (Cart::getContent()->count() === 0) {
            return response()->json(['error_body']);
        }
        if ($request->payment == 'payment_card') {
            $payment = 'Оплата на карту';
            $paid = 'Оплачено';
        } elseif ($request->payment == 'payment_cash') {
            $payment = 'Оплата наличными';
            $paid = 'Не оплачено';
        }

        $data = array(
            'name'=>$request->name,
            'phone'=>$request->phone,
            'payment'=>$payment,
            'paid'=>$paid,
        );

        $validator = \Validator::make($request->all(), [
            'name'  => 'required|min:2|max:255',
            'phone' => 'required|min:17',
        ]);

        $order = new Order();
        $order->name = $request->name;
        $order->phone = $request->phone;
        $order->payment_method = $payment;
        $order->paid = $paid;
        $order->total_price = Cart::getTotal();
        $order->body = Cart::getContent();


        if ($validator->passes()) {

            $order->save();

            \Mail::to('vikiGrill@gmail.com')->send(new MailClass($data));
            Notification::send($request, new Telegram($order));

            Cart::clear();

            return response()->json(['success']);
        }

        return response()->json(['error']);

    }
}
