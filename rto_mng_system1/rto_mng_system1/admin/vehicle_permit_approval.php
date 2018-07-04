<?php
   include('conn.php');
   include('session.php');
   
   
   
	
 //echo	$dl_id = $_POST['dl_id'];
 echo	$p_id = $_POST['p_id'];
 echo	$p_no = uniqid("PR");
 echo	$u_id = $_POST['u_id'];
 echo	$reg_id = $_POST['reg_id'];
 echo	$engine_no = $_POST['engine_no'];
 
   
//	die();


	$sql9 = "SELECT * FROM `reg_motor_result` WHERE `REG_id` = '$reg_id'";
	   $result9 = mysql_query($sql9);
	   $row9 = mysql_fetch_array($result9);
	
	echo $reg_no = $row9['reg_no'];
	//die();
	
	$sql4 = "DROP TRIGGER IF EXISTS `new_per_trigger`;";
	$res4 = mysql_query($sql4);
	$sql5 = "CREATE TRIGGER `new_per_trigger` AFTER INSERT ON `permit_result` FOR EACH ROW  UPDATE `permit` SET `approval_status`=1 WHERE `P_id` = '$p_id'";
      $result5 = mysql_query($sql5);
	  
     $sql4 = "INSERT INTO `permit_result`(`P_id`, `U_id`, `reg_no`, `Engine_no`, `p_no`, `A_id`) VALUES('$p_id','$u_id','$reg_no','$engine_no','$p_no','$aid')";
      $result4 = mysql_query($sql4);
     if($result4)
	{
		
		header("location:vehicle_permit.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           