<?php
            include 'C:\wamp64\www\novine\process\db.php';

            if(isset($_POST['submit'])) {
                $title=$_POST['title'];
                $subtitle=$_POST['subtitle'];
                $content=$_POST['content'];
                $idCategory=$_POST['categoryID'];


                $date = date("Y-m-d H:i:s");
                $status = 'pending';
                $userID = $_SESSION['id'];


                $sql="INSERT INTO news (title, subtitle, content, categoryID, date, status, userID) 
                VALUES ('$title', '$subtitle', '$content', '$idCategory', '$date', '$status', '$userID')";
                                
                $query = mysqli_query($conn, $sql);


                $idCategory_rez = mysqli_query($conn, "SELECT idNews FROM news 
                WHERE title = '{$title}'");
                $idCategoryRow = mysqli_fetch_assoc($idCategory_rez);
                $newsID = $idCategoryRow['idNews'];
                $images=$_FILES['images'];
                
                /*
                foreach petlju da iterira kroz niz imena slika ($images['name']). 
                  Ključ $key će sadržavati indeks trenutne slike, 
                  a $image_name će sadržavati naziv trenutne slike.*/
                foreach ($images['name'] as $key => $image_name) {
                    $image_type = $images['type'][$key];
                    $image_size = $images['size'][$key];
                    $image_tmp_loc = $images['tmp_name'][$key];
                    
                    $image_store = "../slike/" . $image_name;
                    move_uploaded_file($image_tmp_loc, $image_store);
            
                    $sql_insert_image = "INSERT INTO images (newsID, name) VALUES ('$newsID', '$image_name')";
                    $query_insert_image = mysqli_query($conn, $sql_insert_image);
                }
                
                $tagString = $_POST['tags'];
                // Razdvajanje tagova po zarezima
                $tagsArray = explode(',', $tagString);

                foreach ($tagsArray as $tag) {
                    $sql_insert_tag = "INSERT INTO tags (contentTag, newsID) VALUES ('$tag', '$newsID')";
                    $query_insert_tag = mysqli_query($conn, $sql_insert_tag);
                }

                
                if ($query_insert_tag) {
                    echo "Vest je uspesno poslata!";
                    header('Location: pocetna_novinar.php');
                    exit();
                }
                else {
                    echo "Greška prilikom dodavanja novosti: " . mysqli_error($conn);
                }
            
            }
?>