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


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Renewal Applicants</h1></div>
<div >

<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>DL No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Contact no.</th> 
	<th>Gender</th>
    <th>Email</th>
	
	
    <th>Date Of issue</th>
    <th>Date Of expiry</th>
    <th>Date Of Last renewal</th>
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `renenwal_of_dl` WHERE `approval_status` = 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
	  
	   $sql1 = "SELECT * FROM `user` WHERE `U_id` = '$row2[U_id]'";
	   $result1 = mysql_query($sql1);
	   $row1 = mysql_fetch_array($result1); //in row1 info of user table
	  
  ?>
  <form method="POST" action="renewal_approval.php">
 
  <input type="hidden" name = "dl_no" value="<?php echo $row2['dl_no'];?>">
  <input type="hidden" name = "ren_id" value="<?php echo $row2['REN_id'];?>">
  <tr>
    <td><?php echo $row2['dl_no'];?></td>
    <td><?php echo $row1['Name'];?></td>
	 <td><?php echo $row1['Aadharno'];?></td>
    <td><?php echo $row1['Contact'];?></td>
	
	 <td><?php
	if($row1['Gender'] == "1")
		{echo "Male";}
	else 
	{echo "Female";}		
		?></td>
		
    <td><?php echo $row1['email'];?></td>
	
	
    <td><?php echo $row2['date_of_issue'];?></td>
    <td><?php echo $row2['date_of_expiry'];?></td>
    <td><?php echo $row2['date_of_last_renewal'];?></td>
    
   
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