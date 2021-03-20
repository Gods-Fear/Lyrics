<?php
    session_start();

    if(!isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] !== true) {
        header("location: main.php");
        exit;
    }

    $genderErr = $bdateErr = $artistErr = "";
    $error = false;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["artist"])) {
            $artistErr = "Last name must be provided";
            $error = true;
        } else {
            $artist = $_POST["artist"];
            // check if name only contains letters and whitespace
            if (!preg_match("/^[a-zA-Z-' ]*$/",$artist)) {
              $artistErr = "Only letters and white space allowed";
              $error = true;
            }
        }

        if (empty($_POST["bdate"])) {
            $bdateErr = "Birth date must be provided";
            $error = true;
        } else {
            $bdate = $_POST["bdate"];
            $pattern = "/^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/";
            if (preg_match($pattern, $bdate) != 1) {
                $bdateErr = "Invalid date format";
                $error = true;
            }
        }

        if (empty($_POST["gender"])) {
            $genderErr = "Gender must be selected";
            $error = true;
        }
        
        if ($error == false) { 
            $artist = $_POST['artist'];
            $bdate = $_POST['bdate'];
            $gender = $_POST['gender'];

            $servername = "127.0.0.1";
            $username = "root";
            $password = "";
            $dbname = "isbd";

            $conn = new mysqli($servername, $username, $password, $dbname);
            $conn->set_charset("utf8");
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            $sql = "INSERT INTO `artysci`(`NazwaArt`, `DataUrArt`, `PlecAr`) VALUES ('$artist','$bdate','$gender')";
            mysqli_query($conn, $sql);
            header("location:../php/mylyrics.php");
        }
    }


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add artist</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="container">
        <a class="logo_link" href="main.php">lyrics</a>
        <div class="hint_text">Enter information about an artist</div>
        <form class="form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
            <div class="login">
                <div class="input_hint">
                <label for="login">How we can call them?</label>
                </div>
                <input class="input_bar" type="text" name="artist">
                <div class="error"><?php echo $artistErr;?></div>
            </div>
            <div class="login">
                <div class="input_hint">
                <label for="login">What is their date of birth?</label>
                </div>
                <input class="input_bar" placeholder="yyyy-mm-dd" type="text" name="bdate">
                <div class="error"><?php echo $bdateErr;?></div>
            </div>
            <div class="radio_outer">
                <div class="input_hint">What their their gender?</div>
                <div class="radio">
                    <div class="male">
                    <input name="gender" value="M" type="radio">
                    <label for="male">Male</label>
                    </div>

                    <div class="female">
                    <input name="gender" value="F" type="radio">
                    <label for="male">Female</label>
                    </div>
                </div>
                <div class="error"><?php echo $genderErr;?></div>
            </div>
            
        
            <div class="button_outer">
                <button class="btn" type="submit">Save</button>
            </div>
        </form>
    </div>
</body>
</html>