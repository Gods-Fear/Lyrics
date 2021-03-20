<?php
    session_start();
    $userid = $_SESSION['userid'];

    if (!isset($_SESSION["logged_in"])) {
        $_SESSION["logged_in"] = false;
    }

    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "isbd";
    $passErr = "";
    $passeqErr = "";
    $email_err = "";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    $conn->set_charset("utf8");
    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM `klienci` WHERE IdK='$userid'";

    $result = $conn->query($sql);
    $row = $result->fetch_assoc();


    if (!empty($_POST)){

        if (isset($_POST["action_type"]) && $_POST["action_type"] == "new_pass") {
            if ($_POST["password"] == $row["HasloK"]) {
                $pass = $_POST['password'];
                $pass_new = $_POST['new_password'];
                $pass_conf = $_POST['conf_password'];

                if ($pass_new == $pass_conf) {

                    if (strlen($pass_new) >= 8) {
                        $sql = "UPDATE `klienci` SET `HasloK`='$pass_new' WHERE `IdK`='$userid'";
                        $result = $conn->query($sql);
                        header("location: ../html/ch_passw.html");
                        }
                    else {
                        $passeqErr = "Passward must contain at least 8 symbols.";
                    }
                } else {
                    $passeqErr = "Passwords must be same";
                }
                
            } else {
                $passErr = "Wrong password!";
            }
        }

        if (isset($_POST["action_type"]) && $_POST["action_type"] == "new_mail") {
            // echo "hi";
            $mail = $_POST["email"];
            $s = " select * from klienci where EmailK='$mail'";
            $result = mysqli_query($conn, $s);
            $num = mysqli_num_rows($result);

            if($num == 1){
                $email_err = "This email is already taken";
            } else {
                $reg= "UPDATE `klienci` SET `EmailK`='$mail' WHERE `IdK`='$userid'";
                mysqli_query($conn, $reg);
                header("location:../html/ch_mail.html");
                }
            }

        if (isset($_POST["action_type"]) && $_POST["action_type"] == "delete_prof") {
            $_SESSION["logged_in"] = false;
            $sql = "DELETE FROM `klienci` WHERE `IdK`='$userid'";
            $result = $conn->query($sql);
            header("location: ../html/delacc.html");
        }
    }
    
    
    $lname = $row["NazwiskoK"];
    $fname = $row["ImieK"];
    $email = $row["EmailK"];
    $birthdate = $row["DataUrK"];
    $gender = $row["PlecK"];
    $avarar = $row["ZdjK"];

    $conn->close();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link rel="stylesheet" href="../css/profile.css">
</head>
<body>
    <script>
    // const file = document.querySelector('#file');
    // file.addEventListener('change', (e) => {

    // // Get the selected file
    // const [file] = e.target.files;

    // // Get the file name and size
    // const { name: fileName, size } = file;

    // });
    
    </script>

    
    
    
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
        <div class="left_panel">
            <div class="profile_picture">
                <img id='picture' src='../img/avatar.png' alt='https://via.placeholder.com/260'>
            </div>
            <div class="action_buttons">
                <input type="file" name="file" class="btn_upload" id="file">
                <label for="file">Change an avatar</label>
            </div>
        </div>
        <div class="right_panel">
            <div class="section">
                <div class="section_title">Profile information</div>
                <div class="user_name"><?php echo $fname, ' ', $lname;?></div>
                <div class="info_wrapper">
                    <div class="info_title">Email</div>
                    <div class="info"><?php echo $email;?></div>
                </div>
                <div class="info_wrapper">
                    <div class="info_title">Date of birth</div>
                    <div class="info"><?php echo $birthdate;?></div>
                </div>
                <div class="info_wrapper">
                    <div class="info_title">Gender</div>
                    <div class="info"><?php echo $gender;?></div>
                </div>
                <hr>
            </div>

            <div class="section">
                <div class="section_title">Password</div>
                <form method="post" action="" class="form">
                    <input type="hidden"  name="action_type" value="new_pass"/>
                    <div class="form_section">
                        <label for="password">Current password</label>
                        <input class="input_bar" type="password" name="password">
                        <div class="error"><?php echo $passErr;?></div>
                    </div>
                    <div class="form_section">
                        <label for="new_password">New password</label>
                        <input class="input_bar" type="password" name="new_password">
                        <div class="error"><?php echo $passeqErr;?></div>
                    </div>
                    <div class="form_section">
                        <label for="conf_password">Confirm password</label>
                        <input class="input_bar" type="password" name="conf_password">
                    </div>
                    <div class="button_wrapper">
                        <button class="btn_submit" type="submit">Set new password</button>
                    </div>
                </form>
                <hr>
            </div>

            <div class="section">
                <div class="section_title">Email</div>
                <form action="" class="form" method="post">
                    <input type="hidden"  name="action_type" value="new_mail"/>
                    <div class="form_section">
                        <label for="email">New email address</label>
                        <input class="input_bar" type="email" name="email">
                        <div class="error"><?php echo $email_err;?></div>
                    </div>
                    <div class="button_wrapper">
                        <button class="btn_submit" type="submit">Set new email</button>
                    </div>
                </form>
                <hr>
            </div>

            <div class="section">
                <div class="section_title">Delete account</div>
                You can delete all your user data including lyrics you added.<br> 
                This <b>cannot</b> be undone <b>after you click</b> red button. 
                <div class="button_wrapper">
                    <form method="post">
                    <input type="hidden"  name="action_type" value="delete_prof"/>
                    <button class="btn_delete" type="submit">Delete account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- <div class="profile_photo_modal">
        <div class="modal_header"></div>
        <div class="modal_content">
            <div class="left_side">
                <div class="picture_frame">
                    <img id='picture' src='https://via.placeholder.com/235  ' alt='Avatar'>
                </div>
                <div class="button">button</div>
            </div>
            <div class="right_side"></div>
        </div>
    </div> -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="../js/resample.js"></script>
    <script src="../js/avatar.js"></script>
</body>
</html>