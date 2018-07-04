<?php
   include('conn.php');
   include('session.php');
   
   
   
	echo $ren_id = $_POST['ren_id'];
	$dl_no = $_POST['dl_no'];
	
$sql9 = "SELECT * FROM `dl_result` WHERE `dl_no` = '$dl_no'";
	   $result9 = mysql_query($sql9);
	   $row9 = mysql_fetch_array($result9);
	   
	$dl_id = $row9['D_id'];
   
// die();
  $sql4 = "DROP TRIGGER IF EXISTS `ren_dl_trigger`;";
	$res4 = mysql_query($sql4);
	
  $sql1 = "CREATE TRIGGER `ren_dl_trigger` AFTER INSERT ON `renewal_dl_result` FOR EACH ROW  UPDATE `renenwal_of_dl` SET `approval_status` = 1  WHERE `REN_id` = '$ren_id'";
      $result1 = mysql_query($sql1);
	  
     $sql = "INSERT INTO `renewal_dl_result`(`REN_id`, `D_id`,`dl_no`, `A_id`) VALUES ('$ren_id','$dl_id','$dl_no','$aid')";
      $result = mysql_query($sql);
     if($result)
	{
		
		header("location:licenseRenewal.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>