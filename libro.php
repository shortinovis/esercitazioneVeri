<?php
class Libro {

    public static function getAll($conn) {
        return $conn->query("SELECT * FROM Libri");
    }

    public static function create($conn, $titolo, $anno, $isbn, $autore) {
        $conn->query("INSERT INTO Libri (titolo, anno_pubblicazione, isbn, id_autore)
                      VALUES ('$titolo','$anno','$isbn','$autore')");
    }
}
?>