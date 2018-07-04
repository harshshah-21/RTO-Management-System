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
<body>


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Transfer of ownership</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>Transfer no.</th>
    <th>Sellers name</th> 
	<th>Aadhar no.</th>
    <th>Email</th>
	<th>Sellers name</th> 
	<th>Aadhar no.</th>
  
    <th>Registration no.</th>
	
	
	
    
    
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `transfer of ownership` WHERE `approval_status`= 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
		$s_id = $row2['S_U_id'];
		$r_id = $row2['R_U_id'];
	  $sql4 = "SELECT * FROM `user` WHERE `U_id`= '$s_id'";
	   $result4 = mysql_query($sql4);
	  $row4 = mysql_fetch_array($result4);
	  
	  $sql6 = "SELECT * FROM `user` WHERE `U_id`= '$r_id'";
	   $result6 = mysql_query($sql6);
	  $row6 = mysql_fetch_array($result6);
	  
	  $t_id = $row2['T_id'];
	   $sql5 = "SELECT * FROM `reg_motor_result` WHERE `REG_id` = (SELECT `REG_id` FROM `transfer of ownership` WHERE `T_id` = '$t_id')";
	   $result5 = mysql_query($sql5);
	  $row5= mysql_fetch_array($result5);
	  
  ?>
  <form method="POST" action="transfer_approval.php">
  <input type="hidden" name = "reg_id" value="<?php echo $row5['REG_id'];?>">
  <input type="hidden" name = "t_id" value="<?php echo $row2['T_id'];?>">
  <input type="hidden" name = "s_id" value="<?php echo $row4['U_id'];?>">
  <input type="hidden" name = "r_id" value="<?php echo $row6['U_id'];?>">
  <input type="hidden" name = "reg_no" value="<?php echo $row5['reg_no'];?>">
  
  <tr>
    <td><?php echo $row2['T_id'];?></td>
    <td><?php echo $row4['Name'];?></td>
	 <td><?php echo $row4['Aadharno'];?></td>
	 <td><?php echo $row4['email'];?></td>
	 
	 <td><?php echo $row6['Name'];?></td>
	 <td><?php echo $row6['Aadharno'];?></td>
	
  <td><?php echo $row5['reg_no'];?></td>
    
	
	
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