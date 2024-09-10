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

// Kiểm tra xem dữ liệu đã đủ chưa
if (
    !empty($data->title) &&
    !empty($data->cau_a) &&
    !empty($data->cau_b) &&
    !empty($data->cau_c) &&
    !empty($data->cau_d) &&
    !empty($data->cau_dung)
) {
    // Gán giá trị cho các thuộc tính của đối tượng Question
    $question->title = $data->title;
    $question->cau_a = $data->cau_a;
    $question->cau_b = $data->cau_b;
    $question->cau_c = $data->cau_c;
    $question->cau_d = $data->cau_d;
    $question->cau_dung = $data->cau_dung;

    // Tạo câu hỏi
    if ($question->create()) {
        // Phản hồi khi tạo thành công
        http_response_code(201);
        echo json_encode(array("message" => "Câu hỏi đã được tạo."));
    } else {
        // Phản hồi khi không thể tạo
        http_response_code(503);
        echo json_encode(array("message" => "Không thể tạo câu hỏi."));
    }
} else {
    // Phản hồi khi dữ liệu không đầy đủ
    http_response_code(400);
    echo json_encode(array("message" => "Không thể tạo câu hỏi. Dữ liệu không đầy đủ."));
}
?>