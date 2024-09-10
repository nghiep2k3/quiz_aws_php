<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once('../../config/db.php');
include_once('../../model/question.php');

// Khởi tạo kết nối
$db = new db();
$connect = $db->connect();

// Đi vào model
$question = new Question($connect); 

// Lấy dữ liệu từ tham số URL
if (isset($_GET['id'])) {
    $question->id = htmlspecialchars(strip_tags($_GET['id']));

    // Xóa câu hỏi
    if ($question->delete()) {
        http_response_code(200); // OK
        echo json_encode(array("message" => "Xóa thành công"));
    } else {
        http_response_code(503); // Service Unavailable
        echo json_encode(array("message" => "Không thể xóa câu hỏi."));
    }
} else {
    http_response_code(400); // Bad Request
    echo json_encode(array("message" => "ID không hợp lệ hoặc không được cung cấp."));
}
?>
