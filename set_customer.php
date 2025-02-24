<?php
    @header("Content-Type: application/json; charset=UTF-8");
    @header("Access-Control-Allow-Origin: *");
    @header("Access-Control-Allow-Methods: POST");

    include "config.php"; // เชื่อมต่อฐานข้อมูล

    // รับค่าจาก Flutter
    $data = json_decode(file_get_contents("php://input"), true);
    $cus_id = $data["cus_id"];
    $cus_name = $data["cus_name"];
    $cus_username = $data["cus_username"];
    $cus_password = $data["cus_password"];

    // ตรวจสอบว่าข้อมูลครบถ้วน
    if (!empty($cus_id) && !empty($cus_name) && !empty($cus_username) && !empty($cus_password)) {
        $sql = "INSERT INTO customer (cus_id, cus_name, cus_username, cus_password) VALUES ('$cus_id', '$cus_name', '$cus_username', '$cus_password')";
        
        if (mysqli_query($conn, $sql)) {
            echo json_encode(["result" => 1, "message" => "Customer added successfully"]);
        } else {
            echo json_encode(["result" => 0, "message" => "Failed to insert data"]);
        }
    } else {
        echo json_encode(["result" => 0, "message" => "Missing required fields"]);
    }

    @mysqli_close($conn);
?>
