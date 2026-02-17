<?php
    $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '*';
    header('Access-Control-Allow-Origin: $origin');
    header('Access-Control-Allow-Methods: GET, HEAD, OPTIONS'); 
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With, Accept, Authorization');
    header('Content-Type: application/json; charset=utf-8'); 

    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(200);
        echo $json_responce = json_encode(['result' => 1, 'message' => 'GET, HAED, OPTIONS and Authen']);
        exit();        
    }

    if ($_SERVER['REQUEST_METHOD'] === 'HEAD') {
        http_response_code(200);
        exit();        
    }    

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $content = @file_get_contents('php://input');
        $json_data = @json_decode($content, true);
		$cus_id = trim($json_data['cus_id']);
        $pro_id = trim($json_data['pro_id']);
        $pro_price = trim($json_data['pro_price']);
		$cart_num = trim($json_data['cart_num']);
		$cart_total = trim($json_data['cart_total']);
        //_log($content,null);

    }else{
        http_response_code(405);
        echo $json_responce = json_encode(["message" => "Method Not Allowed"]);
        exit();            
    }

    require_once 'config.php';

    try{
        $stmt = $pdo->prepare("INSERT INTO cart (cus_id,pro_id,pro_price,cart_num,cart_total) VALUES ('".$cus_id."','".$pro_id."','".$pro_price."','".$cart_num."','".$cart_total."')");
        $queryStatus = $stmt->execute();
        //$rows = $stmt->fetchAll();

        $stmt = $pdo->prepare("SELECT * FROM cart WHERE cus_id='".$cus_id."' ");
        $queryStatus = $stmt->execute();
		$rows = $stmt->fetchAll();
        if(trim(@$rows[0]['pro_id']) !=""){
            echo $json_responce = json_encode(array(
                "result"=>1,
                "message"=>"success",
                "datalist"=>$rows
            )); 
            _log($content,$json_responce);
            exit();             
        }else{ #login invaild
            echo $json_responce = json_encode(array(
                "result"=>0,
                "message"=>"fail",
                "datalist"=>null
            )); 
            _log($content,$json_responce);
            exit(); 
        }

    }catch (PDOException $e) {
        http_response_code(500);
        echo $json_responce = json_encode(["error" => $e->getMessage()], JSON_UNESCAPED_UNICODE);
        _log($content,$json_responce);
        exit();         
    }

    function _log($request,$responce){
        $ip = $_SERVER['REMOTE_ADDR'];
        $date =date("Y-m-d H:i:s");
        $message_log ="\n".$date.",".$ip.",request:".$request.",responce:".$responce;
        $objFopen= @fopen("log/".date("Y-m-d").".log","a+");
        @fwrite($objFopen,$message_log);
        @fclose($objFopen);
    }  

    # API login
    //echo json_encode(array("status"=>1,"message"=>"api connect success","datalist"=>null));    
?>