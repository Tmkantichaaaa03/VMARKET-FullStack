<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->username) || !isset($data->email) || !isset($data->password)) {
        http_response_code(400); 
        echo json_encode(array("success" => false, "message" => "ข้อมูลไม่ครบถ้วน"));
        exit;
    }

    $username = $conn->real_escape_string($data->username);
    $email    = $conn->real_escape_string($data->email);
    $password = $conn->real_escape_string($data->password);
    
    // รับข้อมูลที่อยู่และตัวละคร
    $address      = isset($data->address) ? $conn->real_escape_string($data->address) : "";
    $full_name    = isset($data->name) ? $conn->real_escape_string($data->name) : $username;
    $phone_number = isset($data->phone_number) ? $conn->real_escape_string($data->phone_number) : "";
    $avatar_id    = isset($data->avatar_id) ? intval($data->avatar_id) : 1;

    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    $conn->begin_transaction(); // เริ่มบันทึกข้อมูล

    try {
        // บันทึกลงตาราง users
        $sql_user = "INSERT INTO users (username, email, password_hash, role) 
                     VALUES ('$username', '$email', '$password_hash', 'customer')";

        if (!$conn->query($sql_user)) {
            if ($conn->errno == 1062) throw new Exception("ชื่อผู้ใช้หรืออีเมลนี้ถูกใช้ไปแล้ว");
            throw new Exception("ไม่สามารถสร้างบัญชีผู้ใช้ได้: " . $conn->error);
        }

        $new_user_id = $conn->insert_id;
        
        // บันทึกลงตาราง customers
        $sql_customer = "INSERT INTO customers (user_id, name, phone_number, address, game_points, level, avatar_id) 
                         VALUES ('$new_user_id', '$full_name', '$phone_number', '$address', 0, 1, '$avatar_id')";
        
        if (!$conn->query($sql_customer)) {
            throw new Exception("ไม่สามารถบันทึกข้อมูลลูกค้าได้: " . $conn->error);
        }
        
        $conn->commit(); // ยืนยันการบันทึกทั้งหมด
        http_response_code(201);
        echo json_encode(array("success" => true, "message" => "สมัครสมาชิกสำเร็จ!"));

    } catch (Exception $e) {
        $conn->rollback(); // ยกเลิกการบันทึกถ้ามีจุดใดผิดพลาด
        http_response_code(500);
        echo json_encode(array("success" => false, "message" => $e->getMessage()));
    }
}
$conn->close();
?>