<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");


include_once '../../includes/db_connect.php';

$sql = "SELECT 
            stall_id, 
            stall_number, 
            zone, 
            price, 
            status, 
            seller_id,
            allowed_type
        FROM market_stalls
        ORDER BY stall_number ASC";

$result = $conn->query($sql);

$stalls = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $stalls[] = $row;
    }
}

echo json_encode($stalls);

$conn->close();
?>