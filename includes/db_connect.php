<?php
if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params(0, '/vmarket/');
    session_start();
}

$servername = "localhost";
$username = "root";       
$password = "";           
$dbname = "virtual_marketplace";

$conn = new mysqli($servername, $username, $password, $dbname);

// ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die(json_encode(array("success" => false, "message" => "Connection failed: " . $conn->connect_error)));
}

$conn->set_charset("utf8mb4");

?>