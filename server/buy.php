<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Content-Type');

    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "web_tech";

    $con = mysqli_connect($servername,$username,$password,$database);
    
    if(!$con){
        die("Failed to connect".mysqli_connect_error());
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        $inputData = file_get_contents('php://input');
        $data = json_decode($inputData, true);
        $userId = $data['userId'];
        $products = $data['products'];
        $total = $data['total'];

        $sql = "INSERT INTO `orders1` (total) VALUES ('{$total}')";
        $result = mysqli_query($con,$sql);
        $orderId = mysqli_insert_id($con);

        foreach($products as $product){
            $pid = $product['pid'];
            $quantity = $product['quantity'];    
            $sql = "INSERT INTO `orders2` (orderId, pid, quantity) VALUES ('$orderId', '$pid', '$quantity')";
            $result = mysqli_query($con,$sql);
            if(!$result){
                echo json_encode(array('message'=>'internal server error','status'=>500));
                die();
            }
        }
        echo json_encode(array('message'=>'success','status'=>200));
    }
?>