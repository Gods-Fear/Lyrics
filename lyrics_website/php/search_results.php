<?php
    session_start();

    if (!isset($_SESSION["logged_in"])) {
        $_SESSION["logged_in"] = false;
    }
    $search_request = $_GET["search_request"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link rel="stylesheet" href="../css/search_results.css">
</head>
<body>
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
                        <a id='my_lyrics_btn' href='mylyrics.php'>My lyrics</a>
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
            <div class="title">Search results for: "<?php echo $search_request;?>"</div>
            <!-- <button id="add_button" class="button">Add</button> -->
        </div>
        <div class="list">
            <?php 
            $servername = "127.0.0.1";
            $username = "root";
            $password = "";
            $dbname = "isbd";
        
            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);
            $conn->set_charset("utf8");
            // Check connection
            if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
            }
            
            $sql = "SELECT utworym.NazwaU, albumy.NazwaAlb, artysci.NazwaArt, albumy.ObrazAlb, utworym.IdU
            FROM albumy INNER JOIN (artysci INNER JOIN utworym ON artysci.IdArt=utworym.IdArt) ON albumy.IdAlb=utworym.IdAlb
            WHERE NazwaU LIKE '%$search_request%' OR albumy.NazwaAlb LIKE '%$search_request%' OR artysci.NazwaArt LIKE '%$search_request%'";
            
            $result = $conn->query($sql);
        
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  echo ('<a class="section_link" href="lyrics_page.php?songid='. $row["IdU"].'">
                  <div class="section">
                <div class="cover_wrapper">
                    <img id="cover" src="../img/'. $row["ObrazAlb"].'" alt="Avatar">
                </div>
                <div class="track_info">
                    <div class="track_title">'. $row["NazwaU"].'</div>
                    <div class="artist">'. $row["NazwaArt"].'</div>
                    <div class="album">'. $row["NazwaAlb"].'</div>
                </div>
            </div>
            </a>');
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
            </div> -->
        
        </div>
    </div>
</body>
</html>