<?php
session_start();

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include_once '../../includes/db_connect.php';

if (!isset($_SESSION['seller_id'])) {
    echo json_encode([
        "success" => false,
        "message" => "กรุณาเข้าสู่ระบบก่อนดำเนินการ"
    ]);
    exit;
}

$seller_id = $_SESSION['seller_id'];

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['stall_id']) || !isset($data['store_type'])) {
    echo json_encode([
        "success" => false,
        "message" => "ข้อมูลไม่ครบถ้วน กรุณาตรวจสอบอีกครั้ง"
    ]);
    exit;
}

$stall_id   = intval($data['stall_id']);
$store_type = trim($data['store_type']);

$stmtCheckSeller = $conn->prepare("
    SELECT stall_id 
    FROM market_stalls 
    WHERE seller_id = ? AND status = 'booked'
");
$stmtCheckSeller->bind_param("i", $seller_id);
$stmtCheckSeller->execute();
$resultSeller = $stmtCheckSeller->get_result();

if ($resultSeller->num_rows > 0) {
    echo json_encode([
        "success" => false,
        "message" => "ท่านได้เลือกใช้พื้นที่ร้านค้าไว้แล้ว สามารถเลือกใช้ได้เพียง 1 พื้นที่เท่านั้น"
    ]);
    exit;
}

$stmt = $conn->prepare("
    SELECT status, allowed_type 
    FROM market_stalls 
    WHERE stall_id = ?
");
$stmt->bind_param("i", $stall_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode([
        "success" => false,
        "message" => "ไม่พบข้อมูลพื้นที่ร้านค้า"
    ]);
    exit;
}

$row = $result->fetch_assoc();

if ($row['status'] !== 'available') {
    echo json_encode([
        "success" => false,
        "message" => "พื้นที่ร้านค้านี้มีผู้ใช้สิทธิ์แล้ว"
    ]);
    exit;
}

if ($row['allowed_type'] !== $store_type) {
    echo json_encode([
        "success" => false,
        "message" => "ประเภทกิจการของท่านไม่สามารถเลือกใช้พื้นที่นี้ได้"
    ]);
    exit;
}

$stmtUpdate = $conn->prepare("
    UPDATE market_stalls 
    SET status = 'booked',
        seller_id = ?,
        booked_at = NOW()
    WHERE stall_id = ?
");

$stmtUpdate->bind_param("ii", $seller_id, $stall_id);

if ($stmtUpdate->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "ดำเนินการเลือกใช้พื้นที่ร้านค้าเรียบร้อยแล้ว"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "เกิดข้อผิดพลาดในการดำเนินการ"
    ]);
}

$conn->close();
?>
