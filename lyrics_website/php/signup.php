<?php
    session_start();
    if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] === true) {
        header("location: main.php");
        exit;
    }
// Define variables and initialize with empty values
    $genderErr = $bdateErr = $lnameErr = $fnameErr = $passwordErr = $email_conf_err = $email_err = "";
    $error = false;

    // check if data was privided in correct format
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["email"])) {
            $email_err = "Valid email must be provided";
            $error = true;
        } else {
            $email = test_input($_POST["email"]);
            // check if e-mail address is well-formed
            // не работает
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emailErr = "Invalid email format";
                $error = true;
            }

            $con = mysqli_connect('127.0.0.1', 'root');
            mysqli_select_db($con, 'isbd');
            
            $s = "SELECT * FROM `klienci` WHERE EmailK='$email'";
            $result = mysqli_query($con, $s);
            $num = mysqli_num_rows($result);
            if($num == 1){
                $email_err = "This email is already taken";
            }
        }

        if (empty($_POST["email_conf"])) {
            $email_conf_err = "Valid email must be provided";
            $error = true;
        } else {
            $email_conf = $_POST["email_conf"];
            if ($email != $email_conf) {
            $email_conf_err = "Emails must be same";
            $error = true;
            }
        }

        if (empty($_POST["password"])) {
            $passwordErr = "Password must be provided";
            $error = true;
        }

        if (empty($_POST["fname"])) {
            $fnameErr = "First name must be provided";
            $error = true;
        } else {
            $fname = $_POST["fname"];
            // check if name only contains letters and whitespace
            if (!preg_match("/^[a-zA-Z-' ]*$/",$fname)) {
              $fnameErr = "Only letters and white space allowed";
              $error = true;
            }
        }

        if (empty($_POST["lname"])) {
            $lnameErr = "Last name must be provided";
            $error = true;
        } else {
            $lname = $_POST["lname"];
            // check if name only contains letters and whitespace
            if (!preg_match("/^[a-zA-Z-' ]*$/",$lname)) {
              $lnameErr = "Only letters and white space allowed";
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
            $email = $_POST['email'];
            $password = $_POST['password'];
            $fname = $_POST['fname'];
            $lname = $_POST['lname'];
            $bdate = $_POST['bdate'];
            $gender = $_POST['gender'];

            $con = mysqli_connect('127.0.0.1', 'root');
            mysqli_select_db($con, 'isbd');

            $s = " select * from klienci where EmailK='$email'";
            $result = mysqli_query($con, $s);
            $num = mysqli_num_rows($result);

            if($num == 1){
                $email_err = "This email is already taken";
            } else {
                $reg= "INSERT INTO klienci(NazwiskoK, ImieK, PlecK, DataUrK, EmailK, HasloK) VALUES ('$lname', '$fname', '$gender', '$bdate', '$email', '$password')";
                mysqli_query($con, $reg);
                header("location:../html/success.html");
            }
        }
    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="../css/signup.css">
</head>
<body>
    <div class="container">
        <a class="logo_link" href="main.php">lyrics</a>
        <div class="hint_text">Sign up with your email address</div>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
            <div class="field">
                <div class="input_hint">
                <label for="email">What's your email?</label>
                </div>
                <input class="input_bar" type="text" name="email">
                <div class="error"><?php echo $email_err;?></div>
            </div>
            <div class="field">
                <div class="input_hint">
                <label for="email">Confirm your email</label>
                </div>
                <input class="input_bar" type="text" name="email_conf">
                <div class="error"><?php echo $email_conf_err;?></div>
            </div>
            <div class="field">
                <div class="input_hint">
                <label for="password">Create a password</label>
                </div>
                <input class="input_bar" type="password" name="password">
                <div class="error"><?php echo $passwordErr;?></div>
            </div>

            <div class="meet">Let's meet</div>

            <div class="field">
                <div class="input_hint">
                <label for="fname">What is your first name?</label>
                </div>
                <input class="input_bar" type="text" name="fname">
                <div class="error"><?php echo $fnameErr;?></div>
            </div>
            <div class="field">
                <div class="input_hint">
                <label for="lname">What is your last name?</label>
                </div>
                <input class="input_bar" type="text" name="lname">
                <div class="error"><?php echo $lnameErr;?></div>
            </div>
            <div class="field">
                <div class="input_hint">
                <label for="bdate">What is your date of birth?</label>
                </div>
                <input class="input_bar" placeholder="yyyy-mm-dd" type="text" name="bdate">
                <div class="error"><?php echo $bdateErr;?></div>
            </div>

            <div class="radio_outer">
                <div class="radio_hint">What is your gender?</div>
                <div class="radio">
                    <div class="male">
                    <input name="gender" value="M" type="radio">
                    <label for="male">Male</label>
                    </div>

                    <div class="female">
                    <input name="gender" value="F" type="radio">
                    <label for="male">Female</label>
                    </div>

                    <div class="secr">
                    <input name="gender" value="S" type="radio">
                    <label for="male">It's a secret</label>
                    </div>
                </div>
                <div class="error"><?php echo $genderErr;?></div>
            </div>
            
            <div class="button_outer">
                <button class="btn" type="submit"> Sign up</button>
            </div>

            <div class="have_outer">
                Have an account?
                <a class="have" href="login.php">Log in</a>
            </div>
        </form>
    </div>
</body>
</html>