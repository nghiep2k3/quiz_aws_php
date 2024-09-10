<?php

class Account
{
    private $conn;
    public $id_account;
    public $username;
    public $password;
    public $role;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    // Phương thức để tìm kiếm tài khoản theo username
    public function findByUsername()
    {
        $query = "SELECT * FROM user WHERE username = ? LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->username);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->id_account = $row['id_account'];
            $this->username = $row['username'];
            $this->password = $row['password'];
            $this->role = $row['role'];
            return true;
        }

        return false;
    }

    public function create()
    {
        $query = "INSERT INTO accounts SET username=:username, password=:password, role=:role";

        $stmt = $this->conn->prepare($query);

        $this->username = htmlspecialchars(strip_tags($this->username));
        $this->password = password_hash($this->password, PASSWORD_BCRYPT); // Mã hóa mật khẩu
        $this->role = htmlspecialchars(strip_tags($this->role));

        $stmt->bindParam(":username", $this->username);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":role", $this->role);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    public function authenticate($inputPassword)
    {
        return password_verify($inputPassword, $this->password);
    }

}

?>