<?php
    ob_start();
    //1.header
    @header('Content-Type: application/json');
    @header("Access-Control-Allow-Origin: *");
    @header('Access-Control-Allow-Headers: X-Requested-With, content-type, access-control-allow-origin, access-control-allow-methods, access-control-allow-headers');
    //2.connection DB
    require ("config.php");
    //3.request from client
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $content = @file_get_contents("php://input"); //plaintext
        $json_data = @json_decode($content,true); // เอา plaintext มาจัดรูปแบบเป็น json (json_decode)
        $username = trim(@$json_data["username"]);
        $password = trim(@$json_data["password"]);        
    }else{
        header("HTTP/1.1 405 Method Not Allowed");
        die();        
    }
    //4.sql command / process
    $strSQL="SELECT * FROM customer WHERE cus_username ='".$username."' AND cus_password ='".$password."' ";   
    //print_r($strSQL); 
    $query = @mysqli_query($conn,$strSQL);
    //print_r($query);
    //5.process / sql command  
    $datalist = array(); 
    if(mysqli_num_rows($query)===1){
        $result =1;
        $message = "ok";
        while($resultObj = @mysqli_fetch_array($query,MYSQLI_ASSOC)){
            $datalist[] = array("cus_id"=>$resultObj['cus_id'],"cus_name"=>$resultObj['cus_name']);
        }
    }else{
        $result =0;
        $message = "login-fail";
        $datalist = null;
    }
    //6.json response
    ob_end_clean(); 
    echo $json = json_encode(array("result"=>$result,"message"=>$message,"datalist"=>$datalist));
    //7.close connection DB
    @mysqli_close($conn);
    //8.log request&response
    $ip = $_SERVER['REMOTE_ADDR'];
    $date = date("Y-m-d H:i:s");
    $message_log =$date." ".$ip." request:".$content."\nresponse: ".$json."\n";
    $objFopen = @fopen("log/getLogin.log","a+");
    @fwrite($objFopen,$message_log);
    @fclose($objFopen);  
    
    exit();
?>