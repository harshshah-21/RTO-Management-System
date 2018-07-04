<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<?php
   include('conn.php');
   include('index.php');
   
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="menu.css" />
<title></title>

<style>
.table {
	position:absolute;
	z-index:999;
	padding:0px;
	margin-left:20%;
	margin-top:0%;
	 font-family: 'Open Sans', sans-serif;
	 width:77%;
	
}

.table td,th,tr{
	border:1px solid gray;
	padding:5px;
	
}
</style>
</head>
<body>
<div style="margin-left:45%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>User Details</h1></div>

<table class="table" style="border:1px solid gray;overflow-x:scroll;" >
  <tr >
    <th>User No</th>
    <th>First name</th> 
     
    
    <th>Aadhar no.</th>
   
    <th>Contact no.</th>
    
	 <th>LL no</th>
    <th>DL no</th>
    <th>Registration no</th>
    <th>Permit no</th>
    
    
  </tr>
  <?php 
		 $sql1 = "SELECT * FROM `user` WHERE 1";
	   $result1 = mysql_query($sql1);
      while($row1 = mysql_fetch_array($result1))
	  { 
	  $uid = $row1['U_id'];
	    $sql5 = "SELECT * FROM `ll_result` WHERE `U_id` = '$uid'";
	   $result5 = mysql_query($sql5);
	   $row5 = mysql_fetch_array($result5);
	   
	     $sql2 = "SELECT * FROM `dl_result` WHERE `D_id` IN (SELECT `D_id` FROM `driving license` WHERE `U_id` = '$uid')";
	   $result2 = mysql_query($sql2);
	   $row2 = mysql_fetch_array($result2);
	   
	     $sql3 = "SELECT * FROM `reg_motor_result` WHERE `U_id` = '$uid'";
	   $result3 = mysql_query($sql3);
	   $row3 = mysql_fetch_array($result3);
	   
	     $sql4 = "SELECT * FROM `permit_result` WHERE `U_id` = '$uid'";
	   $result4 = mysql_query($sql4);
	   $row4 = mysql_fetch_array($result4);
	  
  ?>
  
  <tr>
  <form method="POST" action="removeAuthority.php">
  <input type="hidden" name="u_id" value="<?php echo $row1['U_id'];?>">
    <td><?php echo $row1['U_id'];?></td>
    <td><?php echo $row1['Name'];?></td>
	 <td><?php echo $row1['Aadharno'];?></td>
    <td><?php echo $row1['Contact'];?></td>
   
     <td><?php echo $row5['LL_no'];?></td>
	
	 <td><?php echo $row2['dl_no'];?></td>
	 <td><?php echo $row3['reg_no'];?></td>
	 <td><?php echo $row4['p_no'];?></td>
   
   </form>
  </tr>
  <?php
	  }
  ?>
</table>

</body>
</html>