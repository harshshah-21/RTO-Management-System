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


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Duplicate Permit Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>Permit No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Email</th>
	
    <th>Type of Permit</th>
    <th>Circumstances</th>
    
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `duplicate permit` WHERE `approval_status`= 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
	    
		
	   
	  $p_id = $row2['P_id'];
	   $sql6 = "SELECT * FROM `permit` WHERE `P_id` = $p_id";
	   $result6 = mysql_query($sql6);
	  $row6 = mysql_fetch_array($result6);
	   $sql7 = "SELECT * FROM `permit_result` WHERE `P_id` = $p_id";
	   $result7 = mysql_query($sql7);
	  $row7 = mysql_fetch_array($result7);
	  
	  $u_id = $row6['U_id'];
	  $sql5 = "SELECT * FROM `user` WHERE `U_id` = $u_id";
	   $result5 = mysql_query($sql5);
	  $row5 = mysql_fetch_array($result5);
	  
	 
  ?>
  <form method="POST" action="duplicate_permit_approval.php">

  <input type="hidden" name = "u_id" value="<?php echo $row5['U_id'];?>">
  <input type="hidden" name = "p_id" value="<?php echo $row2['P_id'];?>">
  <input type="hidden" name = "p_no" value="<?php echo $row7['p_no'];?>">
  <input type="hidden" name = "dup_id" value="<?php echo $row2['DUP_P_id'];?>">

  
  <tr>
    
    <td><?php echo $row7['p_no'];?></td>
    <td><?php echo $row5['Name'];?></td>
	 <td><?php echo $row5['Aadharno'];?></td>
   
		
    <td><?php echo $row5['email'];?></td>
	 <td><?php
	if($row6['type_of_permit'] == "0")
		{echo "Cab";}
	else if($row6['type_of_permit'] == 1)
	   {echo "Taxi";}
   else if($row6['type_of_permit'] == 2)
	   {echo "Private passenger service";}
   else if($row6['type_of_permit'] == '3')
	   {echo "School bus";}	 
   else if($row6['type_of_permit'] == 	4)
	   {echo "Goods vehicle";}
   else if($row6['type_of_permit'] == 	5)
	   {echo "National goods";}	
	else
	   {echo "Other type";}		
	?></td>
    <td><?php echo $row2['Circumstances'];?></td>
	
	
    
   
	
	
	
    
	
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