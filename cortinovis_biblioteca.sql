-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 16, 2026 alle 09:19
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cortinovis_biblioteca`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autori`
--

CREATE TABLE `autori` (
  `id_autore` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `nazionalita` varchar(50) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `autori`
--

INSERT INTO `autori` (`id_autore`, `nome`, `cognome`, `nazionalita`, `data_nascita`) VALUES
(1, 'Umberto', 'Eco', 'Italiana', '1932-01-05'),
(2, 'George', 'Orwell', 'Britannica', '1903-06-25'),
(3, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
(4, 'Virginia', 'Woolf', 'Britannica', '1882-01-25'),
(5, 'Italo', 'Calvino', 'Italiana', '1923-10-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `libri`
--

CREATE TABLE `libri` (
  `id_libro` int(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `anno_pubblicazione` int(11) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `id_autore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `libri`
--

INSERT INTO `libri` (`id_libro`, `titolo`, `anno_pubblicazione`, `isbn`, `id_autore`) VALUES
(1, 'Il nome della rosa', 1980, '978-8845278655', 1),
(2, '1984', 1949, '978-0451524935', 2),
(3, 'Cent\'anni di solitudine', 1967, '978-8804702337', 3),
(4, 'Al faro', 1927, '978-8806219154', 4),
(5, 'Le città invisibili', 1972, '978-8804675761', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `prestiti`
--

CREATE TABLE `prestiti` (
  `id_prestito` int(11) NOT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `data_inizio` date NOT NULL,
  `data_fine_prevista` date NOT NULL,
  `restituito` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prestiti`
--

INSERT INTO `prestiti` (`id_prestito`, `id_libro`, `id_utente`, `data_inizio`, `data_fine_prevista`, `restituito`) VALUES
(1, 1, 1, '2023-10-01', '2023-10-15', 1),
(2, 2, 2, '2023-10-05', '2023-10-20', 0),
(3, 3, 3, '2023-10-10', '2023-10-25', 0),
(4, 4, 4, '2023-10-12', '2023-10-27', 1),
(5, 5, 5, '2023-10-15', '2023-10-30', 0),
(6, 1, 3, '2023-11-01', '2023-11-15', 1),
(7, 5, 1, '2023-11-05', '2023-11-20', 0),
(8, 2, 4, '2023-11-10', '2023-11-25', 1),
(9, 4, 2, '2023-11-12', '2023-11-27', 0),
(10, 3, 5, '2023-11-20', '2023-12-05', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `data_iscrizione` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `nome`, `cognome`, `email`, `data_iscrizione`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.it', '2023-01-10'),
(2, 'Giulia', 'Bianchi', 'g.bianchi@email.it', '2023-02-15'),
(3, 'Luca', 'Verdi', 'luca.verdi@email.com', '2023-03-20'),
(4, 'Elena', 'Neri', 'elena.neri@provider.com', '2023-05-12'),
(5, 'Marco', 'Gialli', 'm.gialli@email.it', '2023-06-01');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autori`
--
ALTER TABLE `autori`
  ADD PRIMARY KEY (`id_autore`);

--
-- Indici per le tabelle `libri`
--
ALTER TABLE `libri`
  ADD PRIMARY KEY (`id_libro`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `id_autore` (`id_autore`);

--
-- Indici per le tabelle `prestiti`
--
ALTER TABLE `prestiti`
  ADD PRIMARY KEY (`id_prestito`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autori`
--
ALTER TABLE `autori`
  MODIFY `id_autore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `libri`
--
ALTER TABLE `libri`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `prestiti`
--
ALTER TABLE `prestiti`
  MODIFY `id_prestito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `libri`
--
ALTER TABLE `libri`
  ADD CONSTRAINT `libri_ibfk_1` FOREIGN KEY (`id_autore`) REFERENCES `autori` (`id_autore`) ON DELETE SET NULL;

--
-- Limiti per la tabella `prestiti`
--
ALTER TABLE `prestiti`
  ADD CONSTRAINT `prestiti_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libri` (`id_libro`) ON DELETE CASCADE,
  ADD CONSTRAINT `prestiti_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
