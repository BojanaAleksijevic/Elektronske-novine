<?php
require_once ('C:\wamp64\www\novine\process\db.php');
session_start();

// Provera da li je korisnik admin
if (!isset($_SESSION['id']) || $_SESSION['role'] != 0) {
    header("Location: ../php/novine.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Dohvatanje podataka iz odobrene prijave
    $queryGetApplicationData = "SELECT * FROM prijave WHERE id = $id";
    $result = mysqli_query($conn, $queryGetApplicationData);

    if ($result && mysqli_num_rows($result) == 1) {
        $applicationData = mysqli_fetch_assoc($result);

        // Postavljanje statusa na 'approved' za odabranu prijavu
        $queryUpdateStatus = "UPDATE prijave SET status = 'approved' WHERE id = $id";
        if (mysqli_query($conn, $queryUpdateStatus)) {

            // Dodavanje korisnika u tabelu User
            $queryInsertUser = "INSERT INTO User (id, username, password, role)
                                VALUES ('{$applicationData['id']}', '{$applicationData['username']}',
                                        '{$applicationData['password']}', '{$applicationData['role']}')";

            if (mysqli_query($conn, $queryInsertUser)) {
                header("Location: pregled_prijava.php");
                exit;
            } else {
                echo "Greška prilikom dodavanja korisnika: " . mysqli_error($conn);
            }
        } else {
            echo "Greška prilikom odobravanja prijave: " . mysqli_error($conn);
        }
    } else {
        echo "Nepostojeća prijava.";
    }
} else {
    echo "Nedostaje ID prijave.";
}
?>
