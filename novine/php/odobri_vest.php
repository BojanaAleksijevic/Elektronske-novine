<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

if (!isset($_SESSION['id']) || ($_SESSION['role'] != 0 && $_SESSION['role'] != 1)) {
    header("Location: ../php/pocetna.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $queryUpdateStatus = "UPDATE news SET status = 'approved' WHERE idNews = $id";
    if (mysqli_query($conn, $queryUpdateStatus)) {
        if ($_SESSION['role'] == 0) {
            // Ako je korisnik admin
            header("Location: admin_odobrava_vesti.php");
        } elseif ($_SESSION['role'] == 1) {
            // Ako je korisnik urednik
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
