<?php
$to = "hrsshah21@gmail.com"; 
$subject = "Regarding ur request in RTO";
$body = "This is to inform you that your request is successfully submitted you will recieve an email on the approval of your request.";
$header = "From:admin@gmail.com";

if(mail($to,$subject,$body,$header))
{
	echo"Your mais is sent";

}else{ echo "mIL.";}
/*
require_once('PHPMailer/class.phpmailer.php');
require_once('PHPMailer/class.smtp.php');

require 'PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer(); // create a new object
$mail->IsSMTP(); // enable SMTP
$mail->SMTPDebug = 1; // debugging: 1 = errors and messages, 2 = messages only
$mail->SMTPAuth = true; // authentication enabled
$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
$mail->Host = "smtp.gmail.com";
$mail->Port = 465; // or 587
$mail->IsHTML(true);
$mail->Username = "hrsshah21@gmail.com";
$mail->Password = "111011101110111";
$mail->SetFrom("example@gmail.com");
$mail->Subject = "Test";
$mail->Body = "hello";
$mail->AddAddress("email@gmail.com");

 if(!$mail->Send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
 } else {
    echo "Message has been sent";
 }
 */
?>