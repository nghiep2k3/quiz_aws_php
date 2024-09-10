<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once('../../config/db.php');
include_once('../../model/question.php');
// khởi tạo kết nối
$db = new db();
$connect = $db->connect();

// đi vào model
$quesiton = new Question($connect);
$quesiton->id = isset($_GET['id']) ? $_GET['id'] : die();

// kết quả
$quesiton->showQuestionLitmit();
$quesiton_array = [];
$quesiton_array['data'] = [];


$quesiton_item = array(
    'id' => $quesiton->id,
    'title' => $quesiton->title,
    'cau_a' => $quesiton->cau_a,
    'cau_b' => $quesiton->cau_b,
    'cau_c' => $quesiton->cau_c,
    'cau_d' => $quesiton->cau_d,
    'caudung' => $quesiton->cau_dung,
);
array_push($quesiton_array['data'], $quesiton_item);


print_r(json_encode($quesiton_array));

?>