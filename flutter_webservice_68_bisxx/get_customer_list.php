<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");

include "config.php"; // เชื่อมต่อฐานข้อมูล

$sql = "SELECT cus_id, cus_name, cus_username FROM customer LIMIT 1,10";
$result = mysqli_query($conn, $sql);

$customers = array();
while ($row = mysqli_fetch_assoc($result)) {
    $customers[] = $row;
}

echo json_encode(["result" => 1, "customers" => $customers]);

/**$ip = $_SERVER['REMOTE_ADDR'];
$date = date("Y-m-d H:i:s");
$message_log =$date." ".$ip." request:".@$content."\nresponse: ".@$json."\n";
$objFopen = @fopen("log/get_customerlist.log","a+");
@fwrite($objFopen,$message_log);
@fclose($objFopen);**/ 


?>