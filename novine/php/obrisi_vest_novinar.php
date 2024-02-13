<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

// Provera da li je korisnik novinar
if (!isset($_SESSION['id']) || $_SESSION['role'] != 2) {
    header("Location: ../php/pocetna.php");
    exit;
}


if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Brisanje tagova povezanih sa odabranom vesti
    $queryDeleteTags = "DELETE FROM tags WHERE newsID = $id";
    if (!mysqli_query($conn, $queryDeleteTags)) {
        echo "Greška prilikom brisanja tagova: " . mysqli_error($conn);
    }

    // Brisanje slika povezanih sa odabranom vesti
    $queryDeleteImages = "DELETE FROM images WHERE newsID = $id";
    if (!mysqli_query($conn, $queryDeleteImages)) {
        echo "Greška prilikom brisanja slika: " . mysqli_error($conn);
    }

    // Brisanje odabrane vesti iz baze podataka
    $queryDeleteNews = "DELETE FROM news WHERE idNews = $id";
    if (mysqli_query($conn, $queryDeleteNews)) {
        header("Location: admin_odobrava_vesti.php");
        exit;
    } else {
        echo "Greška prilikom brisanja vesti: " . mysqli_error($conn);
    }
} else {
    echo "Nedostaje ID vesti.";
}
?>
