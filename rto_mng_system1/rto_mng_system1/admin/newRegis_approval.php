<?php
   include('conn.php');
   include('session.php');
   
    $reg_no = uniqid("RG");
   
	echo $reg_id = $_POST['reg_id'];
 echo	$dl_id = $_POST['dl_id'];
 echo	$dl_no = $_POST['dl_no'];
 echo	$u_id = $_POST['u_id'];
 echo	$engine_no = $_POST['engine_no'];
   
// die();
$sql4 = "DROP TRIGGER IF EXISTS `reg_trigger`;";
	$res4 = mysql_query($sql4);
	
  $sql1 = "CREATE TRIGGER `reg_trigger` AFTER INSERT ON `reg_motor_result` FOR EACH ROW  UPDATE `reg_motor_vehicle` SET `approval_status`= 1 WHERE `REG_id` = $_POST[reg_id]";
      $result1 = mysql_query($sql1);
	  
     $sql = "INSERT INTO `reg_motor_result`(`REG_id`, `reg_no`, `dl_no`, `U_id`, `Engine_no`, `A_id`)  VALUES ('$reg_id','$reg_no','$dl_no','$u_id','$engine_no','$aid')";
      $result = mysql_query($sql);
     if($result)
	{
		
		header("location:newRegis.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>