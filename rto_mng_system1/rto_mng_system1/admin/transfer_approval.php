<?php
   include('conn.php');
   include('session.php');
   
   
   
	
 echo	$t_id = $_POST['t_id'];
 echo	$s_id = $_POST['s_id'];
 echo	$r_id = $_POST['r_id'];
 echo	$reg_id = $_POST['reg_id'];
 echo	$reg_no = $_POST['reg_no'];
 
   
//	die();

	$sql8 = "DROP TRIGGER IF EXISTS `transfer_trigger`;";
	$res8 = mysql_query($sql8);
	
	$sql5 = "CREATE TRIGGER `transfer_trigger` AFTER INSERT ON `permit_result` FOR EACH ROW UPDATE `transfer of ownership` SET `approval_status`= 1 WHERE `T_id` =  $_POST[t_id]";
      $result5 = mysql_query($sql5);
	  
     $sql3 = "INSERT INTO `transfer_process`(`T_id`, `REG_id`, `A_id`) VALUES('$t_id','$reg_id','$aid')";
      $result3 = mysql_query($sql3);
     if($result3)
	{
		
		header("location:transfer.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>