 <!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <link rel="stylesheet" href="bootstrap.min.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>RTO Management System</title>
   
   <style>
		body{overflow-x:scroll;}
   </style>
</head>
<body>

<div id='cssmenu' style="border-right:1px solid gray;z-index:0;float:left;">
<ul>
   <li class="active"><a  href=''><span><h2>Rto Management System</h2></span></a></li>
   <li class="active"><a  href='home1.php'><span>Home</span></a></li>
   
   <li class="active"><a  href='addAuthority.php'><span>Add Authority</span></a></li>
   
   <li class='has-sub'><a href=''><span>License</span></a>
      <ul>
       <li><a href='learning_license.php'>Learning License</a></li>
	<li><a href='drivingLicense.php'>Driving License</a></li>
	<li><a href='licenseRenewal.php'>Renewal of Learning license</a></li>
	<li><a href='duplicateLicense.php'>Obtain Duplicate</a></li>
      </ul>
   </li>
   
     <li  class='has-sub'><a href=''><span>Registration of vehicle</span></a>
		<ul>
       <li><a href='newRegis.php'>New Registration</a></li>
	<li><a href='duplicate_reg.php'>Applied for Duplicate</a></li>
	<li><a href='transfer.php'>Transfer of Ownership</a></li>
	
        
      </ul>
	 </li>
	 
	 <li  class='has-sub'><a href='#'><span>Permit</span></a>
	<ul>
	<li><a href='vehicle_permit.php'>New Permit</a></li>
	<li><a href='duplicate_permit.php'>Apply for Duplicate </a></li>
	</ul>
</li>
		 
   <li class="active"><a href='authorityDetails.php'><span>Authority Details</span></a></li>
   <li class="active"><a href='userDetails.php'><span>User Details</span></a></li>
   <li class="active"><a href='logout.php'><span>Sign Out</span></a></li>
   
</ul>


</div>

</body>
<html>
