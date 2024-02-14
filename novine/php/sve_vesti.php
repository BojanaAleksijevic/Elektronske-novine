<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// na pocetku je unos prazan
$searchTerm = '';

// Provera da li je poslat zahtev za pretragu preko metode GET
if (isset($_GET['Pretraga'])) {
    $searchTerm = mysqli_real_escape_string($conn, $_GET['Pretraga']);
}

// upit za pretragu vesti
$query = "SELECT news.*,  
          (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
          category.name AS categoryName
          FROM news 
          JOIN user ON news.userID = user.id
          JOIN category ON news.categoryID = category.idCategory
          WHERE news.status = 'approved'";

// Dodavanje uslova pretrage ako je unet pojam za pretragu
if (!empty($searchTerm)) {
    $query .= " AND (news.title LIKE '%$searchTerm%' OR news.date LIKE '%$searchTerm%' OR news.idNews IN (SELECT newsID FROM tags WHERE contentTag LIKE '%$searchTerm%'))";
}

$query .= " ORDER BY news.date DESC";

$result = mysqli_query($conn, $query);




// Paginacija
$resultsPerPage = 10; // Broj vesti po stranici
$totalResults = mysqli_num_rows($result); // Ukupan broj vesti (iz upita iznad)
$totalPages = ceil($totalResults / $resultsPerPage); // Ukupan broj stranica koji ce biti potreban

if (!isset($_GET['page'])) {
    $currentPage = 1; 
} else {
    $currentPage = $_GET['page'];
}

//broj rezultata koji treba preskočiti pre nego što počnemo prikazivati rezultate na trenutnoj stranici.
$offset = ($currentPage - 1) * $resultsPerPage; // za prvu 0, za drugu 10..
$query .= " LIMIT $offset, $resultsPerPage"; // limit ogranicava: baza vraca broj rezultata pocevsi od offset, 
                                            // i to u količini koja je postavljena u $resultsPerPage.

$result = mysqli_query($conn, $query);


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
    <?php include 'navbar.php'; ?>

    <form id="search-form" method="GET">
        <input placeholder="Search..." type="text" name="Pretraga" class="pretraga" value="<?php echo $searchTerm; ?>">
        <button type="submit" class="pretraga-button">Pretraži</button>
        <br><br>
    </form>

    <?php

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<div class='vest-box'>";
    
            if ($row['imageName']) {
                echo "<img src='../slike/" . $row['imageName'] . "' alt='Slika vesti'>";
            } else {
                echo "<p>Nema slike za ovu vest.</p>";
            }
    
            echo "<div class='vest-info'>";
            echo "<a href='cela_vest.php?title=" . urlencode($row['title']) . "' class='naslov-pojedinacna-vest'>" . $row['title'] . "</a>";

            echo "<div class='kategorija-datum'>";
            echo "<a href='kategorija.php?category=" . $row['categoryName'] . "' class='kategorija'>" . $row['categoryName'] . "</a>";
        
            echo "<p class='datum'>" . date('d.m.Y H:i', strtotime($row['date'])) . "</p>";
            echo "</div>"; // Zatvara .kategorija-datum
            
            echo "</div>"; // Zatvara .vest-info
            echo "</div>"; // Zatvara .vest-box
        }
    } else {
        echo "Nema rezultata pretrage.";
    }


    // Linkovi za paginaciju
    echo "<div class='pagination'>";
    for ($i = 1; $i <= $totalPages; $i++) {
        echo "<a href='sve_vesti.php?page=$i'>$i</a> ";
    }
    echo "</div>";

    mysqli_free_result($result);
    ?>

    <?php include 'footer.php'; ?>

</body>
</html>
