<!--ova stranica je dostupna samo prijavljenom novinaru-->
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
?>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title>Dodaj vest</title>

</head>
    
    <body>
        <?php
        include 'navbar.php';
        ?>
<!--
Forma može sadržavati različite vrste elemenata, kao što su tekstualna polja, padajući meniji, 
dugmad za slanje, itd. Svi ovi elementi omogućavaju korisnicima da unesu i pošalju podatke. 
Kada korisnik pritisne submit, podaci se šalju na putanju navedenu u atributu action
• enctype="multipart/form-data" - koristi se kada forma sadrži podatke za otpremanje (upload), kao što su datoteke.
-->
        <div class="">
            <form class="" action="dodaj_vest.php" enctype="multipart/form-data" method="POST">
                <textarea name="content" rows="20" cols="80" placeholder="Napisi tekst vesti" required></textarea><br>
                <input type="file" name="image" value="" required><br><br>
                <!-- u css-u kucao input[type=file] i input[type=submit]--->
                <input type="submit" name="submit" value="Submit">
            </form> 
            <?php
            include 'C:\wamp64\www\novine\process\db.php';

            if(isset($_POST['submit'])) {
                $content=$_POST['content'];
                $image=$_FILES['image']['name'];
                $image_type=$_FILES['image']['type'];
                $image_size=$_FILES['image']['size'];
                $image_tem_loc=$_FILES['image']['tmp_name'];
                $image_store="../slike/".$image;  
                
                move_uploaded_file($image_tem_loc, $image_store);

                $sql="INSERT INTO news (content,image) VALUES ('$content','$image')";
                $query = mysqli_query($conn, $sql);
            }
            
            ?>
        </div>


    </body>

</html>