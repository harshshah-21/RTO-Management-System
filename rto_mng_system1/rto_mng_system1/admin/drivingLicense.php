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


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Driving License Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-y:scroll;!important">
  <tr >
    <th>LL No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Contact no.</th> 
	<th>Gender</th>
    <th>Email</th>
	
	
    <th>Date Of Test</th>
    <th>Vehicle No.</th>
    <th>Result</th>
   
   
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `driving license` WHERE `approval_status` = 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2)) //in row2 info of dl table
	  { 
	  
	   $sql1 = "SELECT * FROM `user` WHERE `U_id` = '$row2[U_id]'";
	   $result1 = mysql_query($sql1);
	   $row1 = mysql_fetch_array($result1); //in row1 info of user table
	  $dl_id = $row2['D_id'];
  ?>
  <form method="POST" action="dl_approval1.php">
  <input type="hidden" name = "dl_id" value="<?php echo $row2['D_id'];?>">
  <tr>
    <td><?php echo $row2['ll_no'];?></td>
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
	
    
	
	 <td><?php echo $row2['Date_of_test'];?></td>	
	
	
    <td><?php echo $row2['vehicle_no'];?></td>
  
	
	 <td><input type="radio" name="result" value="0"/>P
	 <input type="radio" name="result" value="1"/>F</td>
	
	
   
   
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