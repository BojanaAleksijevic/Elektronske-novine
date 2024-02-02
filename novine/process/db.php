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



// ne znam da li je ovo potrebno
/*function formatDate1($date) {
    return date('Y-m-d', strtotime($date));
}

function formatDate2($date2) {
    return date('g:i a', strtotime($date2));
}

function formatDate3($date3) {
    return date('l', strtotime($date3));
}
*/
?>