<?php
   include('conn.php');
   include('session.php');
   
   
   
	
 //echo	$dl_id = $_POST['dl_id'];
 echo	$p_id = $_POST['p_id'];
 echo	$p_no = $_POST['p_no'];
 echo	$dup_id = $_POST['dup_id'];
 echo	$u_id = $_POST['u_id'];

 
   
	//die();
$sql4 = "DROP TRIGGER IF EXISTS `dup_permit1`;";
	$res4 = mysql_query($sql4);

	$sql7 = "CREATE TRIGGER `dup_permit1` AFTER INSERT ON `duplicate_permit_result` FOR EACH ROW UPDATE `duplicate permit` SET `approval_status`=1 WHERE `DUP_P_id` = $_POST[dup_id]";
      $result7 = mysql_query($sql7);
	
    
    
		
		 $sql9 = "INSERT INTO `duplicate_permit_result`( `DUP_id`, `P_id`, `p_no`, `A_id`) VALUES('$dup_id','$p_id','$p_no','$aid')";
      $result9 = mysql_query($sql9);
	
	if($result9)
	
	{
		header("location:duplicate_permit.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           