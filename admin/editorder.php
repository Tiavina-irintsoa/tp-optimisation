<?php include ( "../inc/connect.inc.php" ); ?>
<?php 

ob_start();
session_start();
if (!isset($_SESSION['admin_login'])) {
	$user = "";
	header("location: login.php?ono=".$eoid."");
}
else {
	if (isset($_REQUEST['eoid'])) {
	
		$eoid = $mysqli->real_escape_string($_REQUEST['eoid']);
		$getposts5 =$mysqli->query("SELECT * FROM orders WHERE id='$eoid'") or die(mysql_error());
			if ($getposts5->num_rows>0){

			}else {
				header('location: index.php');
			}
	}else {
		header('location: index.php');
	}
	$user = $_SESSION['admin_login'];
	$result =$mysqli->query("SELECT * FROM admin WHERE id='$user'");
	$get_user_email = $result->fetch_assoc();
		$uname_db = $get_user_email['firstName'];


	$result1 =$mysqli->query("SELECT * FROM orders WHERE id='$eoid'");
		$get_order_info = $result1->fetch_assoc();
			$eouid = $get_order_info['uid'];
			$eopid = $get_order_info['pid'];
			$eoquantity = $get_order_info['quantity'];
			$eoplace = $get_order_info['oplace'];
			$eomobile = $get_order_info['mobile'];
			$eodstatus = $get_order_info['dstatus'];
			$eodustatus = ucwords($get_order_info['dstatus']);
			$eodate = $get_order_info['odate'];
			$eddate = $get_order_info['ddate'];

			$result2 =$mysqli->query("SELECT * from user WHERE id='$eouid'");
			$get_order_info2 = $result2->fetch_assoc();
			$euname = $get_order_info2['firstName'];
			$euemail = $get_order_info2['email'];
			$eumobile = $get_order_info2['mobile'];
}

$getposts =$mysqli->query("SELECT * FROM products WHERE id ='$eopid'") or die(mysql_error());
					if ($getposts->num_rows>0) {
						$row = $getposts->fetch_assoc();
						$id = $row['id'];
						$pName = $row['pName'];
						$price = $row['price'];
						$description = $row['description'];
						$picture = $row['picture'];
						$item = $row['item'];
						$category = $row['category'];
						$available =$row['available'];
					}	

//order

if (isset($_POST['order'])) {
//declere veriable
$eodstatus = $_POST['dstatus'];
$dquantity = $_POST['quantity'];
$ddate = $_POST['ddate'];
//triming name
	try {
		if(empty($_POST['dstatus'])) {
			throw new Exception('Status can not be empty');
			
		}
				if($mysqli->query("UPDATE orders SET dstatus='$eodstatus', ddate='$ddate', quantity='$dquantity' WHERE id='$eoid'")){
					//success message
				header('location: editorder.php?eoid='.$eoid.'');
				$success_message = '
				<div class="signupform_content"><h2><font face="bookman">Change successfull!</font></h2>
				</div>';
				}

	}
	catch(Exception $e) {
		$error_message = $e->getMessage();
	}
}
if (isset($_POST['delorder'])) {
//triming name
	if($mysqli->query("DELETE FROM orders WHERE id='$eoid'")){

	header('location: orders.php');
	}

	}
$search_value = "";


?>

<!DOCTYPE html>
<html>
<head>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-N7JV3TSB');</script>
<!-- End Google Tag Manager -->
	<title>SAREE</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-image: url(../image/homebackgrndimg1.png);">
	<div class="homepageheader">
			<div class="signinButton loginButton">
				<div class="uiloginbutton signinButton loginButton" style="margin-right: 40px;">
					<?php 
						if ($user!="") {
							echo '<a style="text-decoration: none;color: #fff;" href="logout.php">LOG OUT</a>';
						}
					 ?>
					
				</div>
				<div class="uiloginbutton signinButton loginButton">
					<?php 
						if ($user!="") {
							echo '<a style="text-decoration: none;color: #fff;" href="login.php">Hi '.$uname_db.'</a>';
						}
						else {
							echo '<a style="text-decoration: none;color: #fff;" href="login.php">LOG IN</a>';
						}
					 ?>
				</div>
			</div>
			<div style="float: left; margin: 5px 0px 0px 23px;">
				<a href="index.php">
					<img style=" height: 75px; width: 130px;" src="../image/ebuybdlogo.png">
				</a>
			</div>
			<div id="srcheader">
				<form id="newsearch" method="get" action="search.php">
				        <?php 
				        	echo '<input type="text" class="srctextinput" name="keywords" size="21" maxlength="120"  placeholder="Search Here..." value="'.$search_value.'"><input type="submit" value="search" class="srcbutton" >';
				         ?>
				</form>
			<div class="srcclear"></div>
			</div>
		</div>
		<div class="categolis">
			<table>
				<tr>
					<th>
						<a href="index.php" style="text-decoration: none;color: #fff;padding: 4px 12px;background-color: #c7587e;border-radius: 12px;">Home</a>
					</th>
					<th><a href="addproduct.php" style="text-decoration: none;color: #ddd;padding: 4px 12px;background-color: #c7587e;border-radius: 12px;">Add Product</a></th>
					<th><a href="newadmin.php" style="text-decoration: none;color: #ddd;padding: 4px 12px;background-color: #c7587e;border-radius: 12px;">New Admin</a></th>
					<th><a href="allproducts.php" style="text-decoration: none;color: #ddd;padding: 4px 12px;background-color: #c7587e;border-radius: 12px;">All Products</a></th>
					<th><a href="orders.php" style="text-decoration: none;color: #ddd;padding: 4px 12px;background-color: #24bfae;border-radius: 12px;">Orders</a></th>
				</tr>
			</table>
		</div>
	<div class="holecontainer" style=" padding-top: 20px; padding: 0 20%">
		<div class="container signupform_content ">
			<div>
				<h2 style="padding-bottom: 20px;">Change Delevary Status</h2>
				<div style="float: right;">
				<?php 
					echo '
						<div class="">
						<div class="signupform_text"></div>
						<div>
							<form action="" method="POST" class="registration">
								<div class="signup_form" style="    margin-top: 38px;">
									<div>
										<td>
											<input name="ddate" placeholder="Delevary date" required="required" class="email signupbox" type="date" size="30" value="'.$eddate.'">
										</td>
									</div>
									<div>
										<td>
											<select name="dstatus" required="required" style=" font-size: 20px;
												font-style: italic;margin-bottom: 3px;margin-top: 0px;padding: 14px;line-height: 25px;border-radius: 4px;border: 1px solid #169E8F;color: #169E8F;margin-left: 0;width: 300px;background-color: transparent;" class="">
														<option selected value="'.$eodstatus.'">'.$eodustatus.'</option>
														<option value="No">No</option>
														<option value="Yes">Yes</option>
														<option value="Cancel">Cancel</option>
													</select>
										</td>
									</div>
									<div>
										<td>
											<select name="quantity" required="required" style=" font-size: 20px;
										font-style: italic; margin-bottom: 3px;margin-top: 0px;padding: 14px;line-height: 25px;border-radius: 4px;border: 1px solid #169E8F;color: #169E8F;margin-left: 0;width: 300px;background-color: transparent;" class="">
										<option selected value="'.$eoquantity.'">Quantity: '.$eoquantity.'</option>';
				 								?><?php
												for ($i=1; $i<=$available; $i++) { 
													echo '<option value="'.$i.'">Quantity: '.$i.'</option>';
												}
											?>
											<?php echo '
											</select>
										</td>
									</div>
									<div>
										<input name="order" class="uisignupbutton signupbutton" type="submit" value="Confirm Change">
									</div>
									<div>
										<input name="delorder" class="uisignupbutton signupbutton" type="submit" value="Delete Order">
									</div>
									<div class="signup_error_msg"> '; ?>
										<?php 
											if (isset($error_message)) {echo $error_message;}
											
										?>
									<?php echo '</div>
								</div>
							</form>
							
						</div>
					</div>

					';
					if(isset($success_message)) {echo $success_message;}

				 ?>
					
				</div>
			</div>
		</div>
		<div style="float: left;">
			<div>
				<?php
					echo '
						<ul style="float: left;">
							<li style="float: left; padding: 0px 25px 25px 25px;">
								<div class="home-prodlist-img">
									<img src="../image/product/'.$item.'/'.$picture.'" class="home-prodlist-imgi">
									
									<div style="text-align: center; padding: 0 0 6px 0;">'.$pName.'</div>
								</div>
								
							</li>
						</ul>
					';
				?>
			</div>

		</div>
	</div>
</body>
</html>