<?php
// Lấy địa chỉ IP của client
$ip_address = $_SERVER["REMOTE_ADDR"];
// $ip_address = '14.228.20.255';

// Thiết lập API và URL
$apiKey = "787306ff62c54e0e836b6cc0a195fb7f"; // Thay bằng API key của bạn
$url = "https://api.ipgeolocation.io/ipgeo?apiKey={$apiKey}&ip={$ip_address}&lang=en&fields=*";

// Khởi tạo cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Thực hiện cURL và xử lý kết quả
$result = curl_exec($ch);
if (curl_errno($ch)) {
    echo "cURL Error: " . curl_error($ch);
} else {
    $geoInfo = json_decode($result, true);
    
    // Kết nối đến cơ sở dữ liệu sử dụng PDO
    $servername = "sql110.infinityfree.com";
    $username = "if0_37156750";
    $password = "DOJ1hoVpo4";
    $db = "if0_37156750_rest_api";
    $port = "3306";

    $dsn = "mysql:host=$servername;port=$port;dbname=$db;charset=utf8";

    try {
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Chuẩn bị truy vấn SQL để chèn dữ liệu
        $stmt = $pdo->prepare("
            INSERT INTO ip (ip_address, country_code2, country_name, country_capital, district, latitude, longitude, connection_type, current_time_now) 
            VALUES (:ip_address, :country_code2, :country_name, :country_capital, :district, :latitude, :longitude, :connection_type, :current_time_now)
        ");

        // Gán giá trị từ $geoInfo vào truy vấn
        $stmt->bindParam(':ip_address', $geoInfo['ip']);
        $stmt->bindParam(':country_code2', $geoInfo['country_code2']);
        $stmt->bindParam(':country_name', $geoInfo['country_name']);
        $stmt->bindParam(':country_capital', $geoInfo['country_capital']);
        $stmt->bindParam(':district', $geoInfo['district']);
        $stmt->bindParam(':latitude', $geoInfo['latitude']);
        $stmt->bindParam(':longitude', $geoInfo['longitude']);
        $stmt->bindParam(':connection_type', $geoInfo['organization']);
        $stmt->bindParam(':current_time_now', $geoInfo['time_zone']['current_time']);

        // Thực thi truy vấn
        $stmt->execute();

        echo "Dữ liệu đã được chèn thành công!";
    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
    }
}

// Đóng kết nối cURL
curl_close($ch);
?>