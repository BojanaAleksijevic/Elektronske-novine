<?php 
  require ('C:\wamp64\www\novine\process\db.php');
?>


<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="../css/login.css">
  <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
  <title>Urednik</title>
</head>
<body>
    <?php
    include 'navbar.php';
    ?>
    <div class="login-box-reg">
      <h1> Registracija urednika </h1>

      <form method="post" action="<?php $_SERVER["PHP_SELF"] ?>">
        <label for="name">Ime:</label>
        <input type="text" id="name" name="name">
        <br>
        <label for="surname">Prezime:</label>
        <input type="text" id="surname" name="surname">
        <br>
        <label for="password">Lozinka:</label>
        <input type="password" id="password" name="password">
        <br>
        <label for="kategorija">Kategorija:</label>
        <input type="text" id="kategorija" name="kategorija">
        <br>
        
        <label for="experience">Iskustvo:</label>
        <br>
        <textarea name="experience" rows="6" cols="36" required></textarea><br>

        <br><br>
        <input type="submit" name="submit" value="Posalji prijavu">
      </form>
      <h4><a href="../php/registracija_novinara.php">Zelis da postanes novinar? - POSALJI PRIJAVU OVDE </a></h4>
    </div>

    
</body>
</html>

<?php
require ('C:\wamp64\www\novine\process\db.php');


if (isset($_POST['submit'])) {
  $name = $_POST['name'];
  $surname = $_POST['surname'];

  $password = $_POST['password'];
  $kategorija = $_POST['kategorija'];
  $experience = $_POST['experience'];
  $role = 1;
  $status = 'pending';
  $created_at = date("Y-m-d H:i:s");
   

  if (empty($name) || empty($surname) || empty($password) || empty($kategorija) || empty($experience)) {
    echo "Please fill in all the required fields.";
  }
  

   else {
    
   
    $sql = "INSERT INTO prijave (name, surname, password, kategorija, experience, role, status, created_at) 
    VALUES ('$name', '$surname', '$password', '$kategorija', '$experience', '$role', '$status', '$created_at')";
    if (mysqli_query($conn, $sql)) {
      echo "Prijava je uspesno poslata!";
    } else {
      echo "Error submitting application: " . mysqli_error($conn);
    }
  }
}
?>