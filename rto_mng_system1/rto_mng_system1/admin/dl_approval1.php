<?php
   include('conn.php');
   include('session.php');
   
   
   
echo	$dl_id = $_POST['dl_id'];
echo	$result = $_POST['result'];
 echo  $dl_no = uniqid("DL");
//die();
   
     
     
	/*	$sql1 = "CREATE TRIGGER `testTrigger` AFTER INSERT ON `dl_result`
		FOR EACH ROW
						BEGIN
						IF EXISTS (SELECT * FROM dl_result WHERE `D_id`=$_GET[dl_id] LIMIT 1)
						 UPDATE `driving license` SET `approval_status`= 1 WHERE `D_id` = $_GET['dl_id'];
							END IF;
							END"
*/

	$sql4 = "DROP TRIGGER IF EXISTS `testTrigger`;";
	$res4 = mysql_query($sql4);
	
  $sql1 = "CREATE TRIGGER `testTrigger` AFTER INSERT ON `dl_result` FOR EACH ROW 
  UPDATE `driving license` SET `approval_status`= '1' WHERE `D_id` = $_POST[dl_id]";
		
     $result1 = mysql_query($sql1);
	 
	echo $sql7 = "INSERT INTO `dl_result`(`D_id`, `dl_no`, `A_id`, `result`, `pre_appl`) VALUES ('$dl_id','$dl_no','$aid','$result','0')";
 //  die();
      $result7 = mysql_query($sql7);
	  
	  if($result7)
		  
		  {header("location:drivingLicense.php");}
		  else{ echo"Server Error";}
		
	
?>