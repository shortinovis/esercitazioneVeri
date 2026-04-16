<?php
$conn = new mysqli("localhost", "root", "", "biblioteca");

if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}
?>