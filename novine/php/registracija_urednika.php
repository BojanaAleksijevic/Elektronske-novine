<?php 
  require ('C:\wamp64\www\novine\process\db.php');
?>


<!DOCTYPE html>

<html>
<head>
  <title>Urednik</title>
  <!--<link rel="stylesheet" type="text/css" href="../css/login.css">
  mozda registracija.css-->
</head>
<body>
    <?php
    include 'navbar.php';
    ?>
    <div class="login-box">
      <h1> Registracija urednika </h1>
      <!--
      ako je trenutni PHP skript koji prikazuje ovu stranicu nazvan forma.php, 
      onda će $_SERVER["PHP_SELF"] sadržavati vrednost /forma.php 
      (relativna putanja do skripta). Kada korisnik pošalje formu, podaci će biti 
      poslati na istu stranicu (forma.php u ovom slučaju) za dalju obradu.  
      --->
      <form method="post" action="<?php $_SERVER["PHP_SELF"] ?>">
        <label for="username">Korisničko ime:</label>
        <input type="text" id="username" name="username">
        <br>
        <label for="password">Lozinka:</label>
        <input type="password" id="password" name="password">
        <br>
        <label for="kategorija">Kategorija:</label>
        <input type="text" id="kategorija" name="kategorija">
        <br>
        <label for="experience">Iskustvo:</label>
        <textarea name="experience" rows="20" cols="20" required></textarea><br>
 
        <br><br>
        <input type="submit" name="submit" value="Posalji prijavu">
      </form>
      <h4><a href="../php/registracija_novinara.php">Zelis da postanes novinar? - POSALJI PRIJAVU OVDE </a></h4>
    </div>
</body>
</html>

<?php
require ('C:\wamp64\www\novine\process\db.php');


// da li poslata forma (da li je korisnik pritisnuo submit)
if (isset($_POST['submit'])) {
 // $user_id = $_GET['user_id'];
/*
  if (isset($_SESSION['id'])) {
    $user_id = $_SESSION['id']; 
  } 
  else{
    header("Location:loginkandidat.php");
  }*/
  $username = $_POST['username'];
  $password = $_POST['password'];
  $kategorija = $_POST['kategorija'];
  $experience = $_POST['experience'];
  $role = 1;
  $status = 'pending';
  $created_at = date("Y-m-d H:i:s");
   

  if (empty($username) || empty($password) || empty($kategorija) || empty($experience)) {
    echo "Please fill in all the required fields.";
  }
  

   else {
    
   
    $sql = "INSERT INTO prijave (username, password, kategorija, experience, role, status, created_at) 
    VALUES ('$username', '$password', '$kategorija', '$experience', '$role', '$status', '$created_at')";
    if (mysqli_query($conn, $sql)) {
      echo "Prijava je uspesno poslata!";
    } else {
      echo "Error submitting application: " . mysqli_error($conn);
    }
  }
}
?>