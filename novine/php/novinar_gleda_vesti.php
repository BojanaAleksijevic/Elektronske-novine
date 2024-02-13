<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title> Pocetna stranica novinara </title>
</head>

<body>

    <div class="container">
        <header>
            <img src="../slike/logo2.png" alt="Logo" class="logo">
            <nav>
                <ul>
                    <li ><a href="novinar_gleda_vesti.php"> Pogledaj svoje vesti </a></li>
                    <li ><a href="pocetna_novinar.php"> Dodaj novu vest </a></li>
                    <li ><a href="logout.php"> LogOut </a></li>
                </ul>
            </nav>
        </header>
    </div>

    <?php
    require_once ('C:\wamp64\www\novine\process\db.php');

    // provera da li je sesija već pokrenuta pre poziva 
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }


    // Provera da li je korisnik novinar
    if (!isset($_SESSION['id']) || !isset($_SESSION['role']) || $_SESSION['role'] != 2) {
        header("Location: ../php/pocetna.php");
        exit;
    }
/*
ako imate nekoliko redova u tabeli i koristite GROUP_CONCAT na određenoj 
koloni, ona će spojiti vrednosti te kolone iz svih redova u jedan niz, 
razdvojen separatorom koji ste naveli.
*/

    $query = "SELECT news.*, GROUP_CONCAT(DISTINCT tags.contentTag) AS tagovi, GROUP_CONCAT(DISTINCT images.name) AS slike
            FROM news
            LEFT JOIN tags ON news.idNews = tags.newsID
            LEFT JOIN images ON news.idNews = images.newsID
            WHERE news.userID = '{$_SESSION['id']}'
            GROUP BY news.idNews"; // group da ne bi bilo duplikata
    $result = mysqli_query($conn, $query);

    if (!$result) {
        echo "Greška pri izvršavanju SQL upita: " . mysqli_error($conn);
    } else {
        // Ostatak koda za prikaz rezultata
    }


    if (mysqli_num_rows($result) > 0) {
        echo "<table>";
        echo "<tr><th>Datum</th><th>Naslov</th><th>Podnaslov</th><th>Sadrzaj</th><th>Tagovi</th><th>Slike</th><th>Izmena</th><th>Brisanje</th></tr>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row["date"] . "</td>";
            echo "<td>" . $row["title"] . "</td>";
            echo "<td>" . $row["subtitle"] . "</td>";
            echo "<td>" . $row["content"] . "</td>";
            echo "<td>" . $row["tagovi"] . "</td>"; 

            // Prikaz slika
            $slike = explode(',', $row["slike"]);
            echo "<td>";
            foreach ($slike as $slika) {
                echo "<img src='../slike/{$slika}' alt='{$slika}' style='max-width: 100px;'>";
            }
            echo "</td>";


            // Provera statusa vesti zbog izmene
            if ($row["status"] == "pending") {
                echo "<td><a href='izmeni_vest.php?id=" . $row["idNews"] . "'>Izmeni</a></td>";
            } else if ($row["status"] == "editing") {
                echo "<td>Poslat je zahtev.</td>";
            }
            else {
                echo "<td>Vest je odobrena. <a href='zahtev_za_izmenu_vesti.php?id=" . $row["idNews"] . "'>Zahtev za izmenu</a></td>";
            } 
            
            // Provera statusa vesti zbog brisanja
            if ($row["status"] == "pending") {
                echo "<td><a href='obrisi_vest_novinar.php?id=" . $row["idNews"] . "'>Obrisi</a></td>";
            } else if ($row["status"] == "editing") {
                echo "<td>Poslat je zahtev.</td>";
            }
            else {
                echo "<td>Vest je odobrena. <a href='zahtev_za_brisanje_vesti.php?id=" . $row["idNews"] . "'>Zahtev za brisanje</a></td>";
            } 
            
            
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "Nema vesti za pregled.";
    }

    mysqli_close($conn);

    
?>

<?php
    include 'footer.php'
?>
</body>
    
</html>
