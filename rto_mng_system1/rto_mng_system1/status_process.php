<?php


include("conn.php");

  include('header1.php');
 
	
	 $username = mysql_real_escape_string($_POST["username"]);
	
	 $aadharno = mysql_real_escape_string($_POST["aadharno"]);
	
	 $sql1="SELECT * FROM `user` WHERE `Aadharno` = '$aadharno'";
	 $query1=mysql_query($sql1);
	
	 if(mysql_num_rows($query1)>0)
	 {
	  $sql = "SELECT * FROM `user` WHERE `Aadharno` = '$aadharno'";
	 
	// echo $sql;
	$query = mysql_query($sql);
	 
	if($query)
	{	$row=mysql_fetch_assoc($query);
		$uid = $row['U_id'];
		?>
		

<!DOCTYPE html>
<html>
<head>
<title>RTO</title>
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="#" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />



<style>
.table {
	position:absolute;
	z-index:0;
	padding:0px;
	margin-left:10%;
	margin-top:0%;
	 font-family: 'Open Sans', sans-serif;
	 width:77%;
	 height:auto
	
}

.table td,th,tr{
	border:1px solid white;
	padding:5px;
	
}
.status{margin-top:12%;}
body{color:white;}
</style>
</head>
<body>
<div class="container">
<table class="table" style="border:1px solid gray;overflow-x:scroll;!important">
  <tr >
    <th>First name</th> 
	<th>Aadhar no.</th>  
    <th>LL no</th>

    <th>DL no</th>
    <th>Registration no</th>
    <th>Permit no</th>
      
  </tr>
  <?php 
		
	   $sql1 = "SELECT * FROM `ll_result` WHERE `U_id` = '$uid'";
	   $result1 = mysql_query($sql1);
	   $row1 = mysql_fetch_array($result1);
	   
	   
	   if(!$result1){$_SESSION['abc'] = '1';}
	     $sql2 = "SELECT * FROM `dl_result` WHERE `D_id` = (SELECT `D_id` FROM `driving license` WHERE `U_id` = '$uid')";
	   $result2 = mysql_query($sql2);
	   $row2 = mysql_fetch_array($result2);
	    if(!$result2){$_SESSION['abc'] = '2';}
	     $sql3 = "SELECT * FROM `reg_motor_result` WHERE `U_id` = '$uid'";
	   $result3 = mysql_query($sql3);
	   $row3 = mysql_fetch_array($result3);
	    if(!$result3){$_SESSION['abc'] = '3';}
	     $sql4 = "SELECT * FROM `permit_result` WHERE `U_id` = '$uid'";
	   $result4 = mysql_query($sql4);
	   $row4 = mysql_fetch_array($result4);
	  if($result4){$_SESSION['abc'] = '4';}
  ?>
 
  <tr>
   
     <td><?php echo $row['Name'];?></td>
	 <td><?php echo $row['Aadharno'];?></td>
	 <td><?php echo $row1['LL_no'];?></td>
	
	 <td><?php echo $row2['dl_no'];?></td>
	 <td><?php echo $row3['reg_no'];?></td>
	 <td><?php echo $row4['p_no'];?></td>
    
  </tr>
  
</table>
	
</div>

<div class="container">
<h1 class="status">

<?php

if($_SESSION['abc'] == 1)
{
	echo "You have not applied for Learning License";
}

else if($_SESSION['abc'] == 2)
{
	echo "You have not applied for Driving License";
}

else if($_SESSION['abc'] == 3)
{
	echo "You have not applied for Registration";
}
else{ echo "You have not applied for Permit";}
?>
</h1>

	
</div>

<?php

	}
else
{
	?>
	<div class="container">
<h1>


</h1>

	
</div>
<?php


//header("location:welcome.php");
}
	 }
	 else{ ?>
	 
	 
	 <div class="container">
<h1>An error has occured Please Enter correct aadharno</h1>
<a href="status.php" ><h2 style="margin-left:40%;text-decoration:none;color:#ef4c89">Go back</h2></a>
	
</div>
	 
	 
	 
	 <?php
	}

?>
<div class="footer">
   <!--  <p>Copyright &copy; 2017 Cosmo Login Form. All Rights Reserved </p>-->
</div>
</body>
</html>