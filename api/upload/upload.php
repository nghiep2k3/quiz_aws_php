<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Thư mục lưu trữ hình ảnh
$target_dir = "../../uploads/";
// echo $target_dir;


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Kiểm tra xem file có được gửi không
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $file_name = basename($_FILES["image"]["name"]);
        $target_file = $target_dir . $file_name;

        // Kiểm tra xem file có phải là hình ảnh không
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if ($check !== false) {
            // Kiểm tra kích thước file (5MB)
            if ($_FILES["image"]["size"] <= 5000000) {
                // Cho phép một số loại file ảnh nhất định
                $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
                if (in_array($imageFileType, $allowed_types)) {
                    // Di chuyển file đã tải lên đến thư mục lưu trữ
                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                        http_response_code(200);
                        echo json_encode([
                            "message" => "Hình ảnh đã được tải lên thành công.",
                            "file_name" => $file_name,
                            "file_path" => $target_file
                        ]);
                    } else {
                        http_response_code(500);
                        echo json_encode(["message" => "Không thể di chuyển file đã tải lên."]);
                    }
                } else {
                    http_response_code(400);
                    echo json_encode(["message" => "Chỉ chấp nhận file JPG, JPEG, PNG & GIF."]);
                }
            } else {
                http_response_code(400);
                echo json_encode(["message" => "Kích thước file vượt quá giới hạn cho phép (5MB)."]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["message" => "File không phải là hình ảnh."]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["message" => "Không có file nào được gửi hoặc có lỗi xảy ra."]);
    }
} else {
    http_response_code(405);
    echo json_encode(["message" => "Chỉ chấp nhận phương thức POST."]);
}
?>
