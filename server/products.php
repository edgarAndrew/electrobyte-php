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

    $category = $_GET['category'];

    $sql = "SELECT * FROM `products` where `category`='{$category}'";
    $result = mysqli_query($con,$sql);
    
    if(!$result)
        die("something went wrong".mysqli_error($con));
                

    $rows = array();
        while($row = mysqli_fetch_assoc($result)){
            $val1 = $row['pid'];
            $val2 = $row['pname'];
            $val3 = $row['price'];
            $val5 = $row['category'];
            $val7 = $row['image'];

            array_push($rows,
                json_encode(['pid'=>$val1,'pname'=>$val2,'price'=>$val3,'image'=>$val7]
            ));
        }

    echo json_encode($rows);

?>