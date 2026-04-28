<?php require_once 'controller.php'; ?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Biblioteca</title>
</head>
<body>

    <h1>Gestione Biblioteca</h1>

    <h2>Inserisci Nuovo Libro</h2>
    <form method="POST">
        Titolo: <input type="text" name="titolo" required><br><br>
        Anno: <input type="number" name="anno" required><br><br>
        ISBN: <input type="text" name="isbn" required><br><br>

        Autore:
        <select name="autore">
            <?php foreach($autori as $a) { ?>
                <option value="<?php echo $a['id_autore']; ?>">
                    <?php echo $a['nome'] . " " . $a['cognome']; ?>
                </option>
            <?php } ?>
        </select><br><br>

        <button type="submit" name="nuovo_libro">Aggiungi Libro</button>
    </form>

    <hr>

    <h2>Registra Prestito</h2>
    <form method="POST">
        Libro:
        <select name="libro">
            <?php foreach($libri as $l) { ?>
                <option value="<?php echo $l['id_libro']; ?>">
                    <?php echo $l['titolo']; ?>
                </option>
            <?php } ?>
        </select><br><br>

        Utente:
        <select name="utente">
            <?php foreach($utenti as $u) { ?>
                <option value="<?php echo $u['id_utente']; ?>">
                    <?php echo $u['nome'] . " " . $u['cognome']; ?>
                </option>
            <?php } ?>
        </select><br><br>

        <button type="submit" name="nuovo_prestito">Registra Prestito</button>
    </form>

    <hr>

    <h2>Visualizza Prestiti Utente</h2>
    <form method="GET">
        <select name="utente_id">
            <?php foreach($utenti as $u) { ?>
                <option value="<?php echo $u['id_utente']; ?>">
                    <?php echo $u['nome'] . " " . $u['cognome']; ?>
                </option>
            <?php } ?>
        </select>

        <button type="submit">Visualizza</button>
    </form>

    <br><br>

    <?php if($prestiti != null) { ?>
        <table border="1">
            <tr>
                <th>Libro</th>
                <th>Stato</th>
                <th>Azione</th>
            </tr>

            <?php foreach($prestiti as $p) { ?>
                <tr>
                    <td><?php echo $p['titolo']; ?></td>
                    <td><?php echo $p['restituito'] ? "Restituito" : "In prestito"; ?></td>
                    <td>
                        <?php if(!$p['restituito']) { ?>
                            <a href="?utente_id=<?php echo $_GET['utente_id']; ?>&restituisci=<?php echo $p['id_prestito']; ?>">
                                Restituisci
                            </a>
                        <?php } ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>

</body>
</html>