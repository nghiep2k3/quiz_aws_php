<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once('../../config/db.php');
include_once('../../model/question.php');

// Khởi tạo kết nối
$db = new db();
$connect = $db->connect();

// Đi vào model
$question = new Question($connect); // Sửa lỗi tại đây

// Lấy dữ liệu POST
$data = json_decode(file_get_contents("php://input"));

// Gán giá trị cho các thuộc tính của đối tượng Question
$question->id = $data->id;
$question->title = $data->title;
$question->cau_a = $data->cau_a;
$question->cau_b = $data->cau_b;
$question->cau_c = $data->cau_c;
$question->cau_d = $data->cau_d;
$question->cau_dung = $data->cau_dung;

// Tạo câu hỏi
if ($question->update()) {
    // Phản hồi khi tạo thành công
    http_response_code(201);
    echo json_encode(array("message" => "Câu hỏi đã được cập nhật"));
} else {
    // Phản hồi khi không thể tạo
    http_response_code(503);
    echo json_encode(array("message" => "Lỗi khi sửa"));
}

?>