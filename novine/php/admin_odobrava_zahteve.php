<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title> Admin odobrava vesti </title>
</head>

<body>

    <?php
        include 'navbar_admin.php';
    ?>

<?php
require_once ('C:\wamp64\www\novine\process\db.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Provera da li je korisnik admin
if (!isset($_SESSION['id']) || $_SESSION['role'] != 0) {
    header("Location: ../php/pocetna.php");
    exit;
}

$queryPendingRequests = "SELECT news.idNews, news.title, user.username AS author_name 
                        FROM news 
                        INNER JOIN user ON news.userID = user.id 
                        WHERE status = 'editing'";
$resultPendingRequests = mysqli_query($conn, $queryPendingRequests);

if (mysqli_num_rows($resultPendingRequests) > 0) {
    echo "<h2>Zahtevi za izmenu/brisanje vesti:</h2>";
    echo "<ul>";
    while ($row = mysqli_fetch_assoc($resultPendingRequests)) {
        echo "<li>";
        echo "Naslov: " . $row['title'] . " - Autor: " . $row['author_name'];
        echo "<br>";
        echo "<a href='odobri_zahtev.php?id=" . $row['idNews'] . "'>Odobri zahtev</a>";
        echo "</li>";
    }
    echo "</ul>";
} else {
    echo "Nema zahteva za izmenu/brisanje vesti.";
}

mysqli_close($conn);
?>


</body>

<?php
    include 'footer.php';
?>