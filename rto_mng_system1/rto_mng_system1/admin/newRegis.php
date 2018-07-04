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


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>New Reg Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>DL No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Email</th>
	
	
    <th>Dealers Name</th>
    <th>Type of Vehicle</th>
    <th>Year of Manu</th>
    <th>Engine no.</th>
    <th>Seating Capacity</th>
    <th>Fuel Type</th>
    
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `reg_motor_vehicle` WHERE `approval_status`= 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
		$u_id = $row2['U_id'];
	  $sql4 = "SELECT * FROM `user` WHERE `U_id`= '$u_id'";
	   $result4 = mysql_query($sql4);
	  $row4 = mysql_fetch_array($result4);
	  
	  $sql5 = "SELECT * FROM `dl_result` WHERE `D_id` IN(SELECT `D_id` FROM `driving license` WHERE `U_id` = '$u_id')";
	   $result5 = mysql_query($sql5);
	  $row5 = mysql_fetch_array($result5);
  ?>
  <form method="POST" action="newRegis_approval.php">
  <input type="hidden" name = "reg_id" value="<?php echo $row2['REG_id'];?>">
  <input type="hidden" name = "u_id" value="<?php echo $row4['U_id'];?>">
  <input type="hidden" name = "dl_id" value="<?php echo $row5['D_id'];?>">
  <input type="hidden" name = "dl_no" value="<?php echo $row5['dl_no'];?>">
  <input type="hidden" name = "engine_no" value="<?php echo $row2['Engine_no'];?>">
  
  <tr>
    <td><?php echo $row5['dl_no'];?></td>
    <td><?php echo $row4['Name'];?></td>
	 <td><?php echo $row4['Aadharno'];?></td>
   
		
    <td><?php echo $row4['email'];?></td>
	
	
    <td><?php echo $row2['Dealers_name'];?></td>
    
	
	 <td><?php
	if($row2['Type_of_vehicle'] == "1")
		{echo "Two Wheeler";}
	else if($row2['Type_of_vehicle'] == 2)
	   {echo "Three Wheeler";}
   else if($row2['Type_of_vehicle'] == '3')
	   {echo "Light Motor Vehicle";}	 
   else if($row2['Type_of_vehicle'] == 	4)
	   {echo "Heavy Motor Vehicle";}		
		?></td>
    
    <td><?php echo $row2['date_of_manuf'];?></td>
    <td><?php echo $row2['Engine_no'];?></td>
    <td><?php echo $row2['seating_capacity'];?></td>
	
	
	 <td><?php
	if($row2['fuel_type'] == "0")
		{echo "Petrol";}
	else if($row2['fuel_type'] == 1)
	   {echo "Diesel";}
   else if($row2['fuel_type'] == 2)
	   {echo "CNG";}
   else if($row2['fuel_type'] == '3')
	   {echo "Petrol/Diesel";}	 
   else if($row2['fuel_type'] == 	4)
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