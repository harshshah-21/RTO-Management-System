

<?php
   include('conn.php');
   include('session.php');
   
	$ll_id = $_POST['ll_id'];

 $ll_no = uniqid("LL");

	 $u_id = $_POST['u_id'];
	
 // die();
   $sql4 = "DROP TRIGGER IF EXISTS `ll_trigger`;";
	$res4 = mysql_query($sql4);
	
     $sql = "CREATE TRIGGER `ll_trigger` AFTER INSERT ON `ll_result` FOR EACH ROW UPDATE `learning license` SET `approval_status`= 1 WHERE `L_id` = $_POST[ll_id]";
      $result = mysql_query($sql);
     if($result)
	{
		$sql1 = "INSERT INTO `ll_result`(`L_id`, `U_id`, `LL_no`, `A_id`) VALUES ('$ll_id','$u_id','$ll_no','$aid')";
		$result1=mysql_query($sql1);
		if($result1)
		{
			header("location:learning_license.php");
		}
		else
		{
			echo "Server Error";
		}
	}
	else
	{
		echo "Server Error";
	}
     
?>