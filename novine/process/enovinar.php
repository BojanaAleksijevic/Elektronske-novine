<?php

require_once ('C:\wamp64\www\novine\process\db.php');


if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['password'])) {
  
  $name = $_POST['name'];
  $surname = $_POST['surname'];
  $password = $_POST['password'];
  
  $sql = "SELECT * from  User WHERE name = '$name' AND surname = '$surname' AND password = '$password'";
  
  $result = mysqli_query($conn, $sql);
  
  if (!$result) {
    die("Error executing query: " . mysqli_error($conn));
  }
  
  if(mysqli_num_rows($result) == 1){
    
    $employee = mysqli_fetch_array($result);
    
    // dodaj ID korisnika u sesiju
    $_SESSION['id'] = $employee['id'];
    $_SESSION['role'] = $employee['role'];
    
    // preusmeri na novu stranicu u zavisnosti od uloge
    if ($_SESSION['role'] == 2) {
        header("Location: ../php/pocetna_novinar.php");
    } else {
        header("Location: ../php/pocetna.php");
    }
    exit;
  }

  else{
	echo ("<SCRIPT LANGUAGE='JavaScript'>
    window.alert('Invalid username or Password')
    window.location.href='javascript:history.go(-1)';
    </SCRIPT>");
  }
}

elseif (!isset($_SESSION['id'])) {
  header("Location: ../php/pocetna.php");
  exit;
}
?>