<?php
	include "conn.php";
	session_start();
	
	  $id = $_SESSION['userid1'];

	      $aid = $_SESSION['auth_id'];
		 $sql1 = "SELECT * FROM user WHERE U_id = '$id'";
      $result = mysql_query($sql1);
      $row = mysql_fetch_array($result);
     
      $username =  $row['Name'];
      //$count = mysql_num_rows($result);   
		   
			  
		//echo "You are successfully logged in";
         //$_SESSION['contact'] = $contact;
		 
		  if(!isset($_SESSION['auth_id'])){
      header("location:form.php");
   }
       
?>


