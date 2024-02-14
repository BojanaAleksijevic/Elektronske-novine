<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

if (!isset($_SESSION['id']) || !isset($_SESSION['role']) || $_SESSION['role'] != 2) {
    header("Location: ../php/pocetna.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Postavljanje statusa vesti na "pending" za zahtev za izmenu
    $queryUpdateStatus = "UPDATE news SET status = 'editing' WHERE idNews = $id";
    if (mysqli_query($conn, $queryUpdateStatus)) {
        header("Location: novinar_gleda_vesti.php");
        exit;
    } else {
        echo "Greška prilikom slanja zahteva za izmenu: " . mysqli_error($conn);
    }
} else {
    echo "Nedostaje ID vesti.";
}
?>
