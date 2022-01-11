-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 12 avr. 2018 à 20:38
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bugdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `bug`
--

CREATE TABLE `bug` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(400) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(15) NOT NULL,
  `priority` int(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `project_id` int(20) DEFAULT NULL,
  `user_detect` int(20) DEFAULT NULL,
  `comment` varchar(600) NOT NULL DEFAULT '---',
  `new_dup` varchar(25) NOT NULL DEFAULT 'NULL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bug`
--

INSERT INTO `bug` (`id`, `name`, `description`, `date`, `status`, `priority`, `type`, `project_id`, `user_detect`, `comment`, `new_dup`) VALUES
(37, 'Bug TRACTION', 'Old is whatever\'s a decade older than I am.\r\nI will never be an old man. To me, old age is always 15 years older than I am.', '2018-03-25 22:02:28', 'Rejeter', 2, 'Logique', 27, 26, 'You don\'t figure out how to live by thinking about it, but by living life.\r\nEverything has been figured out, except how to live.', 'NULL'),
(38, 'Bug BREEZE', 'True wisdom starts with asking the right questions.\r\nA prudent question is one-half of wisdom.', '2018-04-01 22:08:40', 'IN_PROGRESS', 0, 'Logique', 30, 26, 'It doesn\'t take a master to hold a sword.\r\nAnyone can hold the helm when the sea is calm.', 'Nouveau'),
(39, 'Bug PILLO', 'If you\'re going through a rough time, keep going until you reach the end.\r\nIf you\'re going through hell, keep going. ', '2018-03-21 22:09:17', 'FIXED', 1, 'Syntaxe', 28, 26, 'OK !', 'Nouveau'),
(40, 'Bug PONCHO', 'It\'s the things and people someone loves that tells you who they are.\r\nThe things that we love tell us what we are.', '2018-03-22 22:19:58', 'FIXED', 1, 'interface', 30, 1, 'No amount of correction can outweigh the strength of encouragement.\r\nCorrection does much, but encouragement does more.', 'Duplique'),
(41, 'BUG MAJOR', 'Don\'t wait for life to come knocking on your door, open the door yourself and step through.\r\nIf opportunity doesn\'t knock, build a door.', '2018-03-23 22:20:37', 'Test Invalide', 2, 'Syntaxe', 26, 1, 'anomalie', 'Nouveau'),
(42, 'BUG OLYMPIA', 'It\'s not the words you speak, but the way you say them that matters.\r\nPeople may hear your words, but they feel your attitude.', '2018-03-30 22:21:41', 'IN_PROGRESS', 0, 'Logique', 28, 1, 'Test commentaire au développeur - bogue duplique.', 'Duplique'),
(43, 'BUG PLIZ', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the gre', '2018-03-26 12:03:55', 'TESTING', 2, 'Arithmétique', 30, 1, 'hhhh', 'Nouveau'),
(44, 'BUG TEST', 'Menions express invites la on ou. Revolution executeurs or tu au en clairieres. Cela mal chez les yeux bon. Uniformes sa chaclosah sanglante apprendre en. Ronds petit navre par fumee quand vie avant. Seulement poussiere attachent on illumines as tremblent si. Du voix je rues pour au. Rit visite poemes rythme repond pic forges sortes. \r\n', '2018-03-31 23:10:31', 'Test Invalide', 1, 'Logique', 28, 1, 'le bogue n\'est pas résolu.', 'Nouveau'),
(45, 'BUG Random ', 'Tambours le ni prennent branches nouvelle regiment. Peiner as enleve poussa titres disent la tu legion. Ifs age son coiffe sur replis devant tracer. Or treteaux ou jeunesse posseder crispent apercoit. Fins des rit jour cinq les peur abat. Posseder tu pauvrete en du feerique couleurs tonneaux. Ras non fondit palais cercle fievre pic. \r\n', '2018-03-31 23:10:58', 'FIXED', 2, 'Arithmétique', 30, 1, 'Ce bogue est résolu !', 'Duplique'),
(46, 'BUG TEST', 'Non tellus ante primis praesent ad lorem quam, platea duis class rutrum ultricies ipsum habitasse sollicitudin, cubilia aliquet porttitor ultrices cubilia volutpat luctus aenean nunc suscipit lacinia luctus mattis nisl tempor, donec leo non blandit pharetra aliquet tortor.\r\n\r\n', '2018-04-02 22:21:48', 'IN_PROGRESS', 1, 'interface', 29, 26, 'Test commentaire au développeur - Nouveau bogue.', 'Nouveau'),
(47, 'BUG KO', 'Description détaillés', '2018-04-03 13:06:59', 'Rejeter', 2, 'Arithmétique', 26, 26, 'asi s5zm', 'NULL'),
(49, 'BUG AN', 'On then sake home is am leaf. Of suspicion do departure at extremely he believing. Do know said mind do rent they oh hope of. General enquire picture letters garrets on offices of no on. Say one hearing between excited evening all inhabit thought you. Style begin mr heard by in music tried do. To unreserved projection no introduced invitation. \r\n', '2018-04-07 14:34:46', 'NEW', 0, 'Logique', 30, 11, '---', 'NULL'),
(50, 'BUG OVERFLOW', 'Two images, overlap, on the homepage, so, there\'s that\r\n', '2018-04-07 21:11:26', 'FIXED', 0, 'interface', 31, 11, 'but if i do it over some file it works correctly but if i change its path or location of file its hash changes why me not able to fix this error\r\n\r\n', 'Nouveau'),
(51, 'BUG TEST101', 'The above code convert the string into hex format and my question is how to revert back to string. ? bharathi Jul 26 \'12 at 10:01\r\n', '2018-04-08 18:04:54', 'NEW', 2, 'Arithmétique', 28, 11, '---', 'NULL'),
(52, 'BUG MOUSE', 'The above code convert the string into hex format and my question is how to revert back to string', '2018-04-09 17:33:48', 'NEW', 2, 'Arithmétique', 28, 1, '---', 'NULL'),
(53, 'BUG VCX', 'Good! Better check yourself, you\'re not looking too good.\r\n', '2018-04-09 17:47:49', 'NEW', 0, 'Arithmétique', 26, 11, '---', 'NULL');

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `user_id` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  `action_id` int(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extra` varchar(600) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `log`
--

INSERT INTO `log` (`user_id`, `action`, `action_id`, `date`, `extra`) VALUES
(1, ' a ajouté un nouveau projet : Projet 2', 3, '2018-03-22 23:45:07', ''),
(1, ' a ajouté un nouveau projet : NEw Projet', 3, '2018-03-23 14:19:43', ''),
(1, 'a ajouté un nouveau utilisateur : Sheldon Cooper', 1, '2018-03-23 18:28:29', ''),
(1, 'a supprimé un utilisateur : Sheldon Cooper', 2, '2018-03-23 18:59:38', ''),
(1, 'a ajouté un nouveau utilisateur : Ali Mbark', 1, '2018-03-23 19:00:53', ''),
(1, 'a supprimé un utilisateur : Ali Mbark', 2, '2018-03-23 19:01:12', ''),
(1, 'a supprimé un projet : Projet 2', 4, '2018-03-23 19:05:48', ''),
(1, ' a signalé un bug dans le projet : Projet3', 5, '2018-03-23 19:22:14', ''),
(5, ' a analyser le bug : New bug ,et il l envoyer au developpeur : diouane pour le corriger', 6, '2018-03-23 20:47:41', 'test comment'),
(5, ' a analysé le bug : bubub ,et il change son status à irésolus ', 7, '2018-03-23 21:57:32', 'test comment unsolved'),
(4, ' a corrigé le bug : bug51 et il l envoyer pour le retest', 9, '2018-03-24 00:05:38', 'test comment corriger bug'),
(6, ' a retesté le bug : bug51 et il l a detecté une autre fois ', 10, '2018-03-24 00:06:43', 'test comment bug pas fixer'),
(4, ' a corrigé le bug : bug51 et il l envoyer pour le retest', 9, '2018-03-24 00:07:26', 'test comment corriger deuxieme fois'),
(6, ' a retesté le bug : bug51 et il le n a pas detecté une autre fois ', 11, '2018-03-24 00:07:52', 'bug fix tester'),
(6, 'tester a signalé un bug au projet Projet2', 5, '2018-03-24 13:53:05', ''),
(5, ' a analysé le bug : buggteste ,et il l envoyer au developpeur : dev2 pour le corriger', 6, '2018-03-24 13:53:59', 'c\'est un nouveau bug'),
(9, ' a corrigé le bug : bug100', 8, '2018-03-24 13:55:51', 'Test comment'),
(1, 'a ajouté un nouveau utilisateur : suppr suppr', 1, '2018-03-24 14:18:04', ''),
(1, 'a supprimé un utilisateur : suppr suppr', 2, '2018-03-24 14:18:18', ''),
(1, 'a ajouté un nouveau utilisateur : tester2 tester2', 1, '2018-03-24 17:34:11', ''),
(11, 'tester2 a signalé un bug au projet Projet2', 5, '2018-03-24 17:34:41', ''),
(5, ' a analysé le bug : bug 502 ,et il l envoyer au developpeur : dev2 pour le corriger', 6, '2018-03-24 21:35:18', 'Test'),
(1, 'a ajouté un nouveau utilisateur : vvv ', 1, '2018-03-24 22:22:27', ''),
(1, 'a supprimé un utilisateur : vvv ', 2, '2018-03-24 22:22:38', ''),
(1, 'a ajouté un nouveau utilisateur : g ', 1, '2018-03-24 22:39:15', ''),
(1, 'a supprimé un utilisateur : g ', 2, '2018-03-24 22:39:22', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-24 23:56:27', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-24 23:56:35', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-24 23:58:18', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-24 23:58:28', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-25 00:02:00', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-25 00:02:06', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-25 00:24:06', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-25 00:24:13', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-25 00:28:45', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-25 00:28:54', ''),
(1, 'a ajouté un nouveau utilisateur :  ', 1, '2018-03-25 10:15:21', ''),
(1, 'a supprimé un utilisateur :  ', 2, '2018-03-25 10:15:28', ''),
(1, 'a ajouté un nouveau utilisateur : f f', 1, '2018-03-25 11:12:42', ''),
(1, 'a supprimé un utilisateur : f f', 2, '2018-03-25 11:18:39', ''),
(1, 'a ajouté un nouveau utilisateur : d d', 1, '2018-03-25 13:18:46', ''),
(1, 'a supprimé un utilisateur : d d', 2, '2018-03-25 13:21:29', ''),
(1, 'a ajouté un nouveau utilisateur : aa aa', 1, '2018-03-25 13:27:48', ''),
(1, 'a supprimé un utilisateur : aa aa', 2, '2018-03-25 13:28:50', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 13:29:12', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 13:29:54', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 13:30:18', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 13:30:29', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 14:17:20', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 14:17:28', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 14:19:43', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 14:19:53', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 14:24:33', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 14:32:17', ''),
(1, 'a ajouté un nouveau utilisateur : fsdf sdf', 1, '2018-03-25 14:36:47', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 14:38:46', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 15:01:38', ''),
(1, 'a supprimé un utilisateur : fsdf sdf', 2, '2018-03-25 15:02:06', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 15:04:16', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 15:09:39', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 15:09:51', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 15:11:13', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 15:32:30', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 16:50:47', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-03-25 16:50:50', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 17:05:53', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 17:06:55', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 17:11:07', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 17:11:45', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:01:47', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:08:10', ''),
(1, 'a ajouté un nouveau utilisateur : diouanef abdallah', 1, '2018-03-25 18:09:07', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:09:20', ''),
(1, 'a supprimé un utilisateur : diouanef abdallah', 2, '2018-03-25 18:14:27', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:28:19', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:29:38', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:33:41', ''),
(1, 'a supprimé un utilisateur : dev Claude ', 2, '2018-03-25 18:34:33', ''),
(1, 'a supprimé un utilisateur : analyseur Mike', 2, '2018-03-25 18:34:47', ''),
(1, 'a ajouté un nouveau utilisateur : diouanevvv abdallah', 1, '2018-03-25 18:35:36', ''),
(1, 'a supprimé un utilisateur : tester Sylvie ', 2, '2018-03-25 18:35:42', ''),
(1, 'a supprimé un utilisateur : tester Sylvie ', 2, '2018-03-25 18:37:32', ''),
(1, 'a supprimé un utilisateur : tester Sylvie ', 2, '2018-03-25 18:40:48', ''),
(1, 'a supprimé un utilisateur : dev2 Ranger ', 2, '2018-03-25 18:41:57', ''),
(1, 'a supprimé un utilisateur : dev3 Juliette ', 2, '2018-03-25 18:42:04', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-03-25 18:47:48', ''),
(1, 'a supprimé un utilisateur : diouanevvv abdallah', 2, '2018-03-25 18:49:45', ''),
(1, 'a ajouté un nouveau utilisateur : dev2 Agnès ', 1, '2018-03-25 19:11:37', ''),
(1, 'a ajouté un nouveau utilisateur : dev3 Estelle ', 1, '2018-03-25 19:13:53', ''),
(1, 'a ajouté un nouveau utilisateur : dev4 Pascal ', 1, '2018-03-25 19:19:13', ''),
(1, 'a supprimé un projet : Projet3', 4, '2018-03-25 20:24:40', ''),
(1, 'a supprimé un projet : Projet1', 4, '2018-03-25 20:24:58', ''),
(1, 'a supprimé un projet : Projet2', 4, '2018-03-25 20:25:00', ''),
(1, 'a supprimé un projet : Projet4', 4, '2018-03-25 20:25:04', ''),
(1, 'a supprimé un projet : Projet5', 4, '2018-03-25 20:25:07', ''),
(1, 'a supprimé un projet : New Projet', 4, '2018-03-25 20:25:09', ''),
(1, ' a ajouté un nouveau projet : PROJECT PASHA', 3, '2018-03-25 21:36:58', ''),
(1, ' a ajouté un nouveau projet : PROJECT SION', 3, '2018-03-25 21:47:12', ''),
(1, ' a ajouté un nouveau projet : PROJECT AMPHORA', 3, '2018-03-25 21:47:46', ''),
(1, ' a ajouté un nouveau projet : PROJECT MAVERICK', 3, '2018-03-25 21:49:02', ''),
(1, ' a ajouté un nouveau projet : PROJECT CHEVAL', 3, '2018-03-25 21:50:44', ''),
(1, ' a ajouté un nouveau projet : PROJECT GALLINA', 3, '2018-03-25 21:51:10', ''),
(26, 'tester a signalé un bug au projet PROJECT SION', 5, '2018-03-25 22:02:29', ''),
(26, 'tester a signalé un bug au projet PROJECT CHEVAL', 5, '2018-03-25 22:08:40', ''),
(26, 'tester a signalé un bug au projet PROJECT AMPHORA', 5, '2018-03-25 22:09:17', ''),
(1, ' a signalé un bug dans le projet : PROJECT CHEVAL', 5, '2018-03-25 22:19:58', ''),
(1, ' a signalé un bug dans le projet : PROJECT PASHA', 5, '2018-03-25 22:20:38', ''),
(1, ' a signalé un bug dans le projet : PROJECT AMPHORA', 5, '2018-03-25 22:21:41', ''),
(24, ' a analysé le bug : Bug TRACTION ,et il change son status à irésolus ', 7, '2018-03-25 22:27:38', 'You don\'t figure out how to live by thinking about it, but by living life.\r\nEverything has been figured out, except how to live.'),
(24, ' a analysé le bug : BUG MAJOR ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-03-25 22:28:03', 'Never be defeated after a defeat.\r\nWe may encounter many defeats but we must not be defeated.'),
(24, ' a analysé le bug : Bug PONCHO ,et il l envoyer au developpeur : dev2 pour le corriger', 6, '2018-03-25 22:28:19', 'Be at ease in your own skin for you cannot shed it like a snake.\r\nTry to be like the turtle - at ease in your own shell. '),
(24, ' a analysé le bug : Bug BREEZE ,et il l envoyer au developpeur : dev3 pour le corriger', 6, '2018-03-25 22:28:35', 'It doesn\'t take a master to hold a sword.\r\nAnyone can hold the helm when the sea is calm.'),
(30, ' a corrigé le bug : Bug PONCHO', 8, '2018-03-25 22:32:38', 'No amount of correction can outweigh the strength of encouragement.\r\nCorrection does much, but encouragement does more.'),
(27, ' a corrigé le bug : BUG MAJOR et il l envoyer pour le retest', 9, '2018-03-25 22:44:55', 'The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The.'),
(1, ' a signalé un bug dans le projet : PROJECT CHEVAL', 5, '2018-03-26 12:03:55', ''),
(24, ' a analysé le bug : Bug PILLO ,et il l envoyer au developpeur : dev4 pour le corriger', 6, '2018-03-26 15:07:18', 'Ce bug a cause un problème chez plusieurs utilisateurs ... '),
(24, ' a analysé le bug : BUG PLIZ ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-03-26 15:50:57', 'hhhhh'),
(27, ' a corrigé le bug : BUG PLIZ et il l envoyer pour le retest', 9, '2018-03-26 15:51:31', 'hhhh'),
(26, ' a retesté le bug : BUG MAJOR et il l a detecté une autre fois ', 10, '2018-03-26 15:53:55', 'anomalie'),
(1, ' a signalé un bug dans le projet : PROJECT AMPHORA', 5, '2018-03-31 23:10:31', ''),
(1, ' a signalé un bug dans le projet : PROJECT CHEVAL', 5, '2018-03-31 23:10:58', ''),
(24, ' a analysé le bug : BUG Random  ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-04-01 17:42:31', 'Ipsum adipiscing tempor consectetur ligula imperdiet gravida eros, vehicula imperdiet eleifend hendrerit faucibus nostra porta, fermentum integer cubilia dictumst erat nostra habitasse placerat aenean nibh volutpat erat sapien donec felis est, litora pulvinar sollicitudin quisque nisl libero nec egestas tristique dictum, nisi sit fermentum et nam gravida augue in.\r\n\r\n'),
(24, ' a analysé le bug : BUG 213 ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-04-01 17:42:48', 'Non tellus ante primis praesent ad lorem quam, platea duis class rutrum ultricies ipsum habitasse sollicitudin, cubilia aliquet porttitor ultrices cubilia volutpat luctus aenean nunc suscipit lacinia luctus mattis nisl tempor, donec leo non blandit pharetra aliquet tortor.\r\n\r\n'),
(26, 'tester a signalé un bug au projet PROJECT MAVERICK', 5, '2018-04-02 22:21:49', ''),
(24, ' a analysé le bug : BUG TEST ,et il l envoyer au developpeur : dev2 pour le corriger', 6, '2018-04-03 00:13:55', 'Test commentaire au développeur - Nouveau bogue.'),
(24, ' a analysé le bug : BUG OLYMPIA ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-04-03 00:15:20', 'Test commentaire au développeur - bogue duplique.'),
(27, ' a corrigé le bug : BUG Random ', 8, '2018-04-03 13:04:29', 'Ce bogue est résolu !'),
(32, ' a corrigé le bug : Bug PILLO et il l envoyer pour le retest', 9, '2018-04-03 13:05:04', 'Ce bogue est OK !'),
(26, ' a retesté le bug : Bug PILLO et il le n a pas detecté une autre fois ', 11, '2018-04-03 13:05:36', 'OK !'),
(26, 'tester a signalé un bug au projet PROJECT PASHA', 5, '2018-04-03 13:06:59', ''),
(27, ' a corrigé le bug : BUG TEST et il l envoyer pour le retest', 9, '2018-04-03 23:28:34', 'Ce Projet sera envoyé au testeur '),
(26, ' a retesté le bug : BUG TEST et il l a detecté une autre fois ', 10, '2018-04-03 23:40:02', 'le bogue n\'est pas résolu.'),
(1, ' a signalé un bug dans le projet : PROJECT SION', 5, '2018-04-04 17:42:04', ''),
(1, 'a ajouté un nouveau utilisateur : test test', 1, '2018-04-04 19:00:17', ''),
(1, 'a supprimé un utilisateur : test test', 2, '2018-04-04 19:00:24', ''),
(1, 'a ajouté un nouveau utilisateur : gsf sgd', 1, '2018-04-04 19:01:51', ''),
(1, 'a supprimé un utilisateur : gsf sgd', 2, '2018-04-04 19:01:57', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-04-04 20:42:42', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-04-04 20:42:54', ''),
(24, ' a analysé le bug : BUG KO ,et il change son status à irésolus ', 7, '2018-04-05 20:17:16', 'asi s5zm'),
(32, 'a modifié son profil', 0, '2018-04-06 22:02:33', ''),
(32, 'a modifié son profil', 0, '2018-04-06 22:04:24', ''),
(32, 'a modifié son profil', 0, '2018-04-07 12:46:20', ''),
(32, 'a modifié son profil', 0, '2018-04-07 13:02:22', ''),
(1, 'a modifié son profil', 0, '2018-04-07 14:00:07', ''),
(11, 'a modifié son profil', 0, '2018-04-07 14:19:29', ''),
(24, 'a modifié son profil', 0, '2018-04-07 14:20:54', ''),
(31, 'a modifié son profil', 0, '2018-04-07 14:22:04', ''),
(30, 'a modifié son profil', 0, '2018-04-07 14:23:20', ''),
(27, 'a modifié son profil', 0, '2018-04-07 14:28:55', ''),
(26, 'a modifié son profil', 0, '2018-04-07 14:29:48', ''),
(26, 'tester2 a signalé un bug au projet PROJECT PASHA', 5, '2018-04-07 14:34:02', ''),
(11, 'tester a signalé un bug au projet PROJECT CHEVAL', 5, '2018-04-07 14:34:46', ''),
(11, 'tester a signalé un bug au projet PROJECT GALLINA', 5, '2018-04-07 21:11:26', ''),
(24, ' a analysé le bug : BUG OVERFLOW ,et il l envoyer au developpeur : dev pour le corriger', 6, '2018-04-07 21:12:01', 'Can anyone know how to convert the MD5 to String. In my case I have saved the password in MD5 in database. I am trying to retreive the password and display it in string for the editing purpose.\r\n\r\n'),
(27, ' a corrigé le bug : BUG OVERFLOW et il l envoyer pour le retest', 9, '2018-04-07 21:14:44', 'What is the point to generate md5 hash of a password if that cant be reversed?'),
(11, ' a retesté le bug : BUG OVERFLOW et il le n a pas detecté une autre fois ', 11, '2018-04-07 21:15:06', 'but if i do it over some file it works correctly but if i change its path or location of file its hash changes why me not able to fix this error\r\n\r\n'),
(11, 'a modifié son profil', 0, '2018-04-07 21:15:24', ''),
(11, 'tester a signalé un bug au projet PROJECT AMPHORA', 5, '2018-04-08 18:04:54', ''),
(1, 'a ajouté un nouveau utilisateur : b xb', 1, '2018-04-09 16:16:31', ''),
(1, 'a supprimé un utilisateur : b xb', 2, '2018-04-09 16:16:50', ''),
(1, 'a ajouté un nouveau utilisateur : fsdf sdfsd', 1, '2018-04-09 16:18:51', ''),
(1, 'a supprimé un utilisateur : fsdf sdfsd', 2, '2018-04-09 16:19:07', ''),
(1, 'a ajouté un nouveau utilisateur : gzfdg sdfgsdfg', 1, '2018-04-09 16:38:39', ''),
(1, 'a supprimé un utilisateur : gzfdg sdfgsdfg', 2, '2018-04-09 16:38:45', ''),
(1, 'a ajouté un nouveau utilisateur : vmv vbmvb', 1, '2018-04-09 16:51:17', ''),
(1, 'a supprimé un utilisateur : vmv vbmvb', 2, '2018-04-09 16:51:24', ''),
(1, 'a ajouté un nouveau utilisateur : diouane abdallah', 1, '2018-04-09 16:57:24', ''),
(1, 'a supprimé un utilisateur : diouane abdallah', 2, '2018-04-09 16:57:43', ''),
(1, 'a ajouté un nouveau utilisateur : zxczxc zxczxc', 1, '2018-04-09 17:18:52', ''),
(1, 'a ajouté un nouveau utilisateur : vxc zxb', 1, '2018-04-09 17:22:31', ''),
(1, 'a supprimé un utilisateur : vxc zxb', 2, '2018-04-09 17:22:46', ''),
(1, 'a supprimé un utilisateur : zxczxc zxczxc', 2, '2018-04-09 17:22:50', ''),
(1, 'a ajouté un nouveau utilisateur : gg gg', 1, '2018-04-09 17:23:19', ''),
(1, ' a signalé un bug dans le projet : PROJECT AMPHORA', 5, '2018-04-09 17:33:48', ''),
(11, 'tester a signalé un bug au projet PROJECT PASHA', 5, '2018-04-09 17:47:49', ''),
(27, 'a modifié son profil', 0, '2018-04-12 14:31:30', ''),
(1, 'a supprimé un utilisateur : gg gg', 2, '2018-04-12 14:53:59', '');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'NON_BUGS'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `name`, `description`, `date`, `status`) VALUES
(26, 'PROJECT PASHA', 'Ce projet consiste à réaliser le Webdesign d\'un futur site internet dédié à la \"relocation\" en région PACA. Ce design étant validé par le client, je procéderai prochainement au développement du site internet.\r\n', '2018-03-25 21:36:57', 'NON_BUGS'),
(27, 'PROJECT SION', 'Cette réalisation fut l\'objet d\'un projet universitaire en Décembre 2011 qui consistait à créer une publicité anglaise sur le thème que l\'on voulait. Le but étant de proposer un produit et de le valoriser par une affiche, une vidéo publicitaire ou une bande son (type radio)', '2018-03-25 21:47:12', 'NON_BUGS'),
(28, 'PROJECT AMPHORA', 'Cette réalisation fut l\'objet d\'un projet universitaire en 2009 qui consistait à créer une Bande Dessinée sur la vie à l\'IUT et de la promouvoir à l\'aide d\'un site internet. Pour ce projet je me suis occupé de la réalisation du site internet.\r\n', '2018-03-25 21:47:46', 'NON_BUGS'),
(29, 'PROJECT MAVERICK', 'J\'ai réalisé ce site internet pour un projet universitaire durant l\'année scolaire 2011/2012. Celui-ci consistait à réaliser des émissions mensuelles sur l\'IUT. Pour réaliser cette web-tv il était indispensable de créer un site internet. Dans ce projet je me suis occupé de la réalisation de ce site internet.\r\n\r\n\r\n', '2018-03-25 21:49:02', 'NON_BUGS'),
(30, 'PROJECT CHEVAL', 'Le client gère désormais son site internet dans sa globalité grâce à un système de mise à jour en temps réel de son contenu (jseditable) relié à une base de données. Il peut ajouter, supprimer, réorganiser et classer ses projets lui-même sans taper une seule ligne de code.\r\n\r\n\r\n', '2018-03-25 21:50:44', 'NON_BUGS'),
(31, 'PROJECT GALLINA', 'J\'ai réalisé ce site internet pour un ancien collègue universitaire. Ce dernier désirait un Portfolio qui soit sobre, pure et simple d\'utilisation.\r\n', '2018-03-25 21:51:09', 'NON_BUGS');

-- --------------------------------------------------------

--
-- Structure de la table `projet_dev`
--

CREATE TABLE `projet_dev` (
  `projet_id` int(20) DEFAULT NULL,
  `dev_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projet_dev`
--

INSERT INTO `projet_dev` (`projet_id`, `dev_id`) VALUES
(26, 27),
(26, 30),
(27, 30),
(27, 31),
(28, 27),
(28, 32),
(29, 30),
(29, 31),
(29, 32),
(30, 27),
(30, 30),
(30, 31),
(30, 32),
(31, 27),
(31, 31);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT 'avatar.png',
  `name` varchar(32) NOT NULL,
  `prenom` varchar(200) NOT NULL DEFAULT '---',
  `pwd` varchar(32) NOT NULL,
  `gendre` varchar(100) NOT NULL DEFAULT 'gendre',
  `adresse` varchar(400) NOT NULL DEFAULT 'adr',
  `apropos` varchar(600) NOT NULL DEFAULT 'Je suis un développeur et designer web basé à Montréal - Canada, j''aime lire des livres, de la bonne musique et de la nature.',
  `email` varchar(32) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `avatar`, `name`, `prenom`, `pwd`, `gendre`, `adresse`, `apropos`, `email`, `date_created`, `type`) VALUES
(1, 'avatar.png', 'admin', 'Mathieu', '21232f297a57a5a743894a0e4a801fc3', 'male', '39, rue Ernest Renan\r\n77500 CHELLES\r\n\r\n\r\n', 'Mon but dans la vie est de muscler le leadership des personnes que je côtoie. Je le fais à travers mon blogue, mes conférences, les discussions que j?ai avec des personnes et en me poussant à montrer l?exemple pour ce que j?estime important. Je m?appelle Julien.', 'ParfaitMathieu@armyspy.com', '2018-03-02 10:07:22', 'admin'),
(11, 'avatar2.png', 'tester', 'Clarimunda ', 'f5d1278e8109edd94e1e4197e04873b9', 'female', '63, rue Victor Hugo\r\n78700 CONFLANS-SAINTE-HONORINE\r\n\r\n\r\n', 'Je suis un développeur et designer web basé à Montréal - Canada, j\\\'aime lire des livres, de la bonne musique et de la nature.\r\n\r\n', 'ClarimundaBriard@rhyta.com', '2018-03-24 17:34:11', 'tester'),
(24, 'avatar4.png', 'analyseur', 'Warrane ', '7a54d655bc5c91721cf747ed2d2f497f', 'male', '87, boulevard de Prague\r\n93160 NOISY-LE-GRAND\r\n\r\n\r\n', 'Je suis un développeur et designer web basé à Montréal - Canada, j\\\'aime lire des livres, de la bonne musique et de la nature.\r\n', 'WarranePinette@dayrep.com', '2018-03-25 15:09:51', 'analyseur'),
(26, 'avatar1.png', 'tester2', 'Philip ', '2e9fcf8e3df4d415c96bcf288d5ca4ba', 'male', '28, rue Goya\r\n77350 LE MÉE-SUR-SEINE\r\n\r\n', 'Je m\'appelle Pascal Porion, j\'ai 21 ans et je suis actuellement Auto-entrepreneur en tant que Développeur Web et Concepteur de site Internet. J\'effectue mes études en parallèle, en effet je suis en Licence Professionnelle multimédia TAIS, spécialité Convergence Internet Audiovisuel Numérique (CIAN) à Toulon (Var). Je suis essentiellement Développeur & Intégrateur Web, en effet je travaille également sur la réalisation de site web pour une agence spécialisée dans la création de site internet, CKC-Net. \r\n\r\n\r\n', 'PhilipDescoteaux@jourrapide.com', '2018-03-25 16:50:47', 'tester'),
(27, 'avatar4.png', 'dev', 'Victor ', 'e77989ed21758e78331b20e477fc5582', 'male', '9, Chemin Du Lavarin Sud\r\n06800 CAGNES-SUR-MER\r\n\r\n\r\n', 'Je suis un développeur et designer web basé à Montréal - Canada, j\\\'aime lire des livres, de la bonne musique et de la nature.\r\n\r\n', 'VictorMarcheterre@jourrapide.com', '2018-03-25 16:50:50', 'dev'),
(30, 'avatar5.png', 'dev2', 'Sylvie ', 'f77648e5d3e027222417fcba0f7291cb', 'female', '43, Avenue Millies Lacroix\r\n97610 DZAOUDZI\r\n\r\n\r\n', 'Je suis un développeur et designer web basé à Montréal - Canada, j\\\'aime lire des livres, de la bonne musique et de la nature.\r\n', 'SylvieSt-Jean@armyspy.com', '2018-03-25 19:11:37', 'dev'),
(31, 'avatar6.png', 'dev3', 'Fabienne ', '8ed7dfcff4e017e4f61d36bbbf1f08bc', 'female', '36, rue de l\'Aigle\r\n92250 LA GARENNE-COLOMBES\r\n\r\n\r\n', 'Je suis un développeur et designer web basé à Montréal - Canada, j\\\'aime lire des livres, de la bonne musique et de la nature.\r\n', 'FabienneBellefeuille@rhyta.com', '2018-03-25 19:13:53', 'dev'),
(32, 'avatar3.png', 'dev4', 'Pascal ', '9dee81e1c2bb17a59f6e0241090350c5', 'male', '89, Rue Hubert de Lisle\r\n39000 LONS-LE-SAUNIER\r\n\r\n\r\n', 'Je m\'appelle Nicolas Porion, j\'ai 21 ans et je suis actuellement Auto-entrepreneur en tant que Développeur Web et Concepteur de site Internet. J\'effectue mes études en parallèle, en effet je suis en Licence Professionnelle multimédia TAIS, spécialité Convergence Internet Audiovisuel Numérique (CIAN) à Toulon (Var). Je suis essentiellement Développeur & Intégrateur Web, en effet je travaille également sur la réalisation de site web pour une agence spécialisée dans la création de site internet, CKC-Net. \r\n', 'PascalBarjavel@rhyta.com', '2018-03-25 19:19:12', 'dev');

-- --------------------------------------------------------

--
-- Structure de la table `user_bug`
--

CREATE TABLE `user_bug` (
  `id_bug` int(20) NOT NULL,
  `id_dev` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_bug`
--

INSERT INTO `user_bug` (`id_bug`, `id_dev`) VALUES
(41, 27),
(40, 30),
(38, 31),
(39, 32),
(43, 27),
(45, 27),
(44, 27),
(46, 30),
(42, 27),
(50, 27);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bug`
--
ALTER TABLE `bug`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pr_id_fk` (`project_id`),
  ADD KEY `fk_user_id` (`user_detect`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projet_dev`
--
ALTER TABLE `projet_dev`
  ADD KEY `fk_projet_id` (`projet_id`),
  ADD KEY `fk_devv_id` (`dev_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_bug`
--
ALTER TABLE `user_bug`
  ADD KEY `fk_bug_id` (`id_bug`),
  ADD KEY `fk_dev_id` (`id_dev`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bug`
--
ALTER TABLE `bug`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_detect`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `pr_id_fk` FOREIGN KEY (`project_id`) REFERENCES `projet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet_dev`
--
ALTER TABLE `projet_dev`
  ADD CONSTRAINT `fk_devv_id` FOREIGN KEY (`dev_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`);

--
-- Contraintes pour la table `user_bug`
--
ALTER TABLE `user_bug`
  ADD CONSTRAINT `fk_bug_id` FOREIGN KEY (`id_bug`) REFERENCES `bug` (`id`),
  ADD CONSTRAINT `fk_dev_id` FOREIGN KEY (`id_dev`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
