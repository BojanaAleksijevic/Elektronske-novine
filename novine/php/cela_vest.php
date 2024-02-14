<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/stil.css">
        <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
        <title>Cela vest</title>

    </head>

    <body>
    <?php
    include 'navbar.php';
    include 'C:\wamp64\www\novine\process\db.php';

    // Provera da li je prosleđen naslov vesti kroz URL
    if(isset($_GET['title'])) {
        // Čišćenje i filtriranje naslova vesti
        $title = mysqli_real_escape_string($conn, $_GET['title']);

        // Priprema upita za izbor određene vesti na osnovu naslova
        $query = "SELECT news.*,  
                (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
                category.name AS categoryName,
                CONCAT(user.name, ' ', user.surname) AS authorName
                FROM news 
                JOIN user ON news.userID = user.id
                JOIN category ON news.categoryID = category.idCategory
                WHERE news.status = 'approved' AND news.title = '$title'";
        
        $result = mysqli_query($conn, $query);

        // Provera da li postoji rezultat za dati naslov
        if(mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);

            // Prikaz detalja vesti
            echo "<div>";
            echo "<p class='kategorija'>Bobigram • " . $row['categoryName'] . "</p>";
            echo "<p class='autor'>Autor: " . $row['authorName'] . "</p>";
            echo "<p class='datum'>Datum: " . $row['date'] . "</p>";
            echo "<p>" . $row['title'] . "</p>";

            if ($row['imageName']) {
                echo "<img src='../slike/" . $row['imageName'] . "' alt='Slika vesti' class='cela-vest-slika'>";
            } else {
                echo "<p>Nema slike za ovu vest.</p>";
            }

            echo "<p class='podnaslov'>" . $row['subtitle'] . "</p>";
            echo "<p class='tekst'>" . $row['content'] . "</p>";
            echo "</div>";

            // Dodajte formu za lajkovanje ispod ovog dela
            ?>

            <form action="../process/like.php" method="post">
                <input type="hidden" name="newsID" value="<?php echo $row['idNews']; ?>">
                <input type="hidden" name="bool" value="1">
                <button type="submit" name="likeButton">Lajkuj</button>
            </form>

            <p class="broj-lajkova"><?php echo $row['countLikes']; ?> lajkova</p>

            <?php

            // Oslobađanje resursa
            mysqli_free_result($result);
        } else {
            echo "<p>Vest nije pronađena.</p>";
        }

        // Zatvaranje konekcije sa bazom podataka
        mysqli_close($conn);
    } else {
        echo "<p>Naslov vesti nije prosleđen.</p>";
    }



    include 'footer.php';
    ?>

    </body>
</html>