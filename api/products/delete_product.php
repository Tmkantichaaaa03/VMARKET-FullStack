<?php 
header("Content-Type: application/json");
include("../../includes/db_connect.php");

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['product_id'])) {
    echo json_encode([
        "success" => false,
        "message" => "ไม่พบรหัสสินค้า"
    ]);
    exit;
}

$product_id = (int)$data['product_id'];

$conn->begin_transaction();

try {
    $stmt_img = $conn->prepare("DELETE FROM product_images WHERE product_id = ?");
    $stmt_img->bind_param("i", $product_id);
    $stmt_img->execute();

    $stmt = $conn->prepare("DELETE FROM products WHERE product_id = ?");
    $stmt->bind_param("i", $product_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        $conn->commit();
        echo json_encode([
            "success" => true,
            "message" => "ลบสินค้าเรียบร้อยแล้ว"
        ]);
    } else {
        $conn->rollback();
        echo json_encode([
            "success" => false,
            "message" => "ไม่พบสินค้าที่ต้องการลบ"
        ]);
    }

} catch (Exception $e) {
    $conn->rollback();
    
    if (strpos($e->getMessage(), 'foreign key') !== false) {
        $msg = "ไม่สามารถลบสินค้าได้ เนื่องจากมีข้อมูลคำสั่งซื้อที่เกี่ยวข้อง";
    } else {
        $msg = $e->getMessage();
    }

    echo json_encode([
        "success" => false,
        "message" => $msg
    ]);
}

if (isset($stmt)) $stmt->close();
if (isset($stmt_img)) $stmt_img->close();

$conn->close();
?>