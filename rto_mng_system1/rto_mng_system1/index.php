<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<?php
	session_start();
  if(isset($_SESSION['userid'])) 
 {
       header("location: welcome.php");
		die();			 
	 }
?>
<!DOCTYPE html>
<html>
<head>
<title>Cosmo Login Form A Flat Responsive widget Template :: w3layouts</title>
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Cosmo Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<div class="container">
<h1>User Login</h1>

	<div class="contact-form">
	 <div class="signin">
	 
     <form method="POST" action="login.php">
	      <input type="text" name="username" class="user" value="Enter Here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Here';}" />
		  
	      <input type="password" name="password" class="pass" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" />
		  
          <input type="submit" name="submit" value="LOGIN" />
          <p>Not a member? <a href="#">Signup now >></a> </p>
	 </form>
	 </div>
	 
	 
	</div>
</div>
<div class="footer">
   <!--  <p>Copyright &copy; 2015 Cosmo Login Form. All Rights Reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>-->
</div>
</body>
</html>