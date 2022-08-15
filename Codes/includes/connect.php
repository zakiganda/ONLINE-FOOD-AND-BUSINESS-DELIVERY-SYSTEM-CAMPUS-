<?php
session_start();
$servername = "localhost:3307";
$server_user = "root";
$server_pass = "your_password";
$dbname = "id18394884_food";
if(isset($_SESSION['name'])){
    $name = $_SESSION['name'];
}
if(isset($_SESSION['role'])){
    $role = $_SESSION['role'];
}
$con = new mysqli($servername, $server_user, $server_pass, $dbname);
?>

