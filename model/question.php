<?php
//model Question

class Question
{
    private $conn;
    public $id;
    public $title;
    public $cau_a;
    public $cau_b;
    public $cau_c;
    public $cau_d;
    public $cau_dung;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function readAll()
    {
        $query = "SELECT * FROM question ORDER BY title ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function showQuestionLitmit()
    {
        $query = "SELECT * FROM question WHERE id=? LIMIT 1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->title = $row['title'];
        $this->cau_a = $row['cau_a'];
        $this->cau_b = $row['cau_b'];
        $this->cau_c = $row['cau_c'];
        $this->cau_d = $row['cau_d'];
        $this->cau_dung = $row['cau_dung'];
    }

    // Thêm phương thức create
    public function create()
    {
        $query = "INSERT INTO question SET title=:title, cau_a=:cau_a, cau_b=:cau_b, cau_c=:cau_c, cau_d=:cau_d, cau_dung=:cau_dung";

        $stmt = $this->conn->prepare($query);

        // Xử lý dữ liệu đầu vào, bỏ các ký tự đặc biệt
        $this->title = htmlspecialchars(strip_tags($this->title));
        $this->cau_a = htmlspecialchars(strip_tags($this->cau_a));
        $this->cau_b = htmlspecialchars(strip_tags($this->cau_b));
        $this->cau_c = htmlspecialchars(strip_tags($this->cau_c));
        $this->cau_d = htmlspecialchars(strip_tags($this->cau_d));
        $this->cau_dung = htmlspecialchars(strip_tags($this->cau_dung));

        // Liên kết giá trị với câu truy vấn
        $stmt->bindParam(":title", $this->title);
        $stmt->bindParam(":cau_a", $this->cau_a);
        $stmt->bindParam(":cau_b", $this->cau_b);
        $stmt->bindParam(":cau_c", $this->cau_c);
        $stmt->bindParam(":cau_d", $this->cau_d);
        $stmt->bindParam(":cau_dung", $this->cau_dung);

        // Thực thi câu lệnh
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    //Update
    public function update()
    {
        $query = "UPDATE question SET title=:title, cau_a=:cau_a, cau_b=:cau_b, cau_c=:cau_c, cau_d=:cau_d, cau_dung=:cau_dung WHERE id=:id";

        $stmt = $this->conn->prepare($query);
        echo $this->id;

        //$this ở đây là một đối tượng
        // Xử lý dữ liệu đầu vào, bỏ các ký tự đặc biệt
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->title = htmlspecialchars(strip_tags($this->title));
        $this->cau_a = htmlspecialchars(strip_tags($this->cau_a));
        $this->cau_b = htmlspecialchars(strip_tags($this->cau_b));
        $this->cau_c = htmlspecialchars(strip_tags($this->cau_c));
        $this->cau_d = htmlspecialchars(strip_tags($this->cau_d));
        $this->cau_dung = htmlspecialchars(strip_tags($this->cau_dung));

        // Liên kết giá trị với câu truy vấn
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":title", $this->title);
        $stmt->bindParam(":cau_a", $this->cau_a);
        $stmt->bindParam(":cau_b", $this->cau_b);
        $stmt->bindParam(":cau_c", $this->cau_c);
        $stmt->bindParam(":cau_d", $this->cau_d);
        $stmt->bindParam(":cau_dung", $this->cau_dung);

        // Thực thi câu lệnh
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    public function delete()
    {
        $query = "DELETE FROM question WHERE id=:id";
        $stmt = $this->conn->prepare($query);
        $this->id = htmlspecialchars(strip_tags($this->id));
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
?>