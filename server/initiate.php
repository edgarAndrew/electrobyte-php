<?php
    require_once 'lib/razorpay-php/Razorpay.php';
    use Razorpay\Api\Api;
    $keyId = 'rzp_test_qpZKjldGnI3hJS';
    $keySecret = 'vJ4ARJumgGGCketgxUWyCRWU';

    $api = new Api($keyId, $keySecret);

    function createRazorpayOrder($total){
        global $api;
        $orderData = [
            'amount' => $total * 100, // Amount in paise (e.g., 1000 paise = ₹10)
            'currency' => 'INR',
            'receipt' => 'order_receipt',
        ];

        $order = $api->order->create($orderData);

        echo json_encode([
            'id' => $order->id,
            'amount' => $order->amount,
            'currency' => $order->currency,
        ]);
    }

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header('Access-Control-Allow-Headers: Content-Type');

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        $inputData = file_get_contents('php://input');
        $data = json_decode($inputData, true);
        $price = $data['total'];

        createRazorpayOrder($price);
    }
?>