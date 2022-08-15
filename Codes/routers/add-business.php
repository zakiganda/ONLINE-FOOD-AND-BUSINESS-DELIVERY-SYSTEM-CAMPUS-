<?php
include '../includes/connect.php';

$bname = $_POST['business_name'];
$baddress = $_POST['business_address'];
$owner_id = $_POST['business_ownerId'];
$sql = "INSERT INTO business(business_name, business_address, owner_id, deleted) VALUES ('$bname', '$baddress',$owner_id, 0)";
$con->query($sql);
header("location: ../admin-page.php");

?>