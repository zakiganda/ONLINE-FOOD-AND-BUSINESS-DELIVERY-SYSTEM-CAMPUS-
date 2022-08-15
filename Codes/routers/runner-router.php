<?php
include '../includes/connect.php';
	foreach ($_POST as $key => $value)
	{
		if(preg_match("/[0-9]+_name/",$key)){
			if($value != ''){
			$key = strtok($key, '_');
			$value = htmlspecialchars($value);
			$sql = "UPDATE runner SET runner_name = '$value' WHERE id = $key;";
			$con->query($sql);
			}
		}
		if(preg_match("/[0-9]+_phoneNo/",$key)){
			$key = strtok($key, '_');
			$sql = "UPDATE runner SET runner_phoneNo = $value WHERE id = $key;";
			$con->query($sql);
		}
		if(preg_match("/[0-9]+_hide/",$key)){
			if($_POST[$key] == 1){
			$key = strtok($key, '_');
			$sql = "UPDATE runner SET deleted = 0 WHERE id = $key;";
			$con->query($sql);
			}
			else{
			$key = strtok($key, '_');
			$sql = "UPDATE runner SET deleted = 1 WHERE id = $key;";
			$con->query($sql);			
			}
		}
	}
header("location: ../runner.php");
?>