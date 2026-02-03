<?php 
    //for back end
    header("Content-Type: application/json; charset=UTF-8");
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '');
    define('DB_NAME', '_shop');


    try{
        $dsn = "mysql:host=127.0.0.1;dbname=" . DB_NAME . ";charset=utf8";
        $pdo = new PDO($dsn, DB_USERNAME, DB_PASSWORD,[
            PDO::ATTR_ERRMODE=> PDO::ERRMODE_EXCEPTION,  //ERRMODE_EXCEPTION / ERRMODE_SILENT
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_PERSISTENT => true, 
            PDO::ATTR_EMULATE_PREPARES   => false, 
            PDO::ATTR_STRINGIFY_FETCHES  => false, 
        ]);
        //echo json_encode(["message" => "Connection success"]);
    }catch (PDOException $e){
        http_response_code(500); //2xx 4xx 5xx httpcode
        echo json_encode(["message" => "Connection failed"]);
        exit;
    }
?>
