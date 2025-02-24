<?php
    @header("Content-Type: application/json; charset=UTF-8");
    @header("Access-Control-Allow-Origin: *");
    @header("Access-Control-Allow-Methods: POST");

    include "config.php"; // เชื่อมต่อฐานข้อมูล

    // รับค่าจาก Flutter
    $content = @file_get_contents("php://input"); //plaintext
    $json_data = @json_decode($content,true); // เอา plaintext มาจัดรูปแบบเป็น json (json_decode)
    $cus_id = @$json_data["cus_id"];
    $cus_name = @$json_data["cus_name"];
    $cus_username = @$json_data["cus_username"];
    $cus_password = @$json_data["cus_password"];

    // ตรวจสอบว่าข้อมูลครบถ้วน
    if (!empty($cus_id) && !empty($cus_name) && !empty($cus_username) && !empty($cus_password)) {
        $sql = "INSERT INTO customer (cus_id, cus_name, cus_username, cus_password) VALUES ('$cus_id', '$cus_name', '$cus_username', '$cus_password')";
        
        if (mysqli_query($conn, $sql)) {
            echo $json=json_encode(["result" => 1, "message" => "Customer added successfully"]);
        } else {
            echo $json=json_encode(["result" => 0, "message" => "Failed to insert data"]);
        }
    } else {
        echo $json=json_encode(["result" => 0, "message" => "Missing required fields"]);
    }

    @mysqli_close($conn);

    $ip = $_SERVER['REMOTE_ADDR'];
    $date = date("Y-m-d H:i:s");
    $message_log =$date." ".$ip." request:".$content."\nresponse: ".$json."\n";
    $objFopen = @fopen("log/set_customer.log","a+");
    @fwrite($objFopen,$message_log);
    @fclose($objFopen);      
?>
