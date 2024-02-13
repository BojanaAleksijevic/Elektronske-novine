<?php
require_once ('C:\wamp64\www\novine\process\db.php');

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title>Bobigram</title>
</head>

<body>
    <?php
        include 'navbar.php'
    ?>

<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// Provera da li je prosleđen parametar category
if(isset($_GET['category'])) {
    // Dobijanje vrednosti parametra category
    $category = $_GET['category'];

    // Priprema upita za dobijanje vesti odabrane kategorije sa imenom autora
    $query = "SELECT news.date, news.title, news.subtitle, news.content, CONCAT(user.name, ' ', user.surname) AS authorName
              FROM news 
              JOIN user ON news.userID = user.id
              WHERE news.categoryID IN (SELECT idCategory FROM category WHERE name = '$category') 
              AND news.status = 'approved'";
    $result = mysqli_query($conn, $query);

    // Provera da li postoji rezultat upita
    if(mysqli_num_rows($result) > 0) {
        // Prikaz svih vesti odabrane kategorije
        echo "<h2>Vesti iz kategorije: $category</h2>";
        echo "<table>";
        echo "<tr><th>Datum</th><th>Naslov</th><th>Podnaslov</th><th>Sadrzaj</th><th>Autor</th></tr>";
    
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row["date"] . "</td>";
            echo "<td>" . $row["title"] . "</td>";
            echo "<td>" . $row["subtitle"] . "</td>";
            echo "<td>" . $row["content"] . "</td>";
            echo "<td>" . $row["authorName"] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "Nema vesti za odabranu kategoriju.";
    }

    // Oslobađanje resursa
    mysqli_free_result($result);

    // Zatvaranje konekcije sa bazom podataka
    mysqli_close($conn);
} else {
    // Ako nije prosleđen parametar category, prikažite odgovarajuću poruku
    echo "Nije odabrana kategorija.";
}
?>



</body>

</html>