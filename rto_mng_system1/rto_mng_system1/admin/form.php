
<?php
	session_start();
  if(isset($_SESSION['auth_id'])) 
 {
       header("location: welcome.php");
		die();			 
	 }
?>
<!DOCTYPE html>
<html>
<head>
<title>LOGIN</title>
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="#" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />



<script type="text/javascript">  
function validateForm()  
{
var password=document.myform.password.value;
 if(password.length<12){  
	 {alert("password must be 12 characters long.");
return false	 }
}  
  
}
</script> 




</head>
<body>
<div class="container">
<h1>Admin Login</h1>
	<div class="contact-form">
	 <div class="signin">
     <form method="POST" name="myform" action="login.php" onsubmit="return validateForm()">
	      <input type="text" name="username" class="user" placeholder="Enter Name Here"  />
	      <input type="password" name="password" class="pass" placeholder="Password"  />
          <input type="submit" name="submit" value="LOGIN" />
          
	 </form>
	 </div>
	</div>
</div>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>