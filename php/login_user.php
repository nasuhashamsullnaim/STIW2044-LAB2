<?php
error_reporting(0);
include_once("dbconnect.php");
$email = $_POST['EMAIL'];
$password = sha1($_POST['PASSWORD']);

$sqllogin = "SELECT * FROM USER WHERE EMAIL = '$email' AND PASSWORD = '$password' AND OTP = '0'";
$result = $conn->query($sqllogin);

if ($result->num_rows > 0) {
    while ($row = $result ->fetch_assoc()){
        echo $data = "success,".$row["FNAME"].",".$row["PHONE"].",".$row["STATE"].$row["EMAIL"];
    }
}else{
    echo "failed";
}

?>