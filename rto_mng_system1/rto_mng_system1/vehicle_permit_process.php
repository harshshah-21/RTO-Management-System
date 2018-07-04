<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 $permit_type = mysql_real_escape_string($_POST["permit_type"]);
	 $engine_no = mysql_real_escape_string($_POST["engine_no"]);
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $reg_no = mysql_real_escape_string($_POST["reg_no"]);
	 
	$sql1 = "SELECT * FROM `reg_motor_result` WHERE `reg_no` = '$reg_no'";
	$query1 = mysql_query($sql1); 
	$row1= mysql_fetch_array($query1);
	 $reg_id = $row1['REG_id'];
	 
	  if(mysql_num_rows($query1)>0)
	 {
	 $sql = "INSERT INTO `permit`(`P_id`, `type_of_permit`, `REG_id`,`reg_no`, `U_id`, `approval_status`) VALUES ('','$permit_type','$reg_id','$reg_no','$id','')";
	 
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
<h1>You have successfully applied for the Permit we'll notify you when your request is approved</h1>
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

header("location:permit.php");
}

	 }
	 else {echo "Entered information does not match";}
?>
