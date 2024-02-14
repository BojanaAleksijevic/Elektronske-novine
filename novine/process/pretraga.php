<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// Provera da li je prosleđen upit za pretragu
if(isset($_GET['Pretraga'])) {
    $searchTerm = $_GET['Pretraga'];

    // Priprema upita za pretragu po naslovu, tagovima i datumu
    $query = "SELECT news.*,  
              (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
              category.name AS categoryName
              FROM news 
              JOIN user ON news.userID = user.id
              JOIN category ON news.categoryID = category.idCategory
              WHERE (news.title LIKE '%$searchTerm%' OR news.date LIKE '%$searchTerm%' OR news.idNews IN (SELECT newsID FROM tags WHERE contentTag LIKE '%$searchTerm%'))
              AND news.status = 'approved'
              ORDER BY news.date DESC";
    $result = mysqli_query($conn, $query);

    // Prikaz rezultata pretrage
    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            // Prikaz rezultata pretrage
            // Ovde možete stilizovati i prikazati rezultate pretrage kako želite
            echo "<div class='vest-box'>";
            if ($row['imageName']) {
                echo "<img src='../slike/" . $row['imageName'] . "' alt='Slika vesti'>";
            } else {
                echo "<p>Nema slike za ovu vest.</p>";
            }
            echo "<div class='vest-info'>";
            echo "<a href='cela_vest.php?title=" . urlencode($row['title']) . "'>" . $row['title'] . "</a>";
            echo "<p class='podnaslov'>" . $row['subtitle'] . "</p>";
            // Prikazivanje kategorije i datuma
            echo "<div class='kategorija-datum'>";
            echo "<a href='kategorija.php?category=" . $row['categoryName'] . "' class='kategorija'>" . $row['categoryName'] . "</a>";
            echo "<p class='datum'>" . $row['date'] . "</p>";
            echo "</div>"; // Zatvara .kategorija-datum
            echo "</div>"; // Zatvara .vest-info
            echo "</div>"; // Zatvara .vest-box
        }
    } else {
        echo "Nema rezultata pretrage.";
    }

    // Oslobađanje resursa
    mysqli_free_result($result);
    // Zatvaranje konekcije sa bazom podataka
    mysqli_close($conn);
} else {
    // Ako nije prosleđen upit za pretragu, prikažite sve vesti
    echo "Molimo unesite pojam za pretragu.";
}
?>
