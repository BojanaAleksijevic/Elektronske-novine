<?php
require_once ('C:\wamp64\www\novine\process\db.php');
include 'navbar.php'; 
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

if(isset($_GET['category'])) {
    $category = $_GET['category'];

    $query = "SELECT news.*, 
              (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
              category.name AS categoryName
              FROM news 
              JOIN user ON news.userID = user.id
              JOIN category ON news.categoryID = category.idCategory
              WHERE news.status = 'approved' AND news.categoryID IN (SELECT idCategory FROM category WHERE name = '$category') 
              ORDER BY news.date DESC
              LIMIT 5";
    $result = mysqli_query($conn, $query);

    if(mysqli_num_rows($result) > 0) {
        echo "<h2>Bobigram • $category</h2>";
        
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
        echo "Nema vesti za odabranu kategoriju.";
    }

    mysqli_free_result($result);

    mysqli_close($conn);
} else {
    echo "Nije odabrana kategorija.";
}
?>

</body>

</html>