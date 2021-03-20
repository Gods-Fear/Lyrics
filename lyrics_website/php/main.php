<?php
session_start();

if (!isset($_SESSION["logged_in"])) {
    $_SESSION["logged_in"] = false;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <div id="intro_grad_backgr" class="intro">
        <nav>
            <?php 
            if ($_SESSION["logged_in"] == true) {
                echo ("<div class='profile_link_wrapper'>
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
                </div>
                </div>");
            } else {
                echo ("<a class='nav_log_in' href='login.php'> Log in</a>
                <a class='nav_sign_up' href='signup.php'> Sign up</a>");
            }
            ?>
        </nav>
        <div class="logo_search_bar">
            <div class="logo">
                <div class="logo_inner">lyrics</div>
            </div>
            <div class="search_bar">
                <form action="search_results.php" method="get"><input id="site-search" name='search_request' type="text" placeholder="Search songs, albums or artists..."></form>
            </div>
        </div>
    </div>
</body>
</html>