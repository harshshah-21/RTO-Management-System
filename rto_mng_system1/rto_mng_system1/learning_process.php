<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 $type_of_vehicle = mysql_real_escape_string($_POST["type_of_vehicle"]);
	 $edu_qual = mysql_real_escape_string($_POST["edu_qual"]);
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $date = $_POST["date"];
	 $birthplace = $_POST["birthplace"];
	 
	$time = date("Y-m-d H:i:s");
	
	 $sql4 = "DROP TRIGGER IF EXISTS `ll_log`;";
	$res4 = mysql_query($sql4);
	
  $sql1 = "CREATE TRIGGER `ll_log` AFTER INSERT ON `learning license` FOR EACH ROW INSERT INTO `ll_log`(`U_id`, `Applied`, `timestamp`) VALUES ($_SESSION[userid],'1','$time')";
      $result1 = mysql_query($sql1);
	  
   
	 
	 $sql = "INSERT INTO `learning license`(`L_id`, `U_id`, `Type_of_vehicle`, `Birthplace`, `Edu_qual`, `date`, `approval_status`) VALUES ('','$id','$type_of_vehicle','$birthplace','$edu_qual','$date','0')";
	
	$query = mysql_query($sql);
	 
	if($query)
	{
	/*	$sql2 = "SELECT `email` FROM `user` WHERE `U_id` = '$id'";
		$query2=mysql_query($sql2);
		$row2 =  mysql_fetch_array($query2);
		$email = $row2['email'];
		$to = "$email"; 
$subject = "Regarding ur request in RTO";
$body = "This is to inform you that your request is successfully submitted you will recieve an email on the approval of your request.";
$header = "From:admin@gmail.com";

if(mail($to,$subject,$body,$header))
{

*/
		?>
		


<html>
<head>
<title>Learning License</title>
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



<?php

}	
else
{
//die();
header("location:learning.php");
}

	//}
?>
</html>