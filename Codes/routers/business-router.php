<?php
include '../includes/connect.php';
	foreach ($_POST as $key => $value)
	{
		if(preg_match("/[0-9]+_name/",$key)){
			if($value != ''){
			$key = strtok($key, '_');
			$value = htmlspecialchars($value);
			$sql = "UPDATE business SET business_name = '$value' WHERE business_id = $key;";
			$con->query($sql);
			}
		}
		if(preg_match("/[0-9]+_address/",$key)){
			$key = strtok($key, '_');
			$sql = "UPDATE business SET business_address = '$value' WHERE business_id = $key;";
			$con->query($sql);
		}
		if(preg_match("/[0-9]+_ownerId/",$key)){
			$key = strtok($key, '_');
			$sql = "UPDATE business SET owner_id = $value WHERE business_id = $key;";
			$con->query($sql);
		}
		if(preg_match("/[0-9]+_hide/",$key)){
			if($_POST[$key] == 1){
			$key = strtok($key, '_');
			$sql = "UPDATE business SET deleted = 0 WHERE business_id = $key;";
			$con->query($sql);
			} else{
			$key = strtok($key, '_');
			$sql = "UPDATE business SET deleted = 1 WHERE business_id = $key;";
			$con->query($sql);			
			}
		}
	}
header("location: ../admin-page.php");
?>