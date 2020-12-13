<?php
include_once("dbconnect.php");
$fname = $_POST['fname'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$state = $_POST['state'];
$password = sha1($_POST['password']);
$otp = rand(1000,9999);

$sqlregister = "INSERT INTO USER(FNAME,PHONE,EMAIL,STATE,PASSWORD,OTP) VALUES('$fname','$phone','$email','$state','$password','$otp')";

if ($conn->query($sqlregister) === TRUE){
    sendEmail($otp,$email);
    echo "success!";
}else{
    echo "failed";
}

function sendEmail($otp,$email){
    $from = "noreply@deafzone.com";
    $to = $email;
    $subject = "Hello,I'm DEAF ZONE. Verify your account";
    $message = "Use the following link to verify your account :"."\n https://itsmelele.com/DeafZone/php/verify_useraccount.php?email=".$email."&key=".$otp;
    $headers = "From:" . $from;
    mail($email,$subject,$message, $headers);
}
?>