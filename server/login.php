<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
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
        $email = $data['email'];
        $password = $data['password'];
        
        $sql = "SELECT * FROM `users` WHERE `email`='{$email}' AND `password`='{$password}'";
        $result = mysqli_query($con,$sql);
        

        if(mysqli_num_rows($result) == 0){
            http_response_code(401);
            echo json_encode(array('message'=>'Invalid credentials','status'=>401));
        }
        else{
            $row = mysqli_fetch_assoc($result);
            $_SESSION['userId'] = $row['cid'];
            http_response_code(200);
            echo json_encode(array('message'=>'success','status'=>200,'id'=>$_SESSION['userId']));
        }
    }
?>