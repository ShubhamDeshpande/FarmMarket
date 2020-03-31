<?php
	$db = mysqli_connect('localhost','root','root','ecommerce_db');
	if (mysqli_connect_errno()) {
		echo 'Database connection failed with following errors :'. mysqli_connect_error();
		die();	
	}
	// Session start
	session_start();
	require_once $_SERVER['DOCUMENT_ROOT'].'/E-Commerce-Website/config.php';
	require_once BASEURL.'helpers/helpers.php';

	$cart_id = '';

	if (isset($_COOKIE[CART_COOKIE])) {
		$cart_id = sanitize($_COOKIE[CART_COOKIE]);
	}

	if (isset($_SESSION['User'])) {
		$user_id = $_SESSION['User'];
		$query = $db->query("SELECT * FROM users WHERE id = '$user_id'");
		$user_data = mysqli_fetch_assoc($query);
		$full_name = explode(' ', $user_data['full_name']);
		$user_data['firstname'] = $full_name[0];
		$user_data['lastname'] = $full_name[1];
	}
	else {
	    $login_page = "/E-Commerce-Website/login.php";
	    $register_page = "/E-Commerce-Website/registration.php";
	    if  ((($_SERVER['REQUEST_URI']) != $login_page) && (($_SERVER['REQUEST_URI']) != $register_page)  ) {
	        header("Location: $login_page");
	        exit();
	    }
    }

	if (isset($_SESSION['success_flash'])) {
		echo '<div class="alert alert-success" role="alert">'.$_SESSION['success_flash'].'</div>';
		unset($_SESSION['success_flash']);
	}

	if (isset($_SESSION['error_flash'])) {
		echo '<div class="alert alert-danger" role="alert">'.$_SESSION['error_flash'].'</p></div>';
		unset($_SESSION['error_flash']);
	}

?>