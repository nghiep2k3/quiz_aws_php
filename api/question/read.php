<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include_once ('../../config/db.php');
include_once ('../../model/question.php');
// khởi tạo kết nối
$db = new db();
$connect = $db->connect();

// đi vào model
$quesiton = new Question($connect);
$read = $quesiton->readAll();

// hàm có sẵn pdo
$num = $read->rowCount();

if($num > 0){
    $quesiton_array = [];
    $quesiton_array['data'] = [];

    while($row = $read->fetch(PDO::FETCH_ASSOC)){
        extract($row);
        $quesiton_item = array(
          'id' => $id, 
          'title' => $title, 
          'cau_a' => $cau_a, 
          'cau_b' => $cau_b, 
          'cau_c' => $cau_c, 
          'cau_d' => $cau_d, 
          'cau_dung' => $cau_dung, 
        );

        // hàm này dùng để từ quesiton_item sang quesiton_array;
        array_push($quesiton_array['data'], $quesiton_item);
    }
    echo json_encode($quesiton_array);

}

?>