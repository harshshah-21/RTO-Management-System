
<?php
   
     include('header1.php');
?>
<!DOCTYPE html>
<html>
<head>
<title>Status Check</title>

<style>

	.formelement{
		width: 100%;
    padding: 3%;
    margin-bottom: 8%;
    border-radius: 5px;
	  border:none;
    background-color: #3a4147;
    font-size: 15px;color:white
		
	}
	.submitb{
		 width: 105%;
    padding: 10px;
	font-size: 18px;
	font-family: Oswald-Regular;
	margin-bottom: 5px;
    border: none;
    border-radius: 5px;
	color: #000;
	cursor: pointer;
	outline: none;
	}
</style>

<script type="text/javascript">  
function validateForm()  
{
var aadharno=document.myform.aadharno.value;
 if(aadharno.length<12){  
	 {alert("Aadharno must be 12 digits long.");
return false	 }
}  

var vehicle_no=document.myform.vehicle_no.value;
 if(vehicle_no.length<4){  
	 {alert("vehicle_no must be 4 digits long.");
return false	 }
}
  
}
</script> 
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="#" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<div class="container">
<h1>Check Status</h1>
	<div class="contact-form" style="margin-top:-15px;">
	 <div class="learning_license">
	 
     <form method="POST" name="myform" onsubmit="return validateForm()"
 action="status_process.php">
	 
	      <input type="text" name="username" class="formelement" value="<?php echo $username;?>" required />
		  
		   <input type="text" name="aadharno" 	class="formelement" placeholder="Enter Aadhar no "  required/>
		  
          <input type="submit" class="submitb" name="submit"  value="Submit" />

	 </form>
	 </div>
	</div>
</div>
<div class="footer">
     <p>Copyright &copy; 2017 All Rights Reserved </p>
</div>
</body>
</html>