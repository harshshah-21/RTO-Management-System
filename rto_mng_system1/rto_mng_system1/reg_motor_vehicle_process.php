<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 $type_of_vehicle = mysql_real_escape_string($_POST["type_of_vehicle"]);
	 $dealers_name = mysql_real_escape_string($_POST["dealers_name"]);
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $engine_no = mysql_real_escape_string($_POST["engine_no"]);
	 $date_of_manuf = $_POST["date_of_manuf"];
	 $seat_capacity = $_POST["seat_capacity"];
	 $fuel_type = $_POST["fuel_type"];
	 
	 $sql = "INSERT INTO `reg_motor_vehicle`(`REG_id`, `U_id`,`Dealers_name`, `Type_of_vehicle`, `date_of_manuf`, `Engine_no`, `seating_capacity`, `fuel_type`,`approval_status`) VALUES ('','$id','$dealers_name','$type_of_vehicle','$date_of_manuf','$engine_no','$seat_capacity','$fuel_type','')";
	 
	// echo $sql;
	$query = mysql_query($sql);
	 
	if($query)
	{
		?>
		

<!DOCTYPE html>
<html>
<head>
<title>LOGIN</title>
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="#" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<div class="container">
<h1>You have successfully applied for the Learning License we'll notify you when your request is approved</h1>
<a href="welcome.php" ><h2 style="margin-left:40%;text-decoration:none;color:#ef4c89">Go back to Home Page</h2></a>
	
</div>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>


<?php

	}
else
{

header("location:signup.php");
}


?>
