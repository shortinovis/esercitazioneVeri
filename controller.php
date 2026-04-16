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




$autori_html = "";
$res = $conn->query("SELECT * FROM Autori");
while($a = $res->fetch_assoc()) {
    $autori_html .= "<option value='{$a['id_autore']}'>{$a['nome']} {$a['cognome']}</option>";
}


$libri_html = "";
$res = $conn->query("SELECT * FROM Libri");
while($l = $res->fetch_assoc()) {
    $libri_html .= "<option value='{$l['id_libro']}'>{$l['titolo']}</option>";
}


$utenti_html = "";
$res = $conn->query("SELECT * FROM Utenti");
while($u = $res->fetch_assoc()) {
    $utenti_html .= "<option value='{$u['id_utente']}'>{$u['nome']} {$u['cognome']}</option>";
}


$prestiti_html = "";

if (isset($_GET['utente_id'])) {
    $id = $_GET['utente_id'];

    $res = $conn->query("SELECT p.*, l.titolo
                         FROM Prestiti p
                         JOIN Libri l ON p.id_libro = l.id_libro
                         WHERE p.id_utente = $id");

    while($p = $res->fetch_assoc()) {
        $stato = $p['restituito'] ? "Restituito" : "In prestito";

        $azione = "";
        if (!$p['restituito']) {
            $azione = "<a href='?utente_id=$id&restituisci={$p['id_prestito']}'>Restituisci</a>";
        }

        $prestiti_html .= "
        <tr>
            <td>{$p['titolo']}</td>
            <td>$stato</td>
            <td>$azione</td>
        </tr>";
    }
}
?>