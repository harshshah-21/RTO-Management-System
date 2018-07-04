<?php
   include('conn.php');
   
   
   
  echo $u_id = $_POST['u_id'];
   
  
     $sql = "DELETE FROM `authority` WHERE `U_id` = '$u_id'";
      $result = mysql_query($sql);
     if($result)
	{
		header("location:authorityDetails.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>