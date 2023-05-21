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
        $username = $data['username'];
        $email = $data['email'];
        $password = $data['password'];
        
        $sql = "INSERT INTO `users` (name,email,password) VALUES ('{$username}','{$email}','{$password}')";
        $result = mysqli_query($con,$sql);
        

        if(!$result){
            http_response_code(400);
            echo json_encode(array('message'=>'Bad request','status'=>400));
        }
        else{
            http_response_code(200);
            echo json_encode(array('message'=>'success','status'=>200));
        }
    }
?>