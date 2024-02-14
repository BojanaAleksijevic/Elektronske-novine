<?php

$hostname ="localhost";
$username ="root";
$password ="";
$database ="novine";

$conn = mysqli_connect($hostname, $username, $password, $database);


if(!isset($_SESSION)) {
    session_start();
}
$conn = mysqli_connect("localhost","root","","novine");

if(!$conn) {
    echo "Database Connection Failed";
}

?>