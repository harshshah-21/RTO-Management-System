<?php


include("conn.php");

  include('header1.php');
 
	
	 $s_username = mysql_real_escape_string($_POST["s_username"]);
	 $r_username = mysql_real_escape_string($_POST["r_username"]);
	
	 
	 $s_aadharno = mysql_real_escape_string($_POST["s_aadharno"]);
	 $r_aadharno = mysql_real_escape_string($_POST["r_aadharno"]);
	 $reg_no = mysql_real_escape_string($_POST["reg_no"]);
	 
	 $sql1 = "SELECT * FROM `user` WHERE `Aadharno` = '$r_aadharno'";
	$query1 = mysql_query($sql1); 
	$row1 = mysql_fetch_array($query1);
	$r_id = $row1['U_id'];
	
	 $sql2 = "SELECT * FROM `reg_motor_result` WHERE `reg_no` = '$reg_no'";
	$query2 = mysql_query($sql2); 
	$row2 = mysql_fetch_array($query2);
	$reg_id = $row2['REG_id'];
	
	 $sql = "INSERT INTO `transfer of ownership`(`T_id`, `S_U_id`, `R_U_id`, `REG_id`, `approval_status`) VALUES ('','$id','$r_id','$reg_id','')";
	 
	// echo $sql;
	$query = mysql_query($sql);
	 
	if($query)
	{
		?>
		

<!DOCTYPE html>
<html>
<head>
<title>Transfer of ownership</title>
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
echo "";
header("location:transfer.php");
}


?>
