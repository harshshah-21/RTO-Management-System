<?php
   include('conn.php');
   
   
   
   $u_id = $_GET['u_id'];
   
   
     $sql = "INSERT INTO `authority`(`A_id`, `U_id`) VALUES ('','$u_id')";
      $result = mysql_query($sql);
     if($result)
	{
		header("location:addAuthority.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>