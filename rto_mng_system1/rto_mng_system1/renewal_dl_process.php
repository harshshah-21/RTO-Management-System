<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 
	 
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $dl_no = mysql_real_escape_string($_POST["dl_no"]);
	 $circumstances = mysql_real_escape_string($_POST["circumstances"]);
	 $date_issue = $_POST["date_issue"];
	 $date_expiry = $_POST["date_expiry"];
	 $date_renewal = $_POST["date_renewal"];
	 
	 $sql1 = "SELECT * FROM `dl_result` WHERE `dl_no` = '$dl_no'";
	$query1 = mysql_query($sql1); 
	 if(mysql_num_rows($query1)>0)
	 {
	 
	   $sql = "INSERT INTO `renenwal_of_dl`(`REN_id`, `dl_no`, `U_id`, `date_of_issue`, `date_of_expiry`, `date_of_last_renewal`, `approval_status`) VALUES ('','$dl_no','$id','$date_issue','$date_expiry','$date_renewal','')";
	 
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
<h1>You have successfully applied for the renewal of Driving License we'll notify you when your request is approved</h1>
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
	 else{ echo "Please apply for the Driving license first";}


?>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>