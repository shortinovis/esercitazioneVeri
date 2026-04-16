<?php
require_once 'controller.php';


$html = file_get_contents("view.html");


$html = str_replace("{{AUTORI}}", $autori_html, $html);
$html = str_replace("{{LIBRI}}", $libri_html, $html);
$html = str_replace("{{UTENTI}}", $utenti_html, $html);
$html = str_replace("{{PRESTITI}}", $prestiti_html, $html);


echo $html;
?>