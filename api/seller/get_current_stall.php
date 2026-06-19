<?php
header("Content-Type: application/json");
include_once '../../includes/db_connect.php';

$seller_id = isset($_GET['seller_id']) ? intval($_GET['seller_id']) : 0;

if ($seller_id <= 0) {
    echo json_encode(["success" => false, "message" => "ไม่พบรหัสผู้ขาย"]);
    exit;
}

$stmt = $conn->prepare("SELECT stall_id, stall_number, zone, price FROM market_stalls WHERE seller_id = ? AND status = 'booked' LIMIT 1");
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["success" => true, "stall" => $result->fetch_assoc()]);
} else {
    echo json_encode(["success" => true, "stall" => null]);
}
$conn->close();
?>