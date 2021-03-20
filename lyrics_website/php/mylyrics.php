<?php
    session_start();

    if (!isset($_SESSION["logged_in"])) {
        $_SESSION["logged_in"] = false;
    }

    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "isbd";
    $userid = $_SESSION['userid'];
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset("utf8");
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if (!empty($_POST)){

        $title = $_POST['title'];
        $album_id = $_POST['album'];
        $artist_id = $_POST['artist'];
        $lyrics = $_POST['lyrics'];

        // echo $title;
        // echo $album_id;
        // echo $artist_id;
        // echo $lyrics;

        $add = "INSERT INTO `utworym` (`NazwaU`, `TekstU`, `IdAlb`, `IdArt`, `IdK`) VALUES ('$title','$lyrics','$album_id','$artist_id','$userid')";
        mysqli_query($conn, $add);

    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link rel="stylesheet" href="../css/mylyrics.css">
</head>
<body>
    <div class="profile_photo_modal">
        <div class="modal_content">
            <div class="modal_header">Add lyrics</div>
            <div class="modal_form">
                <?php 
                
                
                // <div class="left_side">
                //     <div class="picture_frame">
                //         <img id="picture" src="https://via.placeholder.com/235" alt="Avatar">
                //     </div>
                //     <div class="button_wrapper">
                //         <button class="button_picture">Choose picture</button>
                //     </div>
                // </div>
                echo ('
                <div class="right_side">
                    <form method="post" action="'); ?>
                    <?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>
                    <?php echo ('">
                    <div class="field">
                        <div class="input_hint">
                        <label for="title">Title</label>
                        </div>
                        <input class="input_bar" type="text" name="title">
                    </div>
                    <div class="field">
                        <div class="input_hint">
                        <label for="title">Album</label>
                        </div>
                        <select class="input_bar" name="album">');
                        $sql_alb = "SELECT `IdAlb`, `NazwaAlb` FROM `albumy`";
                        $result = $conn->query($sql_alb);
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                echo ('<option value="' .$row["IdAlb"].'">' .$row["NazwaAlb"].'</option>');
                            }
                        }
                        echo ('
                        </select>
                    </div>
                    <div class="field">
                        <div class="input_hint">
                        <label for="title">Artist</label>
                        </div>
                        <select class="input_bar" name="artist">');
                        $sql_art = "SELECT `IdArt`, `NazwaArt` FROM `artysci`";
                        $result = $conn->query($sql_art);
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                echo ('<option value="' .$row["IdArt"].'">' .$row["NazwaArt"].'</option>');
                            }
                        }
                        echo ('
                        </select>
                    </div>
                    
                    <div class="field_wide">
                        <div class="input_hint">
                        <label for="title">Lyrics</label>
                        </div>
                        <textarea class="input_bar" type="text" name="lyrics"></textarea>
                    </div>
                    <button class="button_save">Save</button>
                    </form>
                </div> ');
                ?>

            </div>
        </div>
    </div>
    </div>

    <div class="header_bar">
        <div class="logo_wrapper">
            <a class="logo_link" href="main.php">lyrics</a>
        </div>
        <div class="user_info">
            <div class='profile_link_wrapper'>
                <?php 
                if ($_SESSION["logged_in"] == true) {
                    echo ("
                    <div class='my_lyrics'>
                        <a id='my_lyrics_btn' href='#'>My lyrics</a>
                    </div>
                    <div class='profile_img'>
                        <img id='profile_photo' src='https://via.placeholder.com/50' alt='Avatar'>
                    </div>
                    <div class='profile_name'><a style='text-decoration:none;color:white' href='profile.php'>");
                        echo $_SESSION['fname'], ' ', $_SESSION['lname'];
                    echo("
                    </a></div>
                    <div class='log_out'>
                        <a href='logout.php'>Log out</a>
                    </div>");
                } else {
                    echo ("<div class='log_out'>
                    <a href='login.php'>Log in</a>
                </div>");
                }
                ?>
                <div class="search_bar">
                    <form action="search_results.php" method="get"><input id="site-search" name='search_request' type="text" placeholder="Search..."></form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="title_bar">
            <div class="title">My lyrics</div>
            <div class="wrapper">
                <button id="artist_button" class="button"><a href="addartist.php">Add artist</a></button>
                <button id="album_button" class="button"><a href="addalbum.php">Add album</a></button>
                <button id="add_button" class="button">Add lyrics</button>
            </div>
        </div>
        <div class="list">
            <?php 
                $sql = "SELECT utworym.NazwaU, albumy.NazwaAlb, artysci.NazwaArt, albumy.ObrazAlb, utworym.IdU, utworym.IdK
                FROM albumy INNER JOIN (artysci INNER JOIN utworym ON artysci.IdArt=utworym.IdArt) ON albumy.IdAlb=utworym.IdAlb
                WHERE `IdK`=$userid ORDER BY IdU DESC";
                $result = $conn->query($sql);
            
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                    echo ('
                    <div class="section">
                        <a class="section_link" href="lyrics_page.php?songid='. $row["IdU"].'">
                            <div class="cover_wrapper">
                                <img id="cover" src="../img/'. $row["ObrazAlb"].'" alt="Avatar">
                            </div>
                        </a>
                        <a class="section_link" href="lyrics_page.php?songid='. $row["IdU"].'">
                            <div class="track_info">
                                <div class="track_title">'. $row["NazwaU"].'</div>
                                <div class="artist">'. $row["NazwaArt"].'</div>
                                <div class="album">'. $row["NazwaAlb"].'</div>
                            </div>
                        </a>
                    </a>
                    <div class="buttons">
                        <button class="button">Delete</button>
                        <button class="button">Modify</button>
                    </div>
                </div>
                ');
                    }
                } else {
                    echo "Nothing was found :(";
                }
                $conn->close();
                ?>
            <!-- <div class="section">
                <div class="cover_wrapper">
                    <img id='cover' src='https://via.placeholder.com/130' alt='Avatar'>
                </div>
                <div class="track_info">
                    <div class="track_title">Title Title Title Title Title T</div>
                    <div class="artist">Artist</div>
                    <div class="album">Album</div>
                </div>
                <div class="buttons">
                    <button class="button">Delete</button>
                    <button class="button">Modify</button>
                </div>
            </div> -->

        </div>
    </div>
    <script>
        var modal = document.getElementsByClassName("profile_photo_modal");
        var btn = document.getElementById("add_button");
        btn.onclick = function() {
          modal[0].style.display = "block";
        }
        
        window.onclick = function(event) {
          if (event.target == modal[0]) {
            modal[0].style.display = "none";
          }
        }
    </script>
</body>
</html>