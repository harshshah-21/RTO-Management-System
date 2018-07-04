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
	 height:auto
	
}

.table td,th,tr{
	border:1px solid gray;
	padding:5px;
	
}
</style>
<script type="text/javascript">
  var rtn = 'LL';
function id3() 
	{
		alert("1234");
	var ALPHABET = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

var ID_LENGTH = 8;
 
  for (var i = 0; i < ID_LENGTH; i++) {
    rtn += ALPHABET.charAt(Math.floor(Math.random() * ALPHABET.length));
  }
document.getElementById("ll_no").value = rtn;
 alert(rtn);
 <?php $ll_no =  rtn;?>
 return rtn;
 

}

</script>


</head>
<body >


<div style="margin-left:48%;margin-top:%;font-family: 'Open Sans', sans-serif;color:gray"><h1>Learning License Applicants</h1></div>
<div >
<table class="table" style="border:1px solid gray;overflow-x:scroll;!important">
  <tr >
    <th>LL No</th>
    <th>First name</th> 
	<th>Aadhar no.</th>
    <th>Contact no.</th> 
	<th>Gender</th>
    <th>Email</th>
	
    <th>Type Of vehicle</th>
    <th>BirthPlace</th>
    <th>Educ Qual</th>
    <th>Date</th>
    <th></th>
    
    
  </tr>
  <?php 
		
	   
	   $sql2 = "SELECT * FROM `learning license` WHERE `approval_status` = 0";
	   $result2 = mysql_query($sql2);
      while($row2 = mysql_fetch_array($result2))
	  { 
	  
	   $sql1 = "SELECT * FROM `user` WHERE `U_id` = '$row2[U_id]'";
	   $result1 = mysql_query($sql1);
	   $row1 = mysql_fetch_array($result1);
	  
	  
	//  $url = 'll_approval.php';

//	$.get($url, {ll_no:id3()});
  ?>
  <form method="POST" name="myform"  action="ll_approval.php">
  
  <input type="hidden" name = "ll_id" value="<?php echo $row2['L_id'];?>">
  <input type="hidden" name = "u_id" value="<?php echo $row1['U_id'];?>">
  <input type="hidden" name = "ll_no" id="ll_no" value="<?php uniqid(); ?>">
 
  <tr>
    <td><?php echo $row2['L_id'];?></td>
    <td><?php echo $row1['Name'];?></td>
	 <td><?php echo $row1['Aadharno'];?></td>
    <td><?php echo $row1['Contact'];?></td>
	
	 <td><?php
	if($row1['Gender'] == "0")
		{echo "Male";}
	else 
	{echo "Female";}		
		?></td>
		
    <td><?php echo $row1['email'];?></td>
	
    
	
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
	
	
	
    <td><?php echo $row2['Birthplace'];?></td>
  
	
	 <td><?php
	if($row2['Edu_qual'] == "0")
		{echo "Illetrate";}
	
   else if($row2['Edu_qual'] == "2")
	   {echo "12th pass";}	 
   else if($row2['Edu_qual'] == "3")
	   {echo "Btech/Mtech or equivalent";}
else if($row2['Edu_qual'] == "4")
	   {echo "BA/BBA/BSC or equivalent";}
else if($row2['Edu_qual'] == "5")
	   {echo "Diploma";}
else if($row2['Edu_qual'] == "6")
	   {echo "CA/CS/CFA/ICWA or equivalent";}  
   else if($row2['Edu_qual'] == "7")
	   {echo "MBBS/BHS/BAMS";}
else if($row2['Edu_qual'] == "8")
	   {echo "Phd";}
else if($row2['Edu_qual'] == "9")
	   {echo "Certificate courses";} 
else 
	     {echo "Other courses";} 
		?></td>
	
	
	
    <td><?php echo $row2['date'];?></td>
    
   
   
   
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