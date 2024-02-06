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
<!--
Forma može sadržavati različite vrste elemenata, kao što su tekstualna polja, padajući meniji, 
dugmad za slanje, itd. Svi ovi elementi omogućavaju korisnicima da unesu i pošalju podatke. 
Kada korisnik pritisne submit, podaci se šalju na putanju navedenu u atributu action
• enctype="multipart/form-data" - koristi se kada forma sadrži podatke za otpremanje (upload), kao što su datoteke.
-->
    <div class="">
            <form class="" action="dodaj_vest.php" enctype="multipart/form-data" method="POST">
                

            <?php
            include 'C:\wamp64\www\novine\process\db.php';

            $novinarID = $_SESSION['id'];

            // dobijanje kategorije novinara iz tabele category
            $sql = "SELECT c.idCategory
                    FROM category c
                    JOIN user u ON c.idCategory = u.categoryID
                    WHERE u.id = $novinarID";

            $result = mysqli_query($conn, $sql);

            // Provera da li je upit uspeo
            if (!$result) {
                // Ovde dodajte logiku za rukovanje greškom
                echo "Greška prilikom izvršavanja SQL upita: " . mysqli_error($conn);
            } else {
                // Provera da li ima rezultata iz upita
                if ($row = mysqli_fetch_assoc($result)) {
                    $kategorija_novinara = $row['idCategory'];
                } else {
                    // Dodatna provera ukoliko nema rezultata
                    echo "Nema podataka za ovog novinara.";
                }
            }
            ?>


                <label for="title">Naslov:</label>
                <input type="text" id="title" name="title">
                <br>
                <label for="subtitle">Podnaslov:</label>
                <input type="text" id="subtitle" name="subtitle">
                <br>

                <textarea name="content" rows="20" cols="80" placeholder="Napisi tekst vesti" required></textarea><br>
                
                <label for="categoryID">Vasa kategorija je:</label>
                <input type="text" id="categoryID" name="categoryID" value="<?php echo $kategorija_novinara; ?>" readonly>
                <!--ovde treba da bude po defaultu kategorija koju je on oznacio-->
                <br>

                
                <!-- Dodat input za tagove -->
                <label for="tags">Dodajte tagove (odvojene zarezima):</label>
                <input type="text" id="tags" name="tags">


                <br>

                <label for="images">Dodajte slike:</label>
                <input type="file" name="images[]" id="images" multiple required><br><br>
                <!--'multiple' za dodavanje više slika -->
                <!-- u css-u kucao input[type=file] i input[type=submit]--->
                
                
                <input type="submit" name="submit" value="Posalji vest">
                <br>
            </form> 
        </div>
    <?php
        include 'footer.php';
    ?>
</body>
    
</html>
