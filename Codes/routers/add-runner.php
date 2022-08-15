<?php
include '../includes/connect.php';

// Find business ID
$user_id = $_SESSION['user_id'];
$result1 = mysqli_query($con, "SELECT * FROM business WHERE owner_id=$user_id LIMIT 1");
$row1 = mysqli_fetch_array($result1);
$business_id = $row1['business_id'];    // The ID of the owner's restaurant

$runner_name = $_POST['runner'];
$runner_phoneNo = $_POST['runner_phoneNo'];
$sql = "INSERT INTO runner (runner_name, runner_phoneNo, business_id) VALUES ('$runner_name', $runner_phoneNo, $business_id)";
$con->query($sql);
header("location: ../runner.php");
?>