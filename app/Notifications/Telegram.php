<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramMessage;

class Telegram extends Notification
{
    use Queueable;

    protected $data;
    protected $body;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;

        foreach ($data['body'] as $product=>$value) {
            $this->body .= $value['name']. ' x ' .$value['quantity'] . 'шт.  = ' . $value['price']*$value['quantity'] . " грн. \n";
        }
    }

    public function getBody()
    {
        return $this->body;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['telegram'];
    }

    public function toTelegram($notifiable)
    {
        $url = url('/admin/orders/' . $this->data['id']);
        return TelegramMessage::create()
            ->to(env('TELEGRAM_CHAT_ID'))
            ->content("*Поступил новый заказ № {$this->data['id']}!!!*\n\nЗаказ от: *{$this->data['name']}*\nНомер телефона: *{$this->data['phone']}*\nСпособ оплаты: *{$this->data['payment_method']}*\nСтатус оплаты: *{$this->data['paid']}*\n\nДанные о заказе\n*{$this->getBody()}*\n\nОбщая цена:  *{$this->data['total_price']} грн.*")
            ->button('Посмотреть подробнее', $url);
    }

}
