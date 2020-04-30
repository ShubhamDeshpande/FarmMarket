<?php
	require_once 'core/init.php';

	// get post data
	$full_name = $_POST['full_name'];
	$email = $_POST['email'];
	$street = $_POST['street'];
	$street2 = $_POST['street2'];
	$city = $_POST['city'];
	$state = $_POST['state'];
	$zip_code = $_POST['zip_code'];
	$country = $_POST['country'];
	$tax = $_POST['tax'];
	$subtotal = $_POST['sub_total'];
	$grand_total = $_POST['grand_total'];
	$cart_id = $_POST['cart_id'];
	$description = $_POST['description'];


	// Update cart
	$db->query("UPDATE cart SET paid = 1 WHERE id = '$cart_id'");
	$transaction_query = "INSERT INTO `transactions` (`cart_id`,`full_name`,`email`,`street`,`street2`,`city`,`state`,`zip_code`,`country`,`sub_total`,`tax`,`grand_total`,`description`) VALUES ('$cart_id','$full_name','$email','$street','$street2','$city','$state','$zip_code','$country','$subtotal','$tax','$grand_total','$description')";

	if (mysqli_query($db,$transaction_query)) {
		echo "Transaction complete";
	}
	else{
		echo "Error: " . $transaction_query . "<br>" . $db->error;
        echo "Transaction not complete";
	}

	$domain = ($_SERVER['HTTP_HOST'] != 'localhost')?'.'.$_SERVER['HTTP_HOST']:false;
	setcookie(CART_COOKIE,'',1,'/',$domain,false);

	include 'includes/head.php'; 
	include 'includes/navigation.php';
	include 'includes/headerpartial.php';
?>

<h1 class="text-center text-success">Thank You !</h1> <hr>
<p> Your have to pay <?php echo money($grand_total);?>.One of our Delivery guy will be out for delivery soon. Thanks for shopping with us.</p>
<p> Your receipt number is : <strong><?php echo $cart_id;?></strong></p>
<p> Your order will be shipped to the address below.</p>
<address>
	<?php echo $full_name; ?><br>
	<?php echo $street; ?><br>
	<?php echo (($street2 != '')?$street2.'<br>':''); ?>
	<?php echo $city.','.$state.'-'.$zip_code; ?><br>
	<?php echo $country; ?>
</address>


<?php include 'includes/footer.php'; ?>