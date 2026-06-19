<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");

include_once '../../includes/db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $data = json_decode(file_get_contents("php://input"));
    
    // เพิ่มการตรวจสอบฟิลด์ shop_type และ phone_number ในเงื่อนไข isset
    if (!isset($data->username) || !isset($data->email) || !isset($data->password) || 
        !isset($data->shop_name) || !isset($data->address) || !isset($data->shop_type) || !isset($data->phone_number)) {
        
        http_response_code(400);
        echo json_encode(array("success" => false, "message" => "กรุณากรอกข้อมูลให้ครบถ้วน (ขาดข้อมูลบางส่วน)"));
        exit;
    }

    // รับค่าเพิ่มและทำ Clean Data
    $username = $conn->real_escape_string($data->username);
    $email = $conn->real_escape_string($data->email);
    $password = $conn->real_escape_string($data->password);
    $shop_name = $conn->real_escape_string($data->shop_name);
    $address = $conn->real_escape_string($data->address);
    $shop_type = $conn->real_escape_string($data->shop_type); // รับประเภทร้านค้า
    $phone_number = $conn->real_escape_string($data->phone_number); // รับเบอร์โทรศัพท์
    
    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    $conn->begin_transaction();

    try {
        // บันทึกลงตาราง users
        $sql_user = "INSERT INTO users (username, email, password_hash, role) 
                     VALUES ('$username', '$email', '$password_hash', 'seller')";

        if (!$conn->query($sql_user)) {
             throw new Exception("User registration failed.");
        }

        $new_user_id = $conn->insert_id; 
        
        $sql_seller = "INSERT INTO sellers (user_id, shop_name, shop_type, address, phone_number) 
                       VALUES ('$new_user_id', '$shop_name', '$shop_type', '$address', '$phone_number')";
        
        if (!$conn->query($sql_seller)) {
            throw new Exception("Seller details insertion failed.");
        }
        
        $conn->commit();

        http_response_code(201);
        echo json_encode(array(
            "success" => true, 
            "message" => "สมัครสมาชิกสำเร็จ!",
            "user_id" => $new_user_id
        ));

    } catch (Exception $e) {
        
        $conn->rollback();
        
        if ($conn->errno == 1062) { 
            http_response_code(409); 
            $message = "ชื่อผู้ใช้หรืออีเมลนี้ถูกใช้งานแล้ว";
        } else {
            http_response_code(500);
            $message = "เกิดข้อผิดพลาดที่เซิร์ฟเวอร์: " . $e->getMessage();
        }

        echo json_encode(array("success" => false, "message" => $message));
    }
    
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "message" => "Method not allowed."));
}

$conn->close();
?>