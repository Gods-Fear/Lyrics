<?php
    session_start();

    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "isbd";
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset("utf8");

    $songid = $_GET['songid'];
    $userid = $_SESSION['userid'];

    if (!empty($_POST)){

        if (isset($_POST["action_type"]) && $_POST["action_type"] == "fav") {
            $songid = $_POST['songid'];
            $userid = $_POST['postid'];

            if (isset($_POST['liked'])) {        
                mysqli_query($conn, "INSERT INTO `listyulub`(`IdK`, `IdU`) VALUES ('$userid', '$songid')");
            }
            if (isset($_POST['unliked'])) {        
                mysqli_query($conn, "DELETE FROM `listyulub` WHERE `IdK`='$userid' AND `IdU`='$songid'");
            }
            die();
        }

        if (isset($_POST["action_type"]) && $_POST["action_type"] == "comment") {
            $text = $_POST["comment_text"];
            $time = date("Y-m-d H:i:s");
            // echo $text;

            // if (!$conn -> query("INSERT INTO `komentarze`(`TrescKom`, `DataKom`, `IdK`, `IdU`) VALUES ('$text', '$time', $userid, $songid)")) {
            //     echo("Error description: " . $conn -> error);
            //   }
            mysqli_query($conn, "INSERT INTO `komentarze`(`TrescKom`, `DataKom`, `IdK`, `IdU`) VALUES ('$text', '$time', $userid, $songid)");
            // mysqli_query($conn, "INSERT INTO `komentarze`(`TrescKom`, `DataKom`, `IdK`, `IdU`) VALUES ('bla bla bla', '2021-01-11 13:15:05', '1', '1')");
            header("location: lyrics_page.php?songid=$songid");
            
        }
    }

    if (!isset($_SESSION["logged_in"])) {
        $_SESSION["logged_in"] = false;
    }

    function time_elapsed_string($datetime, $full = false) {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);
    
        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;
    
        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }
    
        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track - Artist - lyrics</title>
    <link rel="stylesheet" href="../css/lyrics_page.css">
</head>
<body>
<div class="profile_photo_modal">
        <div class="modal_content">
            <div class="modal_header">Modify comment</div>
            <div class="modal_form">
                <form method="post" class="form" action="">
                    <input type="hidden"  name="action_type" value="modify"/>
                    <input type="hidden" id="commid_input" name="commid" value=""/>
                    <!-- <input type="hidden" id="userid_input" name="commid" value=""/> -->
                    <input placeholder="Type your comment..." value="test" id="comment_input" type="text" name="comment_text">
                    <div class="center"><input class="btn" type="submit"></div>
                </form>
            </div>
        </div>
    </div>

    <div class="header_wrapper">
        <div class="header_bar">
            <div class="container">
                <div class="logo_wrapper">
                    <a class="logo_link" href="main.php">lyrics</a>
                </div>

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
                    <!-- <div class='my_lyrics'>
                        <a id='my_lyrics_btn' href='#'>My lyrics</a>
                    </div>
                    <div class='profile_img'>
                        <img id='profile_photo' src='https://via.placeholder.com/50' alt='Avatar'>
                    </div>
                    <div class='profile_name'>
                        Artem Kovalenko
                    </div>
                    <div class='log_out'>
                        <a href='logout.php'>Log out</a>
                    </div> -->
                    <!-- <div class='log_out'>
                        <a href='login.php'>Log in</a>
                    </div> -->
                    <div class="search_bar">
                    <form action="search_results.php" method="get"><input id="site-search" name='search_request' type="text" placeholder="Search..."></form>
                    </div>
                </div>
            </div>
        </div>
        <div class="header_song_info">
            <div class="container">
            <?php            
            
            $sql = "SELECT utworym.NazwaU, albumy.NazwaAlb, artysci.NazwaArt, albumy.ObrazAlb, utworym.IdU, utworym.TekstU
            FROM albumy INNER JOIN (artysci INNER JOIN utworym ON artysci.IdArt=utworym.IdArt) ON albumy.IdAlb=utworym.IdAlb
            WHERE utworym.IdU=$songid";
            
            $result = $conn->query($sql);

            $sql1 = "SELECT * FROM `listyulub` WHERE `IdK`=$userid AND `IdU`=$songid";
                $like = $conn->query($sql1);
                $num = mysqli_num_rows($like);
        
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();

                echo ('<div class="img_wrapper">
                <img src="../img/'. $row["ObrazAlb"].'" alt="Avatar" class="img">
            </div>

            <div class="info_wrapper">
                <div class="title">'. $row["NazwaU"].'</div>
                <div class="artist">'. $row["NazwaArt"].'</div>
                <div class="album">'. $row["NazwaAlb"].'</div>
                <div id="fav" class="fav_button">');

                if ($num == 1) {
                    echo ('<img class="fav_img unlike" src="../img/liked.png" alt="Add to favorites">');
                    echo ('<img class="fav_img like hide" src="../img/notliked.png" alt="Add to favorites">');
                } else {
                    echo ('<img class="fav_img unlike hide" src="../img/liked.png" alt="Add to favorites">');
                    echo ('<img class="fav_img like" src="../img/notliked.png" alt="Add to favorites">');
                };
                echo ('
                </div>
            </div>
        </div>
    </div>
</div>
<div class="narrow_container">
    <div class="text">
        <pre>'. $row["TekstU"].'</pre>
    </div>');}
            else {
                echo "<p style='text-align:center;font-size:50px;color:white;'>Error 404 :(</p>";
                die();
        }
                 echo ('
        <div class="comments">
            <div class="comments_header">
                Comments
            </div>
            <di class="comment_input">
                <form method="post" action="">
                    <input type="hidden" name="action_type" value="comment" />
                    <input placeholder="Type your comment..." id="comment_input" type="text" name="comment_text">
                </form>
            </di>');
            $comment_sql = "SELECT komentarze.IdKom, komentarze.TrescKom, komentarze.DataKom, komentarze.IdU, klienci.ImieK, klienci.NazwiskoK FROM komentarze INNER JOIN klienci ON komentarze.IdK=klienci.IdK 
            WHERE komentarze.IdU ='$songid' ORDER BY DataKom DESC";
            $comments = $conn->query($comment_sql);

            if ($comments->num_rows > 0) {
                // echo "we're here";
                while($row = $comments->fetch_assoc()) {
                    $commentid = $row["IdKom"];
                  echo ('
            <div class="comment_wrapper">
                <div class="user">
                    <div class="avatar">
                        <img id="profile_photo" src="https://via.placeholder.com/50" alt="Avatar">
                    </div>
                    <div class="name">'. $row["ImieK"].' '. $row["NazwiskoK"].'</div>
                    <div class="date">');
                    echo time_elapsed_string($row["DataKom"]);
                    echo('</div>
                </div>
                <div class="comment_text">
                    '. $row["TrescKom"].'
                </div>
                <div class="bottom_bar">
                    <div class="buttons">
                        <div class="detele">Delete</div>
                        <div class="modify">Modify</div>
                        
                    </div>
                </div>
            </div>
                ');
                }
            }
            else {
                echo "<p style='text-align:center;'>There is no any comments yet. Be the first one!</p>";
          }
          $conn->close();
                ?>
            <!-- <div class="comment_wrapper">
                <div class="user">
                    <div class="avatar">
                        <img id="profile_photo" src="https://via.placeholder.com/50" alt="Avatar">
                    </div>
                    <div class="name">Artem Kovalenko</div>
                    <div class="date">2 days ago</div>
                </div>
                <div class="comment_text">
                    Comment comment comment comment comment comment 
                    comment comment comment
                </div>
                <div class="bottom_bar">
                    <div class="buttons">
                        <div class="detele">del</div>
                        <div class="modify">mod</div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            // when the user clicks on like
            $('.like').on('click', function(){
                var postid = "<?= $userid?>";
                var songid = "<?= $songid?>";

                $.ajax({
                    url: 'lyrics_page.php',
                    type: 'post',
                    data: {
                        'liked': 1,
                        'postid': postid,
                        'songid': songid,
                        'action_type': 'fav'
                    },
                    success: function(response){
                        // console.log(response);
                        $('.like').addClass('hide');
                        $('.unlike').removeClass('hide');
                    }
                });
            });

            // when the user clicks on unlike
            $('.unlike').on('click', function(){
                var postid = "<?= $userid?>"
                var songid = "<?= $songid?>";

                $.ajax({
                    url: 'lyrics_page.php',
                    type: 'post',
                    data: {
                        'unliked': 1,
                        'postid': postid,
                        'songid': songid,
                        'action_type': 'fav'
                    },
                    success: function(response){
                        // console.log(response);
                        $('.unlike').addClass('hide');
                        $('.like').removeClass('hide');
                    }
                });
            });
        });
    </script>

    <script>
        var modal = document.getElementsByClassName("profile_photo_modal");
        // var btn = document.getElementsByClassName("modify");
        // var btn = document.getElementById("mod_button");

        var test = function() {
            // var modal = document.getElementsByClassName("profile_photo_modal");
            var comm_id = document.getElementById("mod_button").dataset.comment;
            var comm = document.getElementById("mod_button").dataset.comment_text;
            var user_id = document.getElementById("mod_button").dataset.user;
            var comm_id_input = document.getElementById("commid_input");
            var comm_input = document.getElementById("comment_input");

            // alert(comm + user_id + comm_id);
            comm_input.value = comm;
            modal[0].style.display = "block";
        }

        // var comm_id = document.getElementById("mod_button").dataset.comment;
        // var comm = document.getElementById("mod_button").dataset.comment_text;
        // var user_id = document.getElementById("mod_button").dataset.user;
        // var comm_id_input = document.getElementById("commid_input");
        // var comm_input = document.getElementById("comment_input");
        
        // btn.onclick = function() {
        //     comm_input.value = comm;
        //   modal[0].style.display = "block";
        // }
        
        window.onclick = function(event) {
          if (event.target == modal[0]) {
            modal[0].style.display = "none";
          }
        }
    </script>
    <script>
        function callCrudAction(action,id) {
        $("#loaderIcon").show();
        var queryString;

        switch(action) {
            case "add":
                queryString = 'action='+action+'&txtmessage='+ $("#txtmessage").val();
                break;
            case "edit":
                queryString = 'action='+action+'&message_id='+ id + '&txtmessage='+ $("#txtmessage_"+id).val();
                break;
            case "delete":
            queryString = 'action='+action+'&message_id='+ id;
            break;}

        jQuery.ajax({
            url: "crud_action.php",
            data:queryString,
            type: "POST",
            success:function(data){

                switch(action) {

                    case "add":
                        $("#comment-list-box").append(data);
                        break;

                    case "edit":
                        $("#message_" + id + " .message-content").html(data);
                        $('#frmAdd').show();
                    break;

                    case "delete":
                        $('#message_'+id).fadeOut();
                        break;
                }
                $("#txtmessage").val('');
            $("#loaderIcon").hide();
        },
        });}    
    </script>
</body>
</html>