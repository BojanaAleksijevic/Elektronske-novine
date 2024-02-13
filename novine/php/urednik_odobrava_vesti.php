<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title> Urednik odobrava vesti </title>
</head>

<body>

    <?php
        include 'navbar_urednik.php';
    ?>

<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// provera da li je sesija već pokrenuta pre poziva 
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


// Provera da li je korisnik admin
if (!isset($_SESSION['id']) || !isset($_SESSION['role']) || $_SESSION['role'] != 1) {
    header("Location: ../php/pocetna.php");
    exit;
}

$urednikID = $_SESSION['id'];

$query = "SELECT news.*, category.name AS categoryName, CONCAT(user.name, ' ', user.surname) AS authorName 
          FROM news 
          JOIN category ON news.categoryID = category.idCategory
          JOIN user ON news.userID = user.id
          WHERE status = 'pending' AND category.idCategory = (SELECT categoryID FROM user WHERE id = $urednikID)";
$result = mysqli_query($conn, $query);


if (mysqli_num_rows($result) > 0) {
    echo "<table>";
    echo "<tr><th>Datum</th><th>Kategorija</th><th>Naslov</th><th>Podnaslov</th><th>Sadrzaj</th><th>Autor</th><th>Odobravanje</th><th>Brisanje</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["date"] . "</td>";
        echo "<td>" . $row["categoryName"] . "</td>";
        echo "<td>" . $row["title"] . "</td>";
        echo "<td>" . $row["subtitle"] . "</td>";
        echo "<td>" . $row["content"] . "</td>";
        echo "<td>" . $row["authorName"] . "</td>";

        echo "<td><a href='odobri_vest.php?id=" . $row["idNews"] . "'>Odobri</a></td>";
        echo "<td><a href='obrisi_vest.php?id=" . $row["idNews"] . "'>Obrisi</a></td>";

        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Nema vesti za pregled.";
}

mysqli_close($conn);
?>
</body>

<?php
    include 'footer.php';
?>