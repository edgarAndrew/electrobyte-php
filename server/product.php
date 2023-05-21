<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "web_tech";

    $con = mysqli_connect($servername,$username,$password,$database);
    
    if(!$con){
        die("Failed to connect".mysqli_connect_error());
    }

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');

    $pid = $_GET['id'];

    $sql = "SELECT * FROM `products` where `pid`='{$pid}'";
    $result = mysqli_query($con,$sql);
    
    if(!$result)
        die("something went wrong".mysqli_error($con));
                

    $rows = array();
        while($row = mysqli_fetch_assoc($result)){
            $val1 = $row['pid'];
            $val2 = $row['pname'];
            $val3 = $row['price'];
            $val4 = $row['description'];
            $val5 = $row['category'];
            $val6 = $row['brand'];
            $val7 = $row['image'];

            array_push($rows,
                json_encode(['pid'=>$val1,'pname'=>$val2,
                            'price'=>$val3,'description'=>$val4,
                            'category'=>$val5,'brand'=>$val6,
                            'image'=>$val7]
            ));
        }

    echo json_encode($rows);

?>