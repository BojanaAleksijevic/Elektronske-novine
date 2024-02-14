<?php
session_start();
include 'C:\wamp64\www\novine\process\db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['likeButton'])) {
    $newsID = $_POST['newsID'];
    $bool = 1; // Lajkovanje

    if (isset($_POST['readerUsername'])) {
        $readerUsername = mysqli_real_escape_string($conn, $_POST['readerUsername']);
        
        // Provera da li čitač već postoji u bazi
        $checkReaderQuery = "SELECT * FROM reader WHERE username = '$readerUsername'";
        $checkReaderResult = mysqli_query($conn, $checkReaderQuery);

        if (mysqli_num_rows($checkReaderResult) > 0) {
            // Ako čitač već postoji, preuzmi readerID
            $readerData = mysqli_fetch_assoc($checkReaderResult);
            $readerID = $readerData['idReader'];
        } else {
            // Ako čitač ne postoji, dodaj ga u bazu
            $insertReaderQuery = "INSERT INTO reader (username) VALUES ('$readerUsername')";
            mysqli_query($conn, $insertReaderQuery);

            // Preuzmi readerID koji je automatski generisan
            $readerID = mysqli_insert_id($conn);
        }

        // Obeležavanje da je čitač već lajkovao ovu vest
        $_SESSION['liked_readerID'] = $readerID;

        // Provera da li čitač već lajkovanje ovu vest
        $checkLikeQuery = "SELECT * FROM likes WHERE readerID = $readerID AND newsID = $newsID";
        $checkLikeResult = mysqli_query($conn, $checkLikeQuery);

        if (mysqli_num_rows($checkLikeResult) == 0) {
            // Dodavanje lajka u bazu podataka
            $insertLikeQuery = "INSERT INTO likes (bool, newsID, readerID) VALUES ($bool, $newsID, $readerID)";
            mysqli_query($conn, $insertLikeQuery);

            // Povećanje broja lajkova u tabeli news
            $updateQuery = "UPDATE news SET countLikes = (SELECT COUNT(*) FROM likes WHERE newsID = $newsID AND bool = 1) WHERE idNews = $newsID";
            mysqli_query($conn, $updateQuery);
        }
    }
}

// Redirekcija nazad na stranicu sa vestima
header("Location: {$_SERVER['HTTP_REFERER']}");
exit();
?>
