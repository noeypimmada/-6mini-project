<?php
session_start();
include 'db.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // เปลี่ยนข้อมูลตามโจทย์ครู (จากรูปคือ test / 123456789)
    if ($username == "test" && $password == "123456789") {
        $_SESSION['admin'] = $username;
        header("Location: admin.php");
        exit();
    } else {
        $error = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง!";
    }
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - พิมพ์มาดา เที่ยงสั้น</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 450px;">
        <div class="card shadow p-4 text-center">
            <h2 class="mb-4">Admin</h2>
            <p class="text-muted">Login to start your Admin</p>

            <?php if($error != ""): ?>
                <div class="alert alert-danger"><?php echo $error; ?></div>
            <?php endif; ?>

            <form method="POST" class="text-start">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Username" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
            </form>

            <!-- ปุ่มลิงก์ไปหน้า GitHub Source Code ของน้อง -->
            <a href="https://github.com/noeypimmada/Pimmada6" target="_blank" class="btn btn-dark w-100 mb-3">Source Code</a>

            <hr>
            <p class="small text-muted mb-1">ท่านสามารถเข้าสู่ระบบได้โดยใช้ชื่อผู้ใช้และรหัสผ่านที่ถูกต้อง</p>
            <p class="small fw-bold mb-1">username: test</p>
            <p class="small fw-bold">password: 123456789</p>
        </div>
    </div>
</body>
</html>
