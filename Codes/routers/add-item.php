<?php
include '../includes/connect.php';

$user_id = $_SESSION['user_id'];
$result1 = mysqli_query($con, "SELECT * FROM business WHERE owner_id=$user_id LIMIT 1");
$row1 = mysqli_fetch_array($result1);
$business_id = $row1['business_id'];    // The ID of the owner's restaurant

$name = $_POST['name'];
$price = $_POST['price'];
$sql = "INSERT INTO items (name, price, business_id) VALUES ('$name', $price, $business_id)";
$con->query($sql);
header("location: ../business-page.php");
?>