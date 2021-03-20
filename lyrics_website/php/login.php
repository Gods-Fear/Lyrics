<?php
    session_start();
    if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] === true) {
        header("location: main.php");
        exit;
    }

    // empty inputs handleing
    $loginErr = $passwordErr = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["login"])) {
            $loginErr = "Login must be provided";
        }

        if (empty($_POST["password"])) {
            $passwordErr = "Password must be provided";
        }
        
        // authentification
        if (empty($loginErr) && empty($passwordErr)) {
            $login= $_POST['login'];
            $password= $_POST['password'];

            $con = mysqli_connect('127.0.0.1', 'root');
            mysqli_select_db($con, 'isbd');

            $s = "SELECT * FROM klienci WHERE EmailK = '$login' && HasloK = '$password'";
            $result = mysqli_query($con, $s);
            $num = mysqli_num_rows($result);

            $s_data = "SELECT ImieK, NazwiskoK, IdK FROM klienci WHERE EmailK = '$login'";

            if ($result_data = mysqli_query($con, $s_data)) {
                while ($row = mysqli_fetch_row($result_data)) {
                $fname = $row[0]; 
                $lname= $row[1];
                $userid= $row[2];
                }
                mysqli_free_result($result_data);
            }

            if ($num == 1) {
                $_SESSION['login'] = $login;
                $_SESSION["logged_in"] = true;

                $_SESSION['fname'] = $fname;
                $_SESSION['lname'] = $lname;
                $_SESSION['userid'] = $userid;


                header('location:main.php');
            } else {
                $loginErr = "Login or password is not correct.";
                }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="container">
        <a class="logo_link" href="main.php">lyrics</a>
        <div class="hint_text">To continue, log in to lyrics</div>
        <form class="form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
            <div class="login">
                <div class="input_hint">
                <label for="login">Email address or username</label>
                </div>
                <input class="input_bar" type="text" name="login">
                <div class="error"><?php echo $loginErr;?></div>
            </div>
            <div class="password">
                <div class="input_hint">
                <label for="password">Password</label>
                </div>
                <input class="input_bar" type="password" name="password">
                <div class="error"><?php echo $passwordErr;?></div>
            </div>
            <div class="forgot_outer">
                <a class="forgot" href="#">Forgot your password?</a>
            </div>
            <div class="button_outer">
                <button class="btn" type="submit">Log in</button>
            </div>
        </form>
    </div>
</body>
</html>