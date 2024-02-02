<!DOCTYPE html>


<html>
<head>
  <title>Glavni urednik</title>
  <link rel="stylesheet" type="text/css" href="../css/login.css">
  
</head>
<body>
    <?php
    include 'navbar.php';
    ?>
  <div class="login-box">
    <h1> Login admina </h1>
    
    <form method="post" action="../process/eadmin.php">
      <label for="username">Korisničko ime:</label>
      <input type="text" id="username" name="username">
      <br>
      <label for="password">Lozinka:</label>
      <input type="password" id="password" name="password">
      <br><br>
      <input type="submit" name="submit" value="Prijavi se">
    </form>
    <h4><a href="../php/login_urednik.php">Ti si urednik? - ULOGUJ SE OVDE </a></h4>
    <h4><a href="../php/login_novinar.php">Ti si novinar? - ULOGUJ SE OVDE</a></h4>
  </div>
</body>
</html>
