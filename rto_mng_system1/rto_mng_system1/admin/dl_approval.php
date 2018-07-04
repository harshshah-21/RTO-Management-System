<?php
   include('conn.php');
   include('session.php');
   
   
   
echo	$dl_id = $_POST['dl_id'];
echo	$result = $_POST['result'];
 echo  $dl_no = uniqid("DL");
// die();
   
   echo  $sql9 = "INSERT INTO `dl_result`(`D_id`, `dl_no`, `A_id`, `result`, `pre_appl`) VALUES ('$dl_id','$dl_no','$aid','$result','0')";
   //die();
      $result9 = mysql_query($sql9);
     if($result9)
	{
		$sql1 = "UPDATE `driving license` SET `approval_status`= 1 WHERE `D_id` = '$dl_id'";
      $result1 = mysql_query($sql1);
		header("location:drivingLicense.php");
	}
	else
	{
		echo "Server Error";
	}
     
?>