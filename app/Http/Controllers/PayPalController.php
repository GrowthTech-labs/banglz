<?php

namespace App\Http\Controllers;

use Omnipay\Omnipay;
use Illuminate\Http\Request;
use App\Models\Payment;
// use App\Models\Cart;


class PayPalController extends Controller
{
    private $gateway;

    public function __construct()
    {
        $this->gateway = Omnipay::create('PayPal_Rest');
        $this->gateway->setClientId(env('PAYPAL_SANDBOX_CLIENT_ID'));
        $this->gateway->setSecret(env('PAYPAL_SANDBOX_CLIENT_SECRET'));
        $this->gateway->setTestMode(true); // Sandbox mode
    }

    /**
     * Start the payment process
     */
    public function pay(Request $request)
    {
        try {
            $response = $this->gateway->purchase([
                'amount'    => $request->amount,
                'currency'  => env('PAYPAL_CURRENCY', 'CAD'),
                'returnUrl' => route('payment.success'),
                'cancelUrl' => route('payment.error'),
            ])->send();

            if ($response->isRedirect()) {
                return $response->redirect(); // redirect to PayPal
            } else {
                return $response->getMessage();
            }
        } catch (\Throwable $th) {
            return $th->getMessage();
        }
    }

    /**
     * Payment was successful
     */
    public function success(Request $request)
    {
        if ($request->has('paymentId') && $request->has('PayerID')) {
            $transaction = $this->gateway->completePurchase([
                'payer_id'             => $request->get('PayerID'),
                'transactionReference' => $request->get('paymentId'),
            ]);

            $response = $transaction->send();

            if ($response->isSuccessful()) {
                // Payment data
                $data = $response->getData();
                $payment = Payment::create([
                    'payment_id'     => $data['id'], // PayPal transaction ID
                    'payer_id'       => $data['payer']['payer_info']['payer_id'] ?? '',
                    'payer_email'    => $data['payer']['payer_info']['email'] ?? '',
                    'amount'         => $data['transactions'][0]['amount']['total'] ?? '',
                    'currency'       => $data['transactions'][0]['amount']['currency'] ?? '',
                    'payment_status' => $data['state'] ?? '',
                ]);

                // Update order status if order_id is provided
                if ($request->has('order_id')) {
                    $order = \App\Models\Order::find($request->get('order_id'));
                    if ($order) {
                        $order->update([
                            'payment_status' => 'paid',
                            'status' => 'pending',
                        ]);

                        // Apply gift card if used
                        $appliedGiftCardMeta = json_decode($order->applied_gift_card_meta_data, true);
                        if (!empty($appliedGiftCardMeta)) {
                            foreach ($appliedGiftCardMeta as $giftCardData) {
                                if (!empty($giftCardData['code']) && !empty($giftCardData['amount'])) {
                                    $this->applyGiftCardToOrder($giftCardData['code'], $giftCardData['amount']);
                                }
                            }
                        }

                        return redirect()->route('order.confirmation', [
                            'transactionId' => $order->order_id,
                            'date' => $order->created_at->toDateString()
                        ]);
                    }
                }

                // Fallback for old flow
                $request->session()->invalidate();
                return redirect()->route('order.confirmation', [
                    'transactionId' => $payment->payment_id,
                    'date' => $payment->created_at->format('Y-m-d')
                ]);
            } else {
                return redirect('/checkout')->with('error', $response->getMessage() ?: 'Payment failed');
            }
        } else {
            return redirect('/checkout')->with('error', 'Payment failed, missing data.');
        }
    }

    /**
     * Payment was cancelled
     */
    public function error(Request $request)
    {
        // Update order status if order_id is provided
        if ($request->has('order_id')) {
            $order = \App\Models\Order::find($request->get('order_id'));
            if ($order) {
                $order->update([
                    'payment_status' => 'cancelled',
                    'status' => 'cancelled',
                ]);
            }
        }

        return redirect('/checkout')->with('error', 'Payment was cancelled.');
    }

    /**
     * Apply gift card to order
     */
    private function applyGiftCardToOrder($code, $amount)
    {
        $giftCard = \App\Models\GiftCardCodes::where('code', $code)->first();

        if (!$giftCard) {
            return false;
        }

        \App\Models\GiftCardHistory::create([
            'gift_card_id' => $giftCard->id,
            'used_amount'  => $amount,
        ]);

        $totalUsed = $giftCard->histories()->sum('used_amount');

        if ($totalUsed >= $giftCard->amount) {
            $giftCard->update(['status' => 'used']);
        }

        return true;
    }
}
