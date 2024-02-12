<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Postavljanje statusa vesti na "pending" nakon odobrenja zahteva
    $queryUpdateStatus = "UPDATE news SET status = 'pending' WHERE idNews = $id";
    if (mysqli_query($conn, $queryUpdateStatus)) {
        header("Location: admin_odobrava_zahteve.php");
        exit;
    } else {
        echo "Greška prilikom odobravanja zahteva: " . mysqli_error($conn);
    }
} else {
    echo "Nedostaje ID vesti.";
}
?>
