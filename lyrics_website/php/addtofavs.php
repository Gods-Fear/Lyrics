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
    
    $idK = $_GET['userid'];
    $idU = $_GET['trackid'];

    $sql = "SELECT * FROM `listyulub` WHERE `IdK`=$idK AND `IdU`=$idU";
    
    $result = $conn->query($sql);
    $num = mysqli_num_rows($result);

    if ($num == 1) {
        echo ('<img class="fav_img" src="../img/liked.png" alt="Add to favorites">');
    } else {
        echo ('<img class="fav_img" src="../img/notliked.png" alt="Add to favorites">');
        
        $sql = "INSERT INTO `listyulub`(`IdK`, `IdU`) VALUES ($idK, $idU)";
        $result = $conn->query($sql);
    }

    $conn->close();
?>