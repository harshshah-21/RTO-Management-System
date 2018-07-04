<?php
   include('session.php');
?>


<!DOCTYPE html>
<html>
<head>

<!-- For-Mobile-Apps -->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

<style>
	
</style>
</head>
<body>
<div class="container" style="margin-left:12%;color:white;font-size:25px;">

	<p style="margin-left:35%;">Welcome <?php echo $username;?><a href="logout.php" style="float:right;text-decoration:none;color:#ef4c89">Signout</a>
	
</div>

</body>
</html>