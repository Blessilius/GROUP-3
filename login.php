<?php
include("db.php");

// Get user input
$username = $_POST['username'];
$password = $_POST['password'];

// Validate the user and get user role
$sql = "SELECT * FROM Users WHERE Username = '$username' AND Password = '$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $userRole = $row['UserRole'];

    // Redirect based on user role
    if ($userRole === 'Student') {
        header("Location: student.php");
        exit();
    } elseif ($userRole === 'Teacher') {
        header("Location: teacher.php");
        exit();
    }
} else {
    // Redirect to login page if authentication fails
    header("Location: login.html");
    exit();
}

$conn->close();
?>