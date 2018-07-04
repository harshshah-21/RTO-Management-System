<?php

$host = "localhost";
$uname = "root";
$pass = "";
$db = "rto_mng_system1";

mysql_connect($host,$uname,$pass)
	or die("Error connecting database ".mysql_error());
mysql_select_db($db)
	or die("Error selecting database ".mysql_error());

?>
