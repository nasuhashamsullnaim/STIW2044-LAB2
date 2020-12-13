<?php
$servername = "localhost";
$username   = "itsmelel_user";
$password   = "Nasuha9644";
$dbname     = "itsmelel_deafZone";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}
?>