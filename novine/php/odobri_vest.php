<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

// Provera da li je korisnik admin ili urednik
if (!isset($_SESSION['id']) || ($_SESSION['role'] != 0 && $_SESSION['role'] != 1)) {
    header("Location: ../php/pocetna.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Postavljanje statusa na 'approved' za odabranu vest
    $queryUpdateStatus = "UPDATE news SET status = 'approved' WHERE idNews = $id";
    if (mysqli_query($conn, $queryUpdateStatus)) {
        if ($_SESSION['role'] == 0) {
            // Ako je korisnik admin, preusmeri na odgovarajuću stranicu za admina
            header("Location: admin_odobrava_vesti.php");
        } elseif ($_SESSION['role'] == 1) {
            // Ako je korisnik urednik, preusmeri na odgovarajuću stranicu za urednika
            header("Location: urednik_odobrava_vesti.php");
        }
        exit;
    } else {
        echo "Greška prilikom odobravanja vesti: " . mysqli_error($conn);
    }
} else {
    echo "Nedostaje ID vesti.";
}
?>
