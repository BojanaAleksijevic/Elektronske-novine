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
    <section class="header-news">
        <div class="container-drugi">
            <div class="header-news-box">
                <h5 class="header-news-box-title"><span class="static-text">• aktuelno</span></h5>

                <div class="header-news-slider-wrapper">

                    <div class="header-news-slider">

                        <div class="marquee">

                            <div class="marquee-content">
                                
                            <?php
                            // Dohvatanje naslova vesti iz baze podataka
                            $query = "SELECT title FROM news WHERE status='approved' ORDER BY date DESC LIMIT 3";
                            $result = mysqli_query($conn, $query);

                            // Provera da li ima rezultata
                            if (mysqli_num_rows($result) > 0) {
                                // Prikaz naslova kao linkova unutar marquee
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<a href='#' class='marquee-item'> ◼️  " . $row['title'] . "</a>";
                                }
                            } else {
                                echo "Nema dostupnih vesti.";
                            }
                            ?>

                            </div>
                            <div class="marquee-content">

                            <?php
                            $query = "SELECT title FROM news WHERE status='approved' ORDER BY date DESC LIMIT 3";
                            $result = mysqli_query($conn, $query);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<a href='#' class='marquee-item'>  ◼️  " . $row['title'] . "</a>";
                                }
                            } else {
                                echo "Nema dostupnih vesti.";
                            }
                            ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <?php
        include 'navbar.php';
    ?>
    
    
    <div class='glavni-div'>
    <div class='div-levo-pocetna'>
    <h1>NAJNOVIJE VESTI DANA</h1>

    <?php
    // 5 najnovijih vesti sa samo jednom slikom
    $query = "SELECT news.*, 
              (SELECT name FROM images WHERE newsID = news.idNews LIMIT 1) AS imageName,
              category.name AS categoryName
              FROM news 
              JOIN user ON news.userID = user.id
              JOIN category ON news.categoryID = category.idCategory
              WHERE news.status = 'approved'
              ORDER BY news.date DESC
              LIMIT 5";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<div class='vest-box'>";
    
            if ($row['imageName']) {
                echo "<img src='../slike/" . $row['imageName'] . "' alt='Slika vesti'>";
            } else {
                echo "<p>Nema slike za ovu vest.</p>";
            }
    
            echo "<div class='vest-info'>";
            echo "<a href='cela_vest.php?title=" . urlencode($row['title']) . "'>" . $row['title'] . "</a>";

            // Prikazivanje kategorije i datuma
            echo "<div class='kategorija-datum'>";
            echo "<a href='kategorija.php?category=" . $row['categoryName'] . "' class='kategorija'>" . $row['categoryName'] . "</a>";
        
            echo "<p class='datum'>" . $row['date'] . "</p>";
            echo "</div>"; // Zatvara .kategorija-datum
            
            echo "</div>"; // Zatvara .vest-info
            echo "</div>"; // Zatvara .vest-box
        }
    } else {
        echo "Nema dostupnih vesti.";
    }
    
    ?>

</div>

        
            <?php
            // include 'vest_na_pocetnoj.php'
            ?>

        <div class='div-desno-pocetna'>
            <h3 style="color: black;">Kategorije</h3>

            <?php
            $query = "SELECT DISTINCT name FROM category"; 
            $result = mysqli_query($conn, $query);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<a href='kategorija.php?category=" . $row['name'] . "' class='marquee-item' style='color: black;'>" . $row['name'] . "</a><br>";
                }
            } else {
                echo "Nema dostupnih kategorija.";
            }
            ?>

        </div>

    </div>


    <hr></hr>
    <h3 class="pratite-nas">Pratite nas: </h3>
    <div class="social-icons">
        
        <a href="#"><img src="../slike/fb.png" alt="Facebook" class="social-icon"></a>
        <a href="#"><img src="../slike/tw.png" alt="Twitter" class="social-icon"></a>
        <a href="#"><img src="../slike/instagram.jpg" alt="Instagram" class="social-icon"></a>
        <a href="#"><img src="../slike/yt.png" alt="Youtube" class="social-icon"></a>
  
    </div>
    <?php
        include 'footer.php';
    ?>
</body>
</html>
