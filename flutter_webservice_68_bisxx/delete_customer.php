<?php
    @header("Content-Type: application/json; charset=UTF-8");
    @header("Access-Control-Allow-Origin: *");
    @header("Access-Control-Allow-Methods: POST");

    include "config.php"; // เชื่อมต่อฐานข้อมูล

    $content = @file_get_contents("php://input"); //plaintext
    $json_data = @json_decode($content,true); // เอา plaintext มาจัดรูปแบบเป็น json (json_decode)
    $cus_id = $json_data["cus_id"];

    if (!empty($cus_id)) {
        $sql = "DELETE FROM customer WHERE cus_id='$cus_id'";

        if (mysqli_query($conn, $sql)) {
            echo $json=json_encode(["result" => 1, "message" => "Customer deleted successfully"]);
        } else {
            echo $json=json_encode(["result" => 0, "message" => "Failed to delete"]);
        }
    } else {
        echo $json=json_encode(["result" => 0, "message" => "Missing required fields"]);
    }

    mysqli_close($conn);

    $ip = $_SERVER['REMOTE_ADDR'];
    $date = date("Y-m-d H:i:s");
    $message_log =$date." ".$ip." request:".$content."\nresponse: ".$json."\n";
    $objFopen = @fopen("log/delete_customer.log","a+");
    @fwrite($objFopen,$message_log);
    @fclose($objFopen);    
?>
