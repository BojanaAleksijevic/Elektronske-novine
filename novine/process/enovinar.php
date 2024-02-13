<?php

// konektuj se na bazu podataka
require_once ('C:\wamp64\www\novine\process\db.php');


// ako korisnik šalje podatke za prijavu
if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['password'])) {
  
  $name = $_POST['name'];
  $surname = $_POST['surname'];
  $password = $_POST['password'];
  
  // SQL upit za selektovanje korisnika iz baze podataka
  $sql = "SELECT * from  User WHERE name = '$name' AND surname = '$surname' AND password = '$password'";
  
  $result = mysqli_query($conn, $sql);
  
  // ako upit nije uspešan
  if (!$result) {
    die("Error executing query: " . mysqli_error($conn));
  }
  
  // ako upit vraća 1 rezultat (postoji korisnik sa zadatim username-om i password-om)
  if(mysqli_num_rows($result) == 1){
    
    $employee = mysqli_fetch_array($result);
    
    // dodaj ID korisnika u sesiju
    $_SESSION['id'] = $employee['id'];
    $_SESSION['role'] = $employee['role'];
    
    // preusmeri na novu stranicu u zavisnosti od uloge
    if ($_SESSION['role'] == 2) {
        header("Location: ../php/pocetna_novinar.php");
    } else {
        // Ukoliko uloga nije 2 (novinar), možete preusmeriti korisnika 
        header("Location: ../php/pocetna.php");
    }
    exit;
  }
  // u suprotnom, prikaži poruku o grešci
  else{
	echo ("<SCRIPT LANGUAGE='JavaScript'>
    window.alert('Invalid username or Password')
    window.location.href='javascript:history.go(-1)';
    </SCRIPT>");
  }
}

// ako korisnik pokušava da pristupi stranici bez da je prijavljen
elseif (!isset($_SESSION['id'])) {
  header("Location: ../php/pocetna.php");
  exit;
}
?>