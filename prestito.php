<?php

class Prestito {

    public static function create($conn, $libro, $utente) {
        $oggi = date('Y-m-d');
        $fine = date('Y-m-d', strtotime('+15 days'));

        $sql = "INSERT INTO Prestiti (id_libro, id_utente, data_inizio, data_fine_prevista)
                VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$libro, $utente, $oggi, $fine]);
    }

    public static function restituisci($conn, $id) {
        $sql = "UPDATE Prestiti SET restituito = 1 WHERE id_prestito = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
    }

    public static function getByUtente($conn, $id) {
        $sql = "SELECT p.*, l.titolo
                FROM Prestiti p
                JOIN Libri l ON p.id_libro = l.id_libro
                WHERE p.id_utente = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt;
    }
}

?>