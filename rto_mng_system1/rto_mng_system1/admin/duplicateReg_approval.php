<?php
   include('conn.php');
   include('session.php');
   
   
   
   echo $dupreg_id = $_POST['dupreg_id'];
 echo	$reg_no = $_POST['reg_no'];
 echo	$reg_id = $_POST['reg_id'];
 
   
//	die();

$sql2 = "SELECT * FROM `reg_motor_vehicle` WHERE `REG_id` = '$reg_id'";
	   $result2 = mysql_query($sql2);
   $row2 = mysql_fetch_array($result2);
  	$engine_no = $row2['Engine_no'];
	
	$sql6 = "DROP TRIGGER IF EXISTS `dup_reg_trigger`;";
	$res6 = mysql_query($sql6);
	
	
	$sql5 = "CREATE TRIGGER `dup_reg_trigger` AFTER INSERT ON `duplicate_reg_result` FOR EACH ROW  UPDATE `duplicate reg certificate` SET `approval_status`= 1 WHERE `DUP_REG_id` = $_POST[dupreg_id]";
      $result5 = mysql_query($sql5);
	
     $sql4 = "INSERT INTO `duplicate_reg_result`(`DUP_REG_id`, `REG_id`, `reg_no`, `Engine_no`, `A_id`) VALUES('$dupreg_id','$reg_id','$reg_no','$engine_no','$aid')";
      $result4 = mysql_query($sql4);
     if($result4)
	{
		
		header("location:duplicate_reg.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>