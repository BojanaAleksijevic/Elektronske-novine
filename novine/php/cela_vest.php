<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/stil.css">
        <link rel="icon" href="../slike/title-slika.png" type="image/jpg">
        <title>Cela vest</title>

        <style media=screen>
            .cela-vest-slika {
                width: 600px;
                height: auto;
            }

            .div1 {
                margin-left: 400px;
            }
            .div2 {
                weight: 600px;
            }

            p{
                font-size: 20px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <?php 
        
        include 'navbar.php'; 
        include 'C:\wamp64\www\novine\process\db.php';
        
        $id=$_POST['id'];
        
        $sql="SELECT * from news where id='$id'";
        $query=mysqli_query($conn, $sql);

        while($info=mysqli_fetch_array($query)) {
            ?>
            <div class="div1">
                <p><?php echo $info['date']; ?></p>
                <img class="cela-vest-slika" src="../slike/<?php echo $info['image']; ?>" alt="">
                <div class="div2">
                    <?php echo $info['content']; ?>

                </div>
            </div>

            <?php
        }

        
        ?>
    </body>
</html>