<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../includes/db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $data = json_decode(file_get_contents("php://input"));
    
    if (!isset($data->username) || !isset($data->password)) {
        http_response_code(400); 
        echo json_encode(array("success" => false, "message" => "Missing username or password."));
        exit;
    }

    $username = $conn->real_escape_string($data->username);
    $password = $conn->real_escape_string($data->password);
    
    // ดึงข้อมูล u.user_id และ c.address ออกมาด้วย
    $sql = "SELECT u.user_id, u.password_hash, u.role, 
                c.customer_id, c.game_points, c.level, c.avatar_id, c.address 
            FROM users u
            INNER JOIN customers c ON u.user_id = c.user_id
            WHERE u.username = '$username' AND u.role = 'customer'
            LIMIT 1";

    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        
        if (password_verify($password, $row['password_hash'])) {
            
            http_response_code(200); 
            echo json_encode(array(
                "success" => true,
                "message" => "Login successful.",
                "user_data" => array(
                    "user_id" => $row['user_id'],
                    "username" => $username,
                    "customer_id" => $row['customer_id'],
                    "address" => $row['address'],
                    "level" => $row['level'],
                    "game_points" => $row['game_points'],
                    "avatar_id" => $row['avatar_id']
                )
            ));
            
        } else {
            http_response_code(401); 
            echo json_encode(array("success" => false, "message" => "Invalid password."));
        }
    } else {
        http_response_code(404); 
        echo json_encode(array("success" => false, "message" => "Username not found."));
    }
    
} else {
    http_response_code(405);
    echo json_encode(array("success" => false, "message" => "Method not allowed."));
}

$conn->close();
?>