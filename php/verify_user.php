<?php
    error_reporting(0);
    include_once("dbconnect.php");
    $email = $_GET['email'];
    $otp = $_GET['key'];
    
    $sql = "SELECT * FROM USER WHERE email = '$email'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $sqlupdate = "UPDATE USER SET otp = '0' WHERE email = '$email' AND otp = '$otp'";
        if ($conn->query($sqlupdate) === TRUE){
            echo 'success!';
        }else{
            echo 'failed';
        }   
    }else{
        echo "failed";
    }

?>
