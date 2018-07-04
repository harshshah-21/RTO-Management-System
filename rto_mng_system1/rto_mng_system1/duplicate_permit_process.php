<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 
	 
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $reg_no = mysql_real_escape_string($_POST["reg_no"]);
	 $p_no = mysql_real_escape_string($_POST["p_no"]);
	 $circumstances = mysql_real_escape_string($_POST["circumstances"]);
	
	 $sql1="SELECT * FROM `permit_result` WHERE `p_no` = '$p_no'";
	 
	 $query1=mysql_query($sql1);
	$row1 = mysql_fetch_array($query1);
	$p_id = $row1['P_id'];
	
	$sql2 = "SELECT * FROM `permit` WHERE `reg_no` = '$reg_no'"; 
$query2=mysql_query($sql2);	 
	 if(mysql_num_rows($query2)>0)
	 {
	 
	   $sql = "INSERT INTO `duplicate permit`(`DUP_P_id`, `P_id`,`p_no`, `Circumstances`,`approval_status`) VALUES ('','$p_id','$p_no','$circumstances','')";
	 
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
	 else
	 { echo "Entered information is invalid";}

?>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>