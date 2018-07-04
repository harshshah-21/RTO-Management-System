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
	position:fixed;
	z-index:999;
	padding:0px;
	margin-left:20%;
	margin-top:0%;
	 font-family: 'Open Sans', sans-serif;
	 width:77%;
	 height:auto;
	 overflow-y:scroll;
	
}

.table td,th,tr{
	border:1px solid gray;
	padding:5px;
	
}
</style>
</head>
<body >


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Permit Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>Permit No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Email</th>
	
    <th>Type of Permit</th>
    <th>Registration No.</th>
    <th>Engine no.</th>
    <th>Fuel Type</th>
    
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `permit` WHERE `approval_status`= 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
		$u_id = $row2['U_id'];
		$reg_id = $row2['REG_id'];
		$p_id = $row2['P_id'];
		$reg_no = $row2['reg_no'];
		
	  $sql4 = "SELECT * FROM `permit_result` WHERE `P_id`= '$p_id'";
	   $result4 = mysql_query($sql4);
	  $row4 = mysql_fetch_array($result4);
	  
	   $sql3 = "SELECT * FROM `user` WHERE `U_id`= '$u_id'";
	   $result3 = mysql_query($sql3);
	  $row3 = mysql_fetch_array($result3);
	  
	  $sql5 = "SELECT * FROM `reg_motor_result` WHERE `reg_no` = '$reg_no'";
	   $result5 = mysql_query($sql5);
	  $row5 = mysql_fetch_array($result5);
	  
  $sql7 = "SELECT * FROM `reg_motor_vehicle` WHERE `REG_id` = '$reg_id'";
	   $result7 = mysql_query($sql7);
	  $row7 = mysql_fetch_array($result7);
  ?>
  <form method="POST" action="vehicle_permit_approval.php">
  <input type="hidden" name = "reg_id" value="<?php echo $row5['REG_id'];?>">
  <input type="hidden" name = "reg_no" value="<?php echo $reg_no;?>">
  <input type="hidden" name = "u_id" value="<?php echo $row2['U_id'];?>">
  <input type="hidden" name = "p_id" value="<?php echo $row2['P_id'];?>">
  
  <input type="hidden" name = "engine_no" value="<?php echo $row5['Engine_no'];?>">
  
  <tr>
    
    <td><?php echo $row2['P_id'];?></td>
    <td><?php echo $row3['Name'];?></td>
	 <td><?php echo $row3['Aadharno'];?></td>
   
		
    <td><?php echo $row3['email'];?></td>
	
	
    
   
	
	 <td><?php
	if($row2['type_of_permit'] == "0")
		{echo "Cab";}
	else if($row2['type_of_permit'] == 1)
	   {echo "Taxi";}
   else if($row2['type_of_permit'] == 2)
	   {echo "Private passenger service";}
   else if($row2['type_of_permit'] == '3')
	   {echo "School bus";}	 
   else if($row2['type_of_permit'] == 	4)
	   {echo "Goods vehicle";}
   else if($row2['type_of_permit'] == 	5)
	   {echo "National goods";}	
	else
	   {echo "Other type";}		
	?></td>
	
     <td><?php echo $reg_no;?></td>
    
    <td><?php echo $row5['Engine_no'];?></td>
	
	
	 <td><?php
	if($row7['fuel_type'] == "0")
		{echo "Petrol";}
	else if($row7['fuel_type'] == 1)
	   {echo "Diesel";}
   else if($row7['fuel_type'] == 2)
	   {echo "CNG";}
   else if($row7['fuel_type'] == '3')
	   {echo "Petrol/Diesel";}	 
   else if($row7['fuel_type'] == 	4)
	   {echo "Petrol/CNG";}	
else{
		echo "Other fuel_type";
}   
		?></td>
	
    <td><input type="submit" name="submit" value = "Approve" style="padding:13px;width:100%;font-size:15px;"></td>
   </form>
  </tr>
  <?php
	  }
  ?>
</table>
</div>
</body>
</html> 	