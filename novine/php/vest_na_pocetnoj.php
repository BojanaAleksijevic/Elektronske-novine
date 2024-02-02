<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <style media="screen">
            .div1 {
                border: 2px solid black;
                width: 470px;
                float: left;
                margin-left: 10px;
            }
            

            .div2 {
                width: 200px;
                border: 1px solid white;
                max-height: 150px;
                overflow: hidden;
                float: left;
                margin-top: 10px;
                margin-left: 10px;
                font-size: 23px;
                font-weight: bold;
            }

            .divmain {
                margin-left: 50px;
            }

            .slike-pocetna{
                width: 220px;
                height: 160px;
                float: left;
                margin-left: 20px;
                margin-top: 10px;
            }

            .div3 {
                float: left;
                border: 1px solid black;
                margin-top: 20px;
                margin-left: -100px;

            }


            #label1{
                font-size: 20px;
                font-weight: bold;
            }

            #label2{ /* sta znaci label */
                font-size: 20px;
                font-weight: bold;
            }

            form{
                margin-top: -60px;
                float: right; /*sta znaci float?*/
                margin-right: 55px;
                
            }

            /* id  */
            #readfullnews {
                font-size: 20px;
                font-weight: bold;

            }

        </style>

    </head>
    
    <body>
        <div class="divmain">

            <?php
            include 'C:\wamp64\www\novine\process\db.php';
            // bilo SELECT * FROM news, stavljeno po opadajucem da bi prvo bile najnovije vesti
            $sql="SELECT * FROM news order by id desc ";
            $query=mysqli_query($conn, $sql);

            while($info=mysqli_fetch_array($query)) {
                ?>

                <div class="div1">
                    <img class="slike-pocetna" src="../slike/<?php echo $info['image'];?>" alt="">
                    <div class="div2">
                        <?php echo $info['content']; ?>
                    </div>

                    <div class="div3">
                        <label id="label1"> <?php echo formatDate3($info['date']); ?> </label><br></br>
                        <label id="label2"> <?php echo formatDate1($info['date']); ?> </label>
                        <label id="label3"> <?php echo formatDate2($info['date']); ?> </label>
                    </div>
                    <form class="" action="cela_vest.php" method="post">
                        <input type="text" name="id" value="<?php echo $info['id']; ?>" hidden>
                        <!-- sta znaci hidden? - mislim da je kao nevidljivo nesto--->
                        <input id="readfullnews" type="submit" name="cela_vest" value="Procitaj celu vest">
                    </form>
                </div>

                <?php

            }

            ?>


        </div>
        
    </body>

</html>