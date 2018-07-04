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


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Duplicate License Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>DL No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Contact no.</th> 
	<th>Gender</th>
    <th>Email</th>
	
	
    <th>Circumstances</th>
    <th>Previously applied</th>
    
   
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `duplicate license` WHERE `approval_status`= 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
	    $dl_no = $row2['dl_no'];
	   $sql5 = "SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `driving license` WHERE `D_id` IN (SELECT `D_id` FROM `dl_result` WHERE `dl_no` = '$dl_no'))";
	   $result5 = mysql_query($sql5);
	   $row5 = mysql_fetch_array($result5);

$sql6 = "SELECT * FROM `dl_result` WHERE `dl_no` = '$dl_no'";
	   $result6 = mysql_query($sql6);
	   $row6 = mysql_fetch_array($result6);
	  
  ?>
  <form method="POST" action="duplicateLicense_approval.php">
  
  <input type="hidden" name = "dup_id" value="<?php echo $row2['DUP_id'];?>">
  <input type="hidden" name = "dl_no" value="<?php echo $row2['dl_no'];?>">
  <input type="hidden" name = "dl_id" value="<?php echo $row6['D_id'];?>">
  <tr>
    <td><?php echo $row2['dl_no'];?></td>
    <td><?php echo $row5['Name'];?></td>
	 <td><?php echo $row5['Aadharno'];?></td>
    <td><?php echo $row5['Contact'];?></td>
	
	 <td><?php
	if($row5['Gender'] == "0")
		{echo "Male";}
	else 
	{echo "Female";}		
		?></td>
		
    <td><?php echo $row5['email'];?></td>
	
	
    <td><?php echo $row2['Circumstances'];?></td>
    
    
    <td><?php
	if($row2['previously_applied'] == "1")
		{echo "Yes";}
	else 
	{echo "No";}		
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