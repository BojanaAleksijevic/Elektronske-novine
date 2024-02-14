<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// Provera da li je sesija već pokrenuta pre poziva 
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['id']) || !isset($_SESSION['role']) || $_SESSION['role'] != 2) {
    header("Location: ../php/pocetna.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $query = "SELECT * FROM news WHERE idNews = $id";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) == 1) {
        $vest = mysqli_fetch_assoc($result);
    } else {
        echo "Vest ne postoji.";
        exit;
    }

    $tag_query = "SELECT contentTag FROM tags WHERE newsID = $id";
    $tag_result = mysqli_query($conn, $tag_query);
    $tags = [];
    while ($tag_row = mysqli_fetch_assoc($tag_result)) {
        $tags[] = $tag_row['contentTag'];
    }
    $tags_str = implode(', ', $tags);
    } else {
        echo "Nedostaje ID vesti.";
        exit;
    }

if ($vest['userID'] != $_SESSION['id']) {
    echo "Nemate dozvolu za izmenu ove vesti.";
    exit;
}

if(isset($_POST['submit'])) {
    $title = $_POST['title'];
    $subtitle = $_POST['subtitle'];
    $content = $_POST['content'];
    $id = $_POST['id'];
    
    // Provera za tagove(da li su poslati)
    $tags = isset($_POST['tags']) ? $_POST['tags'] : '';
    $images = $_FILES['images'];

    // izmena za tagoove: prvo brisanje, pa onda dodavanje novih
    $delete_query = "DELETE FROM tags WHERE newsID = $id";
    mysqli_query($conn, $delete_query);

    // dodajemo nove tagove
    if(!empty($tags)) {
        $tag_values = explode(',', $tags);
        foreach($tag_values as $tag) {
            $tag = trim($tag);
            $insert_query = "INSERT INTO tags (contentTag, newsID) VALUES ('$tag', $id)";
            mysqli_query($conn, $insert_query);
        }
    }

// Provera da li su poslate nove slike
if (!empty($_FILES['images']['name'][0])) {

    $sql_delete_images = "DELETE FROM images WHERE newsID = $id";
    $query_delete_images = mysqli_query($conn, $sql_delete_images);
    
    foreach ($_FILES['images']['name'] as $key => $image_name) {
        $image_type = $_FILES['images']['type'][$key];
        $image_size = $_FILES['images']['size'][$key];
        $image_tmp_loc = $_FILES['images']['tmp_name'][$key];
        
        $image_store = "../slike/" . $image_name;
        move_uploaded_file($image_tmp_loc, $image_store);
        
        $sql_insert_image = "INSERT INTO images (newsID, name) VALUES ('$id', '$image_name')";
        $query_insert_image = mysqli_query($conn, $sql_insert_image);
    }
}



    $query = "UPDATE news SET title = '$title', subtitle = '$subtitle', content = '$content' WHERE idNews = $id";
    $result = mysqli_query($conn, $query);

    if($result) {
        echo "<div class='success-message'>Vest je uspešno izmenjena.</div>";
        header("Refresh:2; url=novinar_gleda_vesti.php");
    } else {
        echo "<div class='error-message'>Greška prilikom izmene vesti: " . mysqli_error($conn) . "</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/stil.css">
    <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
    <title>Izmena vesti</title>
</head>

<body>

<div class="container">
    <header>
        <img src="../slike/logo2.png" alt="Logo" class="logo">
        <nav>
            <ul>
                <li><a href="novinar_gleda_vesti.php">Pogledaj svoje vesti</a></li>
                <li><a href="pocetna_novinar.php">Dodaj novu vest</a></li>
                <li><a href="logout.php">LogOut</a></li>
            </ul>
        </nav>
    </header>
</div>

<div class="">
    <form class="" action="izmeni_vest.php?id=<?php echo $id; ?>" enctype="multipart/form-data" method="POST">

        <label for="title">Naslov:</label>
        <input type="text" id="title" name="title" value="<?php echo $vest['title']; ?>">
        <br>
        <label for="subtitle">Podnaslov:</label>
        <input type="text" id="subtitle" name="subtitle" value="<?php echo $vest['subtitle']; ?>">
        <br>

        <textarea name="content" rows="20" cols="80" placeholder="Napisi tekst vesti" required><?php echo $vest['content']; ?></textarea><br>

        <label for="categoryID">Vasa kategorija je:</label>
                <select id="categoryID" name="categoryID" style="display: none;">
                    <?php
                    include 'C:\wamp64\www\novine\process\db.php';

                    $novinarID = $_SESSION['id'];

                    $sql = "SELECT c.idCategory, c.name
                            FROM category c
                            JOIN user u ON c.idCategory = u.categoryID
                            WHERE u.id = $novinarID";

                    $result = mysqli_query($conn, $sql);

                    if (!$result) {
                        echo "Greška prilikom izvršavanja SQL upita: " . mysqli_error($conn);
                    } else {

                        if ($row = mysqli_fetch_assoc($result)) {
                            $kategorija_novinara_id = $row['idCategory'];
                            $kategorija_novinara_name = $row['name'];
                            echo "<option value='$kategorija_novinara_id'>$kategorija_novinara_name</option>";
                        } else {
                            echo "Nema podataka za ovog novinara.";
                        }
                    }
                    ?>
                </select>
                <input type="text" value="<?php echo $kategorija_novinara_name; ?>" readonly>



        <br>

        <label for="tags">Tagovi:</label>
        <input type="text" id="tags" name="tags" value="<?php echo $tags_str; ?>">
        <br>

        <label for="images">Trenutne slike:</label>
        <br>
        <?php
        // Dohvati slike koje su već dodate uz ovu vest
        $query_images = "SELECT * FROM images WHERE newsID = $id";
        $result_images = mysqli_query($conn, $query_images);
        if(mysqli_num_rows($result_images) > 0) {
            while($row_images = mysqli_fetch_assoc($result_images)) {
                echo "<img src='../slike/" . $row_images['name'] . "' alt='Trenutna slika' style='max-width: 200px; max-height: 200px;'>";
            }
        }
        ?>
        <br>
        <label for="images">Dodajte slike:</label>
        <input type="file" name="images[]" id="images" multiple><br><br>


        <input type="submit" name="submit" value="Izmeni vest">
        <input type="hidden" name="id" value="<?php echo $id; ?>"> <!-- Skriveno polje za prosleđivanje ID vesti -->

        <br>
    </form> 
</div>

<?php
include 'footer.php'
?>

</body>

</html>
