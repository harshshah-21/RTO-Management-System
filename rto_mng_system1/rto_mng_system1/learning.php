
<?php
   
     include('header1.php');
?>
<!DOCTYPE html>
<html>
<head>
<title>Learning license</title>

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
<h1>Learning license</h1>
	<div class="contact-form" style="margin-top:-15px;">
	 <div class="learning_license">
	 
     <form method="POST" action="learning_process.php">
	 
	      <input type="text" name="username" class="formelement" value="<?php echo $username;?>"  />
		  
		   <input type="text" name="aadharno" 	class="formelement" placeholder="Enter Aadhar no "  />
		   
		   <input type="text" name="birthplace" class="formelement"	 placeholder="Enter your Birthplace "  />
	
		  
		<select class="formelement" style="width: 106%;" name="type_of_vehicle" >
		  
			  <option value="0">Select Category</option>
			  <option value="1">Two wheeler</option>
			  <option value="2">Three wheeler</option>
			  <option value="3">Light Motor Vehicle</option>
			  <option value="4">Heavy Motor Vehicle</option>
			  
		</select>
		
		  
		 <select class="formelement" style="width: 106%;" name="edu_qual" >
		  
			  <option value="default">Select Educational qual</option>
			  <option value="0">Illetrate</option>
			  <option value="1">10th Pass</option>
			  <option value="2">12th pass</option>
			  <option value="3">Btech/Mtech or equivalent</option>
			  <option value="4">BA/BBA/BSC or equivalent</option>
			  <option value="5">Diploma</option>
			  <option value="6">CA/CS/CFA/ICWA or equivalent</option>
			  <option value="7">MBBS/BHS/BAMS</option>
			  <option value="8">Phd</option>
			  <option value="9">Certificate courses</option>
			  <option value="10">Any other course not specified</option>
			  
			  
		</select>
		  
	     	   <input type="date" name="date" placeholder="Select date" class="formelement" style="width: 100%;" />
		  
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