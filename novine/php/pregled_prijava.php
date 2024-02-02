<?php
require_once ('C:\wamp64\www\novine\process\db.php');

// provera da li je sesija već pokrenuta pre poziva 
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


// Provera da li je korisnik admin
if (!isset($_SESSION['id']) || !isset($_SESSION['role']) || $_SESSION['role'] != 0) {
    header("Location: ../php/pocetna.php");
    exit;
}


$query = "SELECT * FROM prijave WHERE status = 'pending'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    echo "<table>";
    echo "<tr><th>Korisnicko ime</th><th>Kategorija</th><th>Iskustvo</th><th>Prijava za </th><th>Action</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["username"] . "</td>";
        echo "<td>" . $row["kategorija"] . "</td>";
        echo "<td>" . $row["experience"] . "</td>";
        echo "<td>";
        if ($row["role"] == 1) {
            echo "Urednik";
        } elseif ($row["role"] == 2) {
            echo "Novinar";
        } else {
            echo "Nepoznata uloga";
        }
        echo "</td>";

        echo "<td><a href='odobri_prijavu.php?id=" . $row["id"] . "'>Odobri</a></td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Nema prijava za pregled.";
}

mysqli_close($conn);
?>
