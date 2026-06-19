<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");

include_once '../../includes/db_connect.php';

session_start();

if (!isset($_SESSION['seller_id'])) {
    echo json_encode([
        "success" => false, 
        "message" => "กรุณาเข้าสู่ระบบก่อนดำเนินการ"
    ]);
    exit;
}

$seller_id = $_SESSION['seller_id'];

$sql = "UPDATE market_stalls 
        SET status = 'available', 
            seller_id = NULL, 
            booked_at = NULL 
        WHERE seller_id = $seller_id";

if ($conn->query($sql)) {
    echo json_encode([
        "success" => true, 
        "message" => "ยกเลิกการใช้พื้นที่และคืนสิทธิ์เรียบร้อยแล้ว"
    ]);
} else {
    echo json_encode([
        "success" => false, 
        "message" => "เกิดข้อผิดพลาดในการยกเลิก: " . $conn->error
    ]);
}

$conn->close();
?>