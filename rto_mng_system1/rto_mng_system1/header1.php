<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<?php
   include('session.php');
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="menu.css" />
<title></title>
</head>
<body style="z-index:999;">
<div class="drop">
<ul class="drop_menu" style="transparency:none;">
<li><a href=''>Home</a>
<li><a href=''>About us</a>
	
</li>
<li><a href='license.php'>License</a>
	<ul>
	<li><a href='learning.php'>Learning License</a></li>
	<li><a href='driving.php'>Driving License</a></li>
	<li><a href='renewal_of_dl.php'>Renewal of Learning license</a></li>
	<li><a href='duplicate.php'>Obtain Duplicate</a></li>
	</ul>
</li>
<li><a href='rmv.php'>Vehicle Registration</a>
	<ul>
	<li><a href='reg_motor_vehicle.php'>New Registration</a></li>
	<li><a href='duplicate_reg.php'>Apply for Duplicate</a></li>
	<li><a href='transfer.php'>Transfer of Ownership</a></li>
	
	</ul>
</li>


<li><a href='permit.php'>Permit</a>
	<ul>
	<li><a href='vehicle_permit.php'>New Permit</a></li>
	<li><a href='duplicate_permit.php'>Apply for Duplicate </a></li>
	</ul>
</li>
<li><a href='status.php'>Check Status</a>
<li><a href='#'>Contact us</a>

<li style="float:right;"><a href='logout.php' >Signout</a>
</li>
</ul>
</div>
</body>
</html>