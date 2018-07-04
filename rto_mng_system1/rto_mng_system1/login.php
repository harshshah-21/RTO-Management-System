<?php
 
   include("conn.php");
  session_start();
   
 //  echo $_POST['contact'];
 // echo $_POST['password'];
  
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      
     
      $username = mysql_real_escape_string($_POST['username']);
      $password = mysql_real_escape_string($_POST['password']); 
      
      $sql = "SELECT * FROM user WHERE Name = '$username' and Aadharno = '$password'";
      $result = mysql_query($sql);
      $row = mysql_fetch_array($result);
     
      
      $count = mysql_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		 
      if($count == 1) {
		 // echo "123";
		       $_SESSION['userid']=$row['U_id'];
	    //  $_SESSION['username']=$row['Name'];
		   
		   
			   

       		 // echo $_SESSION['username'];
		//echo "You are successfully logged in";
         //$_SESSION['contact'] = $contact;
       // die();
	 
        header("location:license.php");
      }else {
        echo $error = "Your Login Name or Password is invalid";
      }
   }
?>