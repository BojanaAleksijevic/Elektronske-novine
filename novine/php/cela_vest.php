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
    if (isset($_GET['title'])) {
        $title = mysqli_real_escape_string($conn, $_GET['title']);

        $query = "SELECT news.*,  
                (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
                category.name AS categoryName,
                CONCAT(user.name, ' ', user.surname) AS authorName
                FROM news 
                JOIN user ON news.userID = user.id
                JOIN category ON news.categoryID = category.idCategory
                WHERE news.status = 'approved' AND news.title = '$title'";

        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);

            echo "<div>";
            echo "<p class='kategorija'>Bobigram • " . $row['categoryName'] . "</p>";
            echo "<p class='autor-cela-vest'>Autor: " . $row['authorName'] . "</p>";
            echo "<p class='datum-cela-vest'>" . date('d.m.Y H:i', strtotime($row['date'])) .  "</p>";



            echo "<p class='naslov-cela-vest'>" . $row['title'] . "</p>";

            if ($row['imageName']) {
                echo "<img src='../slike/" . $row['imageName'] . "' alt='Slika vesti' class='cela-vest-slika'>";
            } else {
                echo "<p>Nema slike za ovu vest.</p>";
            }

            echo "<p class='podnaslov-cela-vest'>" . $row['subtitle'] . "</p>";
            echo "<p class='content-cela-vest'>" . $row['content'] . "</p>";
            echo "</div>";

            ?>

            <form action="../process/like.php" method="post">
                <input class="input" type="text" id="readerUsername" name="readerUsername" placeholder="Unesi username" required>
                
                <input type="hidden" name="newsID" value="<?php echo $row['idNews']; ?>">
                <br>
                <button type="submit" name="likeButton">Like</button>
            </form>

            <p class="broj-lajkova"><?php echo $row['countLikes']; ?> 👍</p>
        <?php
        } else {
            echo "<p>Vest nije pronađena.</p>";
        }

        mysqli_close($conn);
    } else {
        echo "<p>Naslov vesti nije prosleđen.</p>";
    }

    include 'footer.php';
    ?>

</body>

</html>
