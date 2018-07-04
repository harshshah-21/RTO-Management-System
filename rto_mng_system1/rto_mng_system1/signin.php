<?php


include("conn.php");
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	 $email = mysql_real_escape_string($_POST["email"]);
	 $contact = mysql_real_escape_string($_POST["contact"]);
	 $address = mysql_real_escape_string($_POST["address"]);
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	 $gender = $_POST["gender"];
	 
	 $sql = "INSERT INTO `user`(`U_id`,`Name`, `email`, `Address`, `Aadharno`, `Gender`, `Contact`) VALUES ('','$username','$email','$address','$aadharno','$gender','$contact')";
	 
	// echo $sql;
	$query = mysql_query($sql);
	 
	if($query)
	{
		?>
		<script type="text/javascript">
     alert('You have been regestered successfully...'); 
  </script>
  <?php
	header("location:form.php");
	}
else
{
?>
<script type="text/javascript">
     alert("there was some error please enter the details again"); 
  </script>
<?php
header("location:signup.php");
}


?>
