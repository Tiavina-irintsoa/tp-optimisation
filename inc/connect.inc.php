    <?php
// $host = "sql203.infinityfree.com";
$host = "localhost";
$username = "root";
// $username = "if0_36134675";
$password = "";
// $password = "h038Gs45X0c5Y";
// $database = "if0_36134675_ebuybd";
$password = "Etu001840!";
// $password = "h038Gs45X0c5Y";
$database = "ebuybd";
// $database = "if0_36134675_ebuybd";

try {
    $mysqli = new mysqli($host, $username, $password, $database);

    // Check connection
    if ($mysqli->connect_error) {
        throw new Exception("Couldn't connect to MySQL: " . $mysqli->connect_error);
    }

    // echo "Connected successfully!\n";

    // Select the database
    if (!$mysqli->select_db($database)) {
        throw new Exception("Couldn't select database: " . $mysqli->error);
    }

    // echo "Database selected successfully!\n";

    // Additional code...

} catch (Exception $e) {
    die($e->getMessage());
} 
?>