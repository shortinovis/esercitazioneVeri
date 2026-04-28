<?php

require_once 'db.php';
require_once 'libro.php';
require_once 'prestito.php';


if (isset($_POST['nuovo_libro'])) {
    Libro::create($conn, $_POST['titolo'], $_POST['anno'], $_POST['isbn'], $_POST['autore']);
}

if (isset($_POST['nuovo_prestito'])) {
    Prestito::create($conn, $_POST['libro'], $_POST['utente']);
}

if (isset($_GET['restituisci'])) {
    Prestito::restituisci($conn, $_GET['restituisci']);
}


$autori = $conn->query("SELECT * FROM Autori");
$libri = $conn->query("SELECT * FROM Libri");
$utenti = $conn->query("SELECT * FROM Utenti");

$prestiti = null;

if (isset($_GET['utente_id'])) {
    $prestiti = Prestito::getByUtente($conn, $_GET['utente_id']);
}

?>