<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once('../../config/db.php');
include_once('../../model/account.php');

$db = new db();
$connect = $db->connect();

$account = new Account($connect);

$data = json_decode(file_get_contents("php://input"));

if (!empty($data->username) && !empty($data->password)) {
    $account->username = $data->username;

    if ($account->findByUsername()) {
        echo "Stored password hash: " . $account->password . "\n";
        echo "Provided password: " . $data->password . "\n";

        if ($account->password == $data->password) {
            http_response_code(200);
            echo json_encode(array(
                "message" => "Đăng nhập thành công.",
                "id_account" => $account->id_account,
                "password" => $account->password,
                "username" => $account->username,
                "role" => $account->role
            ));
        } else {
            http_response_code(401);
            echo json_encode(array("message" => "Mật khẩu không chính xác."));
        }
    } else {
        http_response_code(404);
        echo json_encode(array("message" => "Tài khoản không tồn tại."));
    }
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Vui lòng nhập đầy đủ username và password."));
}
?>