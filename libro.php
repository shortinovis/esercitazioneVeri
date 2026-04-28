<?php

class Libro {

    public static function getAll($conn) {
        $sql = "SELECT * FROM Libri";
        return $conn->query($sql);
    }

    public static function create($conn, $titolo, $anno, $isbn, $autore) {
        $sql = "INSERT INTO Libri (titolo, anno_pubblicazione, isbn, id_autore)
                VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$titolo, $anno, $isbn, $autore]);
    }
}

?>