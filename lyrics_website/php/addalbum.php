<?php
    session_start();

    if(!isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] !== true) {
        header("location: main.php");
        exit;
    }

    $dateErr = $artistErr = "";
    $error = false;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["album"])) {
            $albumErr = "Last name must be provided";
            $error = true;
        }

        if (empty($_POST["date"])) {
            $dateErr = "Birth date must be provided";
            $error = true;
        } else {
            $date = $_POST["date"];
            $pattern = "/^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/";
            if (preg_match($pattern, $date) != 1) {
                $dateErr = "Invalid date format";
                $error = true;
            }
        }
        
        if ($error == false) { 
            $album = $_POST['album'];
            $date = $_POST['date'];

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

            $sql = "INSERT INTO `albumy`(`NazwaAlb`, `DataWAlb`) VALUES ('$album','$date')";
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
    <title>Add album</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="container">
        <a class="logo_link" href="main.php">lyrics</a>
        <div class="hint_text">Enter information about an album</div>
        <form class="form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
            <div class="login">
                <div class="input_hint">
                <label for="login">What's a title of an album?</label>
                </div>
                <input class="input_bar" type="text" name="album">
                <div class="error"><?php echo $artistErr;?></div>
            </div>
            <div class="login">
                <div class="input_hint">
                <label for="login">When was it released?</label>
                </div>
                <input class="input_bar" placeholder="yyyy-mm-dd" type="text" name="date">
                <div class="error"><?php echo $dateErr;?></div>
            </div>
        
            <div class="button_outer">
                <button class="btn" type="submit">Save</button>
            </div>
        </form>
    </div>
</body>
</html>