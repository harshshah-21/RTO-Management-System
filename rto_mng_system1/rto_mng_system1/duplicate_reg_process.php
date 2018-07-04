<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 
	 
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $engine_no = mysql_real_escape_string($_POST["engine_no"]);
	 $circumstances = mysql_real_escape_string($_POST["circumstances"]);
	
	 $reg_no = $_POST["reg_no"];
	 
	  $sql6 = "SELECT * FROM `reg_motor_result` WHERE `reg_no` = '$reg_no'";
	$query7 = mysql_query($sql6); 
	 if(mysql_num_rows($query7)>0)
	 {
	 
	 $sql1 = "SELECT `D_id` FROM `driving license` WHERE `U_id` = '$id'";
	$query1 = mysql_query($sql1); 
	$row1= mysql_fetch_array($query1);
	 $dl_id = $row1['D_id'];
	   $sql = "INSERT INTO `duplicate reg certificate`(`DUP_REG_id`, `REG_id`, `circumstances`, `approval_status`) VALUES ('','$reg_no','$circumstances','')";
	 
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
<h1>You have successfully applied for the Duplicate Driving License we'll notify you when your request is approved</h1>
<a href="welcome.php" ><h2 style="margin-left:40%;text-decoration:none;color:#ef4c89">Go back to Home Page</h2></a>
	
</div>



<?php

	}
else
{
	?>
	<div class="container">
<h1>An error has occured please try again</h1>
<a href="welcome.php" ><h2 style="margin-left:40%;text-decoration:none;color:#ef4c89">Go back to Home Page</h2></a>
	
</div>
<?php


//header("location:welcome.php");
}

}
	 else{ echo "Please apply for the Registration certificate first";}

?>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>