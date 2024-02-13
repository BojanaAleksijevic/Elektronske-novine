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
    
    <input type="search" name="Pretraga" id="Pretraga">


<?php
// Povezivanje sa bazom podataka
require_once ('C:\wamp64\www\novine\process\db.php');

$query = "SELECT news.*, category.name AS categoryName, CONCAT(user.name, ' ', user.surname) AS authorName 
          FROM news 
          JOIN category ON news.categoryID = category.idCategory
          JOIN user ON news.userID = user.id
          WHERE status = 'approved'";
$result = mysqli_query($conn, $query);


if (mysqli_num_rows($result) > 0) {
    echo "<table>";
    echo "<tr><th>Datum</th><th>Kategorija</th><th>Naslov</th><th>Podnaslov</th><th>Sadrzaj</th><th>Autor</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["date"] . "</td>";
        echo "<td>" . $row["categoryName"] . "</td>";
        echo "<td>" . $row["title"] . "</td>";
        echo "<td>" . $row["subtitle"] . "</td>";
        echo "<td>" . $row["content"] . "</td>";
        echo "<td>" . $row["authorName"] . "</td>";


        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Nema vesti za pregled.";
}

    // Oslobađanje resursa
    mysqli_free_result($result);

    // Zatvaranje konekcije sa bazom podataka
    mysqli_close($conn);

?>
<?php
    include 'footer.php';
?>

</body>

</html>