<?php
include '../includes/connect.php';
include '../includes/wallet.php';
$total = 0;
$address = htmlspecialchars($_POST['address']);
$description =  htmlspecialchars($_POST['description']);
$payment_type = $_POST['payment_type'];
$total = $_POST['total'];
$business_id = $_SESSION['business_id'];	// The ID of restaurant who will get the order
	$sql = "INSERT INTO orders (customer_id, payment_type, address, total, description, business_id) VALUES ($user_id, '$payment_type', '$address', $total, '$description', $business_id)";
	if ($con->query($sql) === TRUE){
		$order_id =  $con->insert_id;
		foreach ($_POST as $key => $value)
		{
			if(is_numeric($key)){
			$result = mysqli_query($con, "SELECT * FROM items WHERE id = $key");
			while($row = mysqli_fetch_array($result))
			{
				$price = $row['price'];
			}
				$price = $value*$price;
			$sql = "INSERT INTO order_details (order_id, item_id, quantity, price) VALUES ($order_id, $key, $value, $price)";
			$con->query($sql) === TRUE;		
			}
		}
		if($_POST['payment_type'] == 'Wallet'){
		$balance = $balance - $total;
		$sql = "UPDATE wallet_details SET balance = $balance WHERE wallet_id = $wallet_id;";
		$con->query($sql) === TRUE;
		}
			header("location: ../orders.php");
	}

?>