<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With");

include_once '../../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $product_id = isset($_POST['product_id']) ? (int)$_POST['product_id'] : 0;
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $price = isset($_POST['price']) ? (float)$_POST['price'] : 0;
    $stock = isset($_POST['stock']) ? (int)$_POST['stock'] : 0;
    $description = isset($_POST['description']) ? $_POST['description'] : '';

    if ($product_id <= 0 || empty($name)) {
        http_response_code(400);
        echo json_encode(array("success" => false, "message" => "ข้อมูลไม่ครบถ้วนหรือไม่ถูกต้อง"));
        exit;
    }

    $conn->begin_transaction();

    try {
        $sql1 = "UPDATE products SET name = ?, description = ? WHERE product_id = ?";
        $stmt1 = $conn->prepare($sql1);
        $stmt1->bind_param("ssi", $name, $description, $product_id);
        $stmt1->execute();

        $sql2 = "UPDATE product_variations SET price = ?, stock = ? WHERE product_id = ?";
        $stmt2 = $conn->prepare($sql2);
        $stmt2->bind_param("dii", $price, $stock, $product_id);
        $stmt2->execute();

        $conn->commit();

        echo json_encode(array(
            "success" => true, 
            "message" => "อัปเดตข้อมูลสินค้าเรียบร้อยแล้ว"
        ));

    } catch (Exception $e) {
        $conn->rollback();
        http_response_code(500);
        echo json_encode(array(
            "success" => false, 
            "message" => "เกิดข้อผิดพลาด: " . $e->getMessage()
        ));
    }

    if(isset($stmt1)) $stmt1->close();
    if(isset($stmt2)) $stmt2->close();
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "message" => "Method not allowed"));
}

$conn->close();
?>