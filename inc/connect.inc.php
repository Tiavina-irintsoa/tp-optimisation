<?php
$host = "localhost";
$username = "root";
$password = "Etu001840!";
$database = "ebuybd";

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