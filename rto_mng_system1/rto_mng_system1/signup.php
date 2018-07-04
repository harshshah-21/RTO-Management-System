
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
<title>SignUp</title>
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
	 var x=document.myform.email.value;  
	var atposition=x.indexOf("@");  
	var dotposition=x.lastIndexOf(".");

	 if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
		alert("Please enter a valid e-mail address");  
		return false;
  }
  
	var aadharno=document.myform.aadharno.value;
	if(aadharno.length<12){  
		alert("Aadharno. must be at least 12 characters long.");  
		return false;  
  } 
  
	var contact=document.myform.contact.value;
		if(contact.length<10){  
			{alert("Contact must be at least 10 characters long.");
			return false	 }
}  
  
}
</script> 
</head>
<body>
<div class="container">
<h1>User Sign Up</h1>
	<div class="contact-form" style="margin-top:-20px;">
	 <div class="signin">
     <form method="POST" name="myform" action="signin.php" onsubmit="return validateForm()">
	      <input type="text" name="username" id="username" class="user" placeholder="Enter Name "  required />
		   
		  <input type="text" name="email" id="email" class="user" placeholder="Enter Email " required />
		  
		  <input type="text" name="contact" id="contact" class="user" placeholder="Enter Contact "   required />
		  
		  <p style="color:white,font-size:14px;margin-top:-9px;float:left;">
		  
		  <input type="radio" name="gender" id="gender"  class="user" value="0"  />Male
		  <input type="radio" name="gender" id="gender"  class="user" value="1"  />Female
		  
		  </p>
		  
		  <input type="text" name="address"id="address" class="user" placeholder="Enter Address "  required/>
		  
	      <input type="text" name="aadharno"id="aadharno" placeholder="Enter Aadhar no" required />
		  
          <input type="submit" name="submit"  placeholder="Sign Up" />

	 </form>
	 </div>
	</div>
</div>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>