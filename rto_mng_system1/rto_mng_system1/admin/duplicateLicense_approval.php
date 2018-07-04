<?php
   include('conn.php');
   include('session.php');
   
   
   
	echo $dup_id = $_POST['dup_id'];
 echo	$dl_id = $_POST['dl_id'];
 echo	$dl_no = $_POST['dl_no'];
   
// die();

$sql4 = "DROP TRIGGER IF EXISTS `dup_license1`;";
	$res4 = mysql_query($sql4);
	
  $sql1 = "CREATE TRIGGER `dup_license1` AFTER INSERT ON `duplicatelicense_result` FOR EACH ROW UPDATE `duplicate license` SET `approval_status`= 1 WHERE `DUP_id` = $_POST[dup_id]";
      $result1 = mysql_query($sql1);
	  
   echo  $sql3 = "INSERT INTO `duplicatelicense_result`(`DUP_id`, `D_id`,`dl_no`, `A_id`) VALUES ('$dup_id','$dl_id','$dl_no','$aid')";
      $result3 = mysql_query($sql3);
     if($result3)
	{
		
		header("location:duplicateLicense.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>