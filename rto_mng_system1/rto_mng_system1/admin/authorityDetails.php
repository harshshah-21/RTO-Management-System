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
	
}

.table td,th,tr{
	border:1px solid gray;
	padding:5px;
	
}
</style>
</head>
<body>
<div style="margin-left:45%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>List of Authorities</h1></div>

<table class="table" style="border:1px solid gray;">
  <tr >
    <th>Authority No</th>
    <th>First name</th> 
    <th>Contact no.</th> 
    <th>Email</th>
    <th>Address</th>
    <th>Aadhar no.</th>
    <th>Gender</th>
    <th></th>
    
  </tr>
  <?php 
		 $sql1 = "SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `authority` WHERE 1)";
	   $result1 = mysql_query($sql1);
      while($row1 = mysql_fetch_array($result1))
	  { 
	  
	  
  ?>
  
  <tr>
  <form method="POST" action="removeAuthority.php">
  <input type="hidden" name="u_id" value="<?php echo $row1['U_id'];?>">
    <td><?php echo $row1['U_id'];?></td>
    <td><?php echo $row1['Name'];?></td>
    <td><?php echo $row1['Contact'];?></td>
    <td><?php echo $row1['email'];?></td>
    <td><?php echo $row1['Address'];?></td>
    <td><?php echo $row1['Aadharno'];?></td>
    <td><?php
	if($row1['Gender'] = '1')
		{echo "Male";}
	else 
	{echo "Female";}		
		?></td>
   
    <td><input type="submit" name="submit" value = "Remove Authority" style="padding:13px;width:100%;font-size:15px;"></td>
   </form>
  </tr>
  <?php
	  }
  ?>
</table>

</body>
</html>