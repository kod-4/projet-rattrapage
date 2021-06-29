-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 29 juin 2021 à 19:27
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfony_librairie`
--

-- --------------------------------------------------------

--
-- Structure de la table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `home_id` int(11) DEFAULT NULL,
  `sujet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `journee` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agenda`
--

INSERT INTO `agenda` (`id`, `home_id`, `sujet`, `debut`, `fin`, `description`, `journee`, `image`) VALUES
(2, 1, 'Aux P\'tits Lus spécial Frissons', '2021-10-30 10:30:00', '2021-10-30 12:30:00', 'Le samedi 31 octobre 2020 à 10h30 , Librairie Libr\'enfant\r\nNous recherchons ACTIVEMENT des oreilles de 3 à 6 ans pour lectures d\'histoires !!\r\nDeux créneaux horaires : 10h30 et 11h30', 1, 'storytime-60da5a612dd28076662749.jpg'),
(3, 1, 'Comité Ados', '2021-10-27 14:00:00', '2021-10-27 15:00:00', 'Ados entre 13 et 17 ans, dévoreurs de livres et critiques de nature, venez nous rejoindre au comité pour donner votre avis sur des nouveautés.\r\nCe comité est un rdv mensuel', 0, 'comiteados-60da62bb04016181851105.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biographie` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`, `biographie`) VALUES
(1, 'PEREZ', 'Lacombe', 'Aenean malesuada diam enim, vitae lobortis magna euismod at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam viverra eros sit amet augue tempus maximus. Morbi et lacinia est, eget rutrum erat. Sed condimentum'),
(2, 'LANG', NULL, 'Quisque in est bibendum, scelerisque tellus id, ullamcorper mauris. Sed eget condimentum nulla. Etiam bibendum purus a nulla viverra, nec placerat sapien hendrerit. Quisque porta tellus sapien.'),
(3, 'JOUANNIGOT', 'Loic', 'Donec tristique tortor vel augue egestas blandit. Mauris eros odio, suscipit eget pretium vitae, pharetra vel magna. Etiam euismod sem eget ligula placerat tristique. Donec vitae lorem ac mi dignissim consectetur.'),
(4, 'JALBERT', 'Philipe', 'Praesent sollicitudin ante a lectus rutrum feugiat. Pellentesque feugiat a mi lacinia rhoncus. Sed pulvinar nisi ut libero sagittis faucibus. Ut vel augue dui.'),
(5, 'HIGGINS', 'Ryan T', 'Donec tristique tortor vel augue egestas blandit. Mauris eros odio, suscipit eget pretium vitae, pharetra vel magna.'),
(6, 'SECHAN', 'Jourdy', 'Vivamus commodo diam quis faucibus pulvinar. Aenean ac lorem vel justo sollicitudin facilisis sit amet sit amet eros. Maecenas sollicitudin neque facilisis.'),
(7, 'NOB', NULL, 'Integer consectetur ante mi, vitae tincidunt nibh euismod eget. Mauris iaculis fringilla massa, eu efficitur mauris varius ac. Duis eget nisi id ante accumsan ornare. Curabitur tincidunt augue dolor.'),
(8, 'DUNAND-PALLAZ', 'Turrel', 'Donec et mauris erat. Duis eget sagittis sem. Suspendisse pellentesque eros dui, eu fringilla nibh dapibus eget. Vestibulum erat sem, efficitur vitae nunc quis, faucibus dapibus diam. Donec in velit nec sem feugiat elementum in vitae lacus. Duis aliquam vel lacus ut malesuada.'),
(9, 'JOLIBOIS', 'Henrich', 'Aliquam dignissim ligula at molestie egestas. Etiam magna velit, sodales sit amet risus a, semper mollis dolor. Morbi ac nisi eget nunc vehicula condimentum at quis nisl.'),
(10, 'CATHON', NULL, 'Nulla congue eros ultrices erat cursus scelerisque. Donec egestas ligula in finibus consequat. Vestibulum vehicula luctus nisl scelerisque vulputate. Pellentesque bibendum orci ullamcorper, venenatis est non, convallis eros.'),
(11, 'BERTRAND', 'Bonniol', 'Curabitur lacus eros, sagittis sed bibendum tincidunt, fermentum vitae ante. Proin at imperdiet augue. Ut pretium laoreet erat. Phasellus non purus dolor. Etiam eget quam pharetra, feugiat sapien id, mattis justo.'),
(12, 'PEDROSA', NULL, NULL),
(13, 'ROCHETTE/BOCQUET/REY', NULL, NULL),
(14, 'DEVENEY/TAMARIT', NULL, NULL),
(15, 'LAMBDA', 'SOPHIE', NULL),
(16, 'CY', NULL, NULL),
(17, 'GAIMAN/NEYRET', NULL, NULL),
(18, 'ROWLING J.K.', NULL, NULL),
(19, 'WYNNE JONES', 'DIANA', NULL),
(20, 'SFAR', 'JOANN', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`, `description`, `active`) VALUES
(1, 'Jeunesse 0-7 ans', 'Mauris pellentesque nibh non mi finibus suscipit. Mauris sit amet mattis erat, quis finibus mauris. Aenean ornare luctus diam, et feugiat justo tincidunt vel. Vivamus ultricies rhoncus fringilla.', 1),
(2, 'Jeunesse tout petit', 'Etiam lacinia nibh non nisi efficitur eleifend. Nulla maximus sit amet nunc et ultrices. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam nisl tortor, scelerisque quis quam et, egestas vestibulum turpis. Etiam fringilla nibh nec eros interdum fermentum.', 1),
(3, 'Romans jeunesse', 'Sed tincidunt porta dolor eu varius. Curabitur tortor velit, gravida nec augue semper, posuere malesuada lectus. Aenean nisl erat, consectetur et sem ac, faucibus dapibus lorem. Maecenas varius nulla quis lorem imperdiet, sit amet maximus odio aliquam.', 1),
(4, 'Romans graphiques', 'Phasellus tristique lorem felis. Duis scelerisque viverra placerat. Pellentesque pulvinar scelerisque turpis, quis cursus purus mollis eu. Etiam eget viverra orci, dictum sodales urna.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` int(11) NOT NULL,
  `livres_id` int(11) DEFAULT NULL,
  `reponse_id` int(11) DEFAULT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cgu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sujet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210615115554', '2021-06-15 13:56:07', 417),
('DoctrineMigrations\\Version20210617113158', '2021-06-17 13:32:32', 284),
('DoctrineMigrations\\Version20210617114937', '2021-06-17 13:49:42', 104),
('DoctrineMigrations\\Version20210617115207', '2021-06-17 13:52:13', 55),
('DoctrineMigrations\\Version20210622140814', '2021-06-22 16:08:28', 436),
('DoctrineMigrations\\Version20210623094312', '2021-06-23 11:43:26', 1260),
('DoctrineMigrations\\Version20210628180002', '2021-06-28 20:00:11', 716),
('DoctrineMigrations\\Version20210629150601', '2021-06-29 17:06:06', 111),
('DoctrineMigrations\\Version20210629161213', '2021-06-29 18:12:20', 88);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id`, `nom`, `resume`, `active`) VALUES
(1, 'Les Édition Flannes', 'Morbi lacinia aliquet velit vel lobortis. Nulla facilisis dapibus libero, sed euismod leo pharetra quis. Nunc at faucibus tortor. Integer sit amet ipsum non nulla bibendum posuere eu vitae risus.', 1),
(2, 'Les Édition de Midi', 'Quisque massa risus, blandit nec metus et, commodo aliquet velit. Donec sapien massa, mollis viverra molestie eu, tempus a risus. Proin vel iaculis odio. Morbi quis mi id metus vestibulum malesuada.', 1),
(3, 'Les Éditions Lliam', 'Aliquam erat volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In sed diam at turpis faucibus feugiat. Suspendisse ut lorem elit.', 1),
(4, 'Éditions de la table basse', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras imperdiet iaculis suscipit. Nullam sit amet leo accumsan, varius dolor at, commodo nisl. Nullam et mi ac felis accumsan laoreet.', 1),
(5, 'Éscanor Éditions', 'Curabitur lacus eros, sagittis sed bibendum tincidunt, fermentum vitae ante. Proin at imperdiet augue. Ut pretium laoreet erat. Phasellus non purus dolor. Etiam eget quam pharetra.', 1),
(6, 'Azou BD', 'Etiam vestibulum eros rutrum sapien mollis lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras imperdiet iaculis suscipit. Nullam sit amet leo accumsan, varius dolor at, commodo nisl. Nullam et mi ac felis accumsan laoreet.', 1),
(8, 'Lic-Lac', 'Aliquam in hendrerit felis, eget rutrum enim. Nulla nec eleifend lorem. Quisque in lacinia nisi, in porttitor orci. Cras vitae nibh nibh.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `home`
--

CREATE TABLE `home` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `home`
--

INSERT INTO `home` (`id`, `titre`, `description`, `marque`, `active`, `adress`) VALUES
(1, 'La Librairie', 'L’Alpha-Bêtise est une librairie spécialisée dans les ouvrages jeunesse.\r\nLa librairie propose des albums pour les enfants : Bébés dès la naissance (0 à 3 ans), enfants et jusqu’au romans pour ados.\r\nElle a également quelques romans graphiques pour les jeunes adultes.', 'L\'Alpha-Bêtise', 1, 'Librairie Alpha-Bêtise');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `auteur_id` int(11) DEFAULT NULL,
  `editeur_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `categorie_id`, `auteur_id`, `editeur_id`, `titre`, `resume`, `prix`, `image`, `code`, `active`, `updated_at`) VALUES
(1, 1, 1, 6, 'L\'ETONNANTE FAMILLE APPENZELL', 'Ma grand-mère se nommait Eugénie. Eugénie Appenzell. D\'elle, je tiens mes longs cheveux bouclés et, dit-on, mon caractère bien trempé. Peu de jours avant ma naissance, grand-mère Eugénie quitta les siens. En héritage, elle me laissa une boîte remplie de photographies et de lettres. \"Pour que tu connaisses ta famille\", m\'avait-elle écrit. Durant des années, j\'ai démêlé les liens et les intrigues qui unissent ces personnes extraordinaires.\r\nJ\'ai pleuré et j\'ai ri... Aujourd\'hui, je vous livre leur histoire. Mon histoire. Celle de l\'étonnante famille Appenzell.', '19.90', 'etonnantefamilleappenzel-60cb44c5d6d3c639302423.jfif', '9791095184249', 1, '2021-06-17 14:49:09'),
(2, 1, 2, 2, 'GASTON GROGNON - T02 - C\'EST LA FETE !', 'N\'avez-vous jamais été un peu inquiet en allant à une fête ? c\'est le cas de Gaston. Son ami Porc-Epic organise une fiesta de folie, et tous les animaux n\'ont qu\'une hâte... danser jusqu\'au bout de la nuit ! Il est HORS DE QUESTION pour Gaston de mettre un pied sur la piste de danse. D\'abord, il ne sait même pas comment bouger son corps. Et puis, qu\'est-ce qu\'ils ont tous à vouloir lui apprendre ? Pourquoi n\'aurait-il pas droit de ne pas aimer ça ?', '13.90', 'gastongrognon-60cb4543d11af866852374.jfif', '9782203211506', 1, '2021-06-17 14:51:15'),
(3, 1, 3, 4, 'LA FAMILLE PASSIFLORE, PIROUETTE & NYMPHEAS', 'Au pays multicolore des nymphéas, vit la famille Blanche. La maman est une artiste peintre très connue. Ses deux enfants Ajonc et Genet veulent construire une cabane parmi les nymphéas, aidés par leurs jeunes invités : les Passiflore. 1987, premier livre pour enfants aux éditions Milan : Le Premier Bal d\'Agaric Passiflore, texte de Geneviève Huriet. C\'est le succès. Succès couronné par des prix littéraires et des récompenses diverses (prix Saint-Exupéry).\r\nS\'ensuivra une longue série (24 titres parus), pour le plus grand plaisir des enfants (à partir de quatre ans). Aujourd\'hui, les petits lapins Passiflore sont traduits en 28 langues et font l\'objet d\'une série télé, 52 épisodes de 26 minutes (production Euro Visual TF1) et diffusée depuis 2004 (TF1, Disney Chanel, etc.). En 2012, chez Dargaud, Loïc Jouannigot reprend seul les personnages des Passiflore en bande dessinée avec deux albums : L\'Anniversaire de Dendelion et La Chorale.\r\nSuivent deux autres titres avec les textes de Michel Plessix, Mélodie potagère et La Chasse au trésor. Depuis l\'arrêt en 2007 de l\'édition, la sympathique et néanmoins célèbre Famille Passiflore est rééditée aux éditions Maghen. Ce nouvel album, Pirouette & Nymphéas, contient une histoire inédite de la famille Passiflore écrite et dessinée par Loïc Jouannigot.', '13.00', 'lafamillepassiflore-60cb45d8cdee1459693319.jfif', '9782356740878', 1, '2021-06-17 14:53:44'),
(4, 1, 4, 8, 'LES GESTES BARRIERES EXPLIQUES AUX ENFANTS', 'Un petit ouvrage documentaire à destination des enfants de l\'école maternelle pour leur expliquer simplement les gestes barrières pour qu\'ils puissent se protéger et protéger les autres du coronavirus et des virus en général. Un dessin animé conçu par l\'auteur et adapté de ce livre est également disponible sur YouTube et a dépassé les 100 000 vues en à peine quelques jours.', '2.95', 'lesgestesbariiere-60cb46469465f386284608.jfif', '9782017866763', 1, '2021-06-17 14:55:34'),
(5, 1, 5, 2, 'MAMAN OIE OURS A LA RESCOUSSE', 'Michel, l\'ours grincheux, ne supporte pas ses voisins. Ils sont bruyants, envahissants, collants, et ils sont partout, tout le temps. Heureusement, son sale caractère lui assure une paix relative... jusqu\'au jour où une énorme tempête se déclare. Tout le monde se réfugie alors chez Michel, qui doit même participer à une chaîne humaine géante pour sauver un petit lapin des bourrasques ! L\'ours ronchon, horripilé par cette invasion, risque pourtant bien de changer d\'avis : parfois, l\'entraide appelle...\r\nl\'entraide. A partir de 5 ans', '12.00', 'mamanoursalarescousse-60cb46e11ad5a956197367.jfif', '9782226454140', 1, '2021-06-17 14:58:09'),
(6, 2, 6, 4, 'CACHÉE OU PAS, J\'ARRIVE - UNE AVENTURE SANS AVENTURE DE BARTOK BILOBA', 'Une partie de cache-cache écrite et dessinée à quatre mains. Lolita Séchan et Camille Jourdy s\'amusent à faire jouer leur personnages respectifs dans l\'univers de la famille Biloba. à partir de 4 ans.', '13.50', 'cacheeoupasjarrive-60da71412bdab410951484.jfif', '9782330130152', 1, '2021-06-29 03:02:57'),
(7, 2, 7, 1, 'LA CANTOCHE, TOME 05 - EN AVANT, MACHE !', 'La cloche a sonné, c\'est l\'heure du repas, direction... la cantoche ! Tous les enfants se retrouvent dans ce lieu mythique, qu\'on connaît forcément de près ou de loin. Entre les batailles de nourriture, les disputes, les chutes et les réclamations auprès du cuisiner fan de légumes, la pause déjeuner peut rapidement se transformer... en catastrophe ! Toujours pas de héros récurrent mais les gags s\'enchaînent autour de cet univers délicieux.\r\n\r\nL\'auteur de \"Dad\" et de \"Mamette\" permet à chacun de retrouver, avec tendresse et parfois un brin de nostalgie, les mots d\'enfants à la cantine, la philosophie de réfectoire et surtout les plats gastronomiques du cuistot !', '9.95', 'la-cantoche-60da71ec897fe110668204.jfif', '9791036314919', 1, '2021-06-29 03:05:48'),
(8, 2, 8, 2, 'LE CHAT RITABLE', 'Il était une fois un petit chat bienveillant, qui toujours secourait les pauvres et les mendiants. Le coeur sur la patte, généreux et fort aimable, ce chat exceptionnel, c\'était le chat Ritable.', '8.50', 'lanuitdeberk-60da725c9d647290723635.jfif', '9782350670744', 1, '2021-06-29 03:07:40'),
(9, 2, 9, 2, 'LES P\'TITES POULES - ALBUM COLLECTOR (TOMES 1 A 4) - VOL01', 'Connaissez-vous Carmen, la petite poulette qui en a sous la crête ? Son frère Carmélito, le téméraire petit poulet rose ? Leurs copains Coquenpâte, Coqsix, Molédecoq, Hucocotte et les autres agités du poulailler ? Voyages, humour, émotion, frisson et fantaisie... Voilà ce que vous trouverez dans le collector des quatre premières aventures des P\'tites Poules', '15.10', 'lesptitespoules-60da732ea8bc7104410614.jfif', '9782266177054', 1, '2021-06-29 03:11:10'),
(10, 2, 10, 1, 'MIMOSE ET SAM, TOME 01 - BASILIC EN PANIQUE ! - HISTOIRE COMPLETE', '\"Où étiez-vous la nuit dernière ? \" Mimose et Sam ont lancé leur enquête. Ils veulent découvrir qui a grignoté les feuilles de leur ami Basile. Aucun des insectes interrogés n\'admet être le coupable. Les deux amis doivent trouver des moyens pour le démasquer. Mais cela est plus facile à dire qu\'à faire ! Il faudra user de beaucoup d\'ingéniosité.', '7.95', 'mimoseetsam-60da742ee8a2e688714943.jfif', '9791036310119', 1, '2021-06-29 03:15:26'),
(11, 2, 11, 2, 'LA VENGEANCE DE CORNEBIDOUILLE', 'Ses parents l’ont envoyé au lit pour avoir renâclé devant sa soupe de légumes. Mais Pierre est décidé à ruser et à trouver un moyen imparable pour éliminer non seulement Cornebidouille, la sorcière coincée dans les cabinets, mais aussi l’horrible potage de sa propre mère!', '12.70', 'vengeancecornebidouille-60da74e2b40e1292243726.jfif', '9782211203166', 1, '2021-06-29 03:18:26'),
(12, 3, 17, 3, 'CORALINE (ED 2020 ILLUSTRE) - EDITION LUXE ILLUSTREE', 'Coraline vient d\'emménager dans une étrange maison et, comme ses parents n\'ont pas le temps de s\'occuper d\'elle, elle décide de jouer les exploratrices. Ouvrant une porte condamnée, elle pénètre dans un appartement identique au sien. Identique, et pourtant... Dans la droite ligne d\'Alice au pays des merveilles, ce roman à l\'atmosphère inoubliable a déjà conquis des millions de lecteurs. A partir de 13 ans', '19.90', 'coraline-60da7ebf99bd3998432452.jfif', '9782226453587', 1, '2021-06-29 04:00:31'),
(13, 3, 18, 2, 'L\'ICKABOG', 'J.K. Rowling est l\'autrice des sept livres de Harry Potter, initialement parus entre 1997 et 2007. C\'est à bord d\'un train en retard que l\'idée de Harry Potter lui est venue pour la première fois. L\'écriture de la saga s\'étalera ensuite sur plusieurs années et dans plusieurs pays : l\'Angleterre, le Portugal et enfin l\'Ecosse.Les aventures de Harry, Ron et Hermione à Poudlard, la célèbre école de sorcellerie, se sont vendues à plus de 500 millions d\'exemplaires, ont été traduites en plus de 80 langues et ont été adaptées au cinéma en huit films qui ont tous connu un vaste succès. Parallèlement, J.K. Rowling a rédigé trois brefs guides destinés à soutenir des actions caritatives : Le Quidditch à travers les âges, Les Animaux fantastiques et Les Contes de Beedle le Barde. Les Animaux fantastiques ont par la suite donné naissance à une série de films dont J.K. Rowling a signé le scénario, qui mettent en scène le magizoologiste Norbert Dragonneau. Le dernier en date, Les Animaux fantastiques : les Crimes de Grindelwald, est sorti en 2018.J.K. Rowling a aussi poursuivi l\'histoire de Harry Potter adulte dans une pièce de théâtre, Harry Potter et l\'enfant maudit, qu\'elle a co-écrit avec le dramaturge Jack Thorne et le metteur en scène John Tiffany. La pièce a reçu un excellent accueil, que ce soit en Europe, en Amérique du Nord ou en Australie.Elle écrit également des romans pour adultes et, sous le nom de plume Robert Galbraith, a signé la série policière Les Enquêtes de Cormoran Strike, qui a été adaptée à la télévision.J.K. Rowling a reçu de nombreuses récompenses et distinctions, dont l\'Ordre de l\'Empire Britannique et le titre de Compagnon d\'honneur, la Légion d\'honneur, le prix Hans Christian Andersen, le Robert F. Kennedy Ripple of Hope Award et un Blue Peter Gold Badge. Elle soutient plusieurs causes à travers son association caritative, Volant, et a fondé l\'ONG Lumos, qui se bat pour que les enfants soient élevés par leur famille, et non dans des orphelinats.D\'aussi loin qu\'elle s\'en souvienne, elle a toujours rêvé d\'être écrivaine et elle n\'est jamais aussi heureuse qu\'enfermée dans une pièce, en train d\'inventer des histoires. Elle vit en Ecosse avec sa famille. Clémentine Beauvais est autrice et traductrice de nombreux livres pour la jeunesse, et enseignante-chercheuse en sciences de l\'éducation à l\'université de York (Royaume-Uni).Elle est la traductrice en français, entre autres, de Sarah Crossan (Inséparables, Swimming-Pool, Moon Brothers, Toffee et moi, aux éditions Rageot) et Elizabeth Acevedo (Signé Poète X), toutes deux gagnantes de la Carnegie Medal et, pour Elizabeth Acevedo du National Book Award. Elle a également traduit deux romans de Meg Rosoff. Sa traduction la plus récente estWoman World, une bande dessinée d\'Aminder Dhaliwal, pour les éditions la ville brûle.Ses propres romans et albums, dontLes petites reines(Sarbacane, 2015),Songe à la douceur(Sarbacane, 2016),La louve(Alice, 2015, illustré par Antoine Déprez) ouBrexit Romance(Sarbacane, 2018) sont traduits en une quinzaine de langues et ont remporté nombre de récompenses nationales et internationales, dont le Prix Sorcières, le Prix des Incorruptibles, le Prix Libr\'à Nous, et la liste White Ravens de la bibilothèque internationale de Munich.Clémentine Beauvais enseigne la littérature jeunesse, l\'écriture créative et la pratique de la traduction avec les enfants dans le département de sciences de l\'éducation de l\'université de York, et mène dans les écoles françaises et britanniques de nombreux ateliers de traduction littéraire et d\'écriture créative.', '20.00', 'ickabog-60da7e896e565244797901.jfif', '9782075150552', 1, '2021-06-29 03:59:37'),
(14, 3, 19, 2, 'LE CHATEAU DE HURLE', 'La trilogie arrive enfin dans son intégralité en France ! Découvrez le roman qui a inspiré le chef d\'oeuvre acclamé de Miyazaki, Le Château ambulant ? ! Au coeur de la contrée magique d\'Ingarie, la jeune Sophie s\'est résignée à un avenir morne dans sa petite chapellerie de quartier. Mais lorsqu\'elle a le malheur d\'offusquer la sorcière des Steppes, celle-ci lui dérobe 60 ans de sa vie, la laissant vieille et démunie.\r\nCherchant désespérément un moyen de briser le sortilège, Sophie rejoindra alors l\'équipe haute en couleur du grand mage Hurle. C\'est au sein de son mystérieux château ambulant qu\'elle se retrouvera à pactiser avec le malicieux démon de feu Calcifer. C\'est une aventure extraordinaire à la recherche de sa jeunesse volée qui commence alors pour Sophie, prête à reprendre en main son destin... Autrice acclamée de littérature fantastique, Diana Wynne Jones (1934-2011) a remporté de nombreux prix, dont le Guardian Award for Children\'s Fiction et deux Mythopoeic Fantasy Awards.\r\nElle est plus connue pour ses séries Chrestomanci, L\'Odyssée DaleMark et, bien entendu, pour sa trilogie du Château.', '14.95', 'lechateauhurle-60da7e5fb2198238329361.jfif', '9782376971290', 1, '2021-06-29 03:58:55'),
(15, 3, 19, 2, 'LA TRILOGIE DE HURLE - T02 - LE CHATEAU DES NUAGES, LA TRILOGIE DE HURLE 2', 'La suite tant attendue du Château de Hurle vous emmène cette fois au sud d\'Ingarie, dans les mondes imaginaires des Mille et une nuits ! Loin du pays d\'Ingarie, dans le sultanat du Rajpout, un jeune marchand se plaît à rêver à une vie différente. Il s\'imagine ainsi fils de roi, promis depuis sa naissance à une belle princesse, bien loin de sa vie miséreuse et de son père Ingrat, bien loin de son petit étal de tapis.\r\nLorsqu\'un beau jour, un étranger lui vend un tapis volant, la vie d\'Abdallah prend un tournant pour le moins inattendu. Les péripéties s\'enchaînent et le destin de notre héros semble soudain lié à celui de la superbe princesse Fleur-dans-la-Nuit. Pour la retrouver, il part pour une incroyable odyssée, semée de djinns légendaires, de sorciers, de prophéties anciennes... et d\'un mystérieux château dans les nuages.', '14.95', 'lechateaudesnuages-60da7e3e40d00098469776.jfif', '9782376971757', 1, '2021-06-29 03:58:22'),
(16, 3, 20, 1, 'PETIT VAMPIRE', 'Tout a commencé par un film d\'horreur. « Ce n\'est pas de ton âge, Michel », m\'avait pourtant prévenu Petit Vampire. Mais on est quand même allés voir Le Commando des morts vivants. Les zombies nazis étaient effrayants, mais comme c\'était du cinéma, ça allait. Le problème, c\'est que ces affreux sont revenus le soir, dans mon rêve. J\'ai inventé une porte et ils sont partis, ouf ! Sauf que je ne savais pas où menait cette porte. Et puis Marguerite est arrivé pour me dire de venir vite, parce que d\'horribles zombies avaient débarqué chez Petit Vampire...', '9.50', 'petitvampire-60da7e0403407445149700.jfif', '9782211311021', 1, '2021-06-29 03:57:24'),
(17, 4, 12, 4, 'L\'AGE D\'OR - TOME 2', 'Avec l\'hiver, la guerre a commencé. Tandis que les insurgés rassemblent leurs troupes et remontent depuis la Péninsule, la princesse Tilda assiège le château de son frère pour reconquérir son trône. En haut des remparts, en première ligne, les \"gueux\" se préparent à l\'assaut.Ce deuxième tome conclut en majesté l\'épopée flamboyante de \" L\'Age d\'or \", ce livre assez puissant pour déchaîner la tempête et la révolution, la force d\'une utopie qui donne envie de croire en l\'avenir.', '12.00', 'agedor-60da7b78278bf860228952.jfif', '9791034732647', 1, '2021-06-29 03:46:32'),
(18, 4, 13, 4, 'AILEFROIDE - ALTITUDE 3954', 'De Grenoble à la Bérarde en mobylette. Des rappels tirés sur la façade du Lycée Champollion. Avec l\'exaltation pure qui tape aux tempes, quand on bivouaque suspendu sous le ciel criblé d\'étoiles, où qu\'à seize ans à peine on se lance dans des grandes voies. La Dibona, le pilier Frendo, le Coup de Sabre, la Pierre Alain à la Meije, la Rébuffat au Pavé : le Massif des Ecrins tout entier offert comme une terre d\'aventure, un royaume, un champ de bataille parfois.\r\nCar la montagne réclame aussi son dû et la mort rôde dans les couloirs glacés.', '28.00', 'ailefroide-60da7bec8b4af754513205.jpg', '9782203121935', 1, '2021-06-29 03:48:28'),
(19, 4, 14, 2, 'GEANTE - ONE-SHOT', 'Elle était une fois Céleste, géante véritable, orpheline recueillie au coeur de la montagne, petite dernière d\'une famille de six frères. Et quand vient le temps où chacun s\'envole du cocon familial, Céleste veut elle aussi arpenter de nouveaux horizons. De la Vallée aux Marais en passant par Dorsodoro, elle découvrira l\'hostilité créée par la différence, les injustices de la guerre ou de la religion mais aussi l\'amour et pourquoi pas, au bout du chemin, la liberté d\'être elle-même ?', '27.95', 'geante-60da7c9c0f11a156343300.jfif', '9782413000167', 1, '2021-06-29 03:51:24'),
(20, 4, 15, 1, 'LE MONDE AU BALCON - CARNET DESSINE D\'UN PRINTEMPS CONFINE', 'J\'ai commencé ce carnet en janvier 2020, je voulais dessiner mon quotidien avec légèreté, sans objectif précis... Qui aurait pu prévoir que ce petit projet insouciant allait se changer en journal de bord de l\'événement mondial le plus inédit du 21e siècle ? Dessinatrice vedette d\'instagram, Sophie Lambda est l\'autrice de la remarquable bd tant pis pour l\'amour, parue en 2019. Dans le monde au balcon, elle donne aux petites histoires personnelles et grandes réalités collectives un coup de crayon libérateur.', '18.90', 'lemondeaubalcon-60da7d4a03db4388782266.jfif', '9782226455789', 1, '2021-06-29 03:54:18'),
(21, 4, 16, 1, 'RADIUM GIRLS', 'Des destins de femmes sacrifiées sur l’autel du progrès.\r\n\r\nNew Jersey, 1918. Edna Bolz entre comme ouvrière à l’United State Radium Corporation, une usine qui fournit l’armée en montres. Aux côtés de Katherine, Mollie, Albina, Quinta et les autres, elle va apprendre le métier qui consiste à peindre des cadrans à l’aide de la peinture Undark (une substance luminescente très précieuse et très chère) à un rythme constant. Mais bien que la charge de travail soit soutenue, l’ambiance à l’usine est assez bonne. Les filles s’entendent bien et sortent même ensemble le soir. Elles se surnomment les « Ghost Girls » : par jeu, elles se peignent les ongles, les dents ou le visage afin d’éblouir (littéralement) les autres une fois la nuit tombée. Mais elles ignorent que, derrière ses propriétés étonnantes, le Radium, cette substance qu’elles manipulent toute la journée et avec laquelle elles jouent, est en réalité mortelle. Et alors que certaines d’entre elles commencent à souffrir d’anémie, de fractures voire de tumeur, des voix s’élèvent pour comprendre. D’autres, pour étouffer l’affaire...\r\n\r\nLa dessinatrice Cy nous raconte le terrible destin des Radium Girls, ces jeunes femmes injustement sacrifiées sur l’autel du progrès technique. Un parcours de femmes dans la turbulente Amérique des années 1920 où, derrière l’insouciance lumineuse de la jeunesse, se joue une véritable tragédie des temps modernes.', '22.00', 'radiumgirls-60da7ddb21fa3781431028.jfif', '9782344033449', 1, '2021-06-29 03:56:43');

-- --------------------------------------------------------

--
-- Structure de la table `rencontre`
--

CREATE TABLE `rencontre` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `journee` tinyint(1) NOT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `roles`, `password`, `nom`) VALUES
(1, 'Igor', 'Marchand@mail.fr', '[\"ROLE_ADMIN\"]', '$2y$13$avJp9DqBNYRn1SYr3UByd./3y8Jg/GZ20Tw8iDzAf366H5qZNnTl2', 'Marchand'),
(2, 'Françoise', 'Françoise@mail.com', '[\"ROLE_USER\"]', '$2y$13$o0u/h6ybkLImqPFE3d9op.8evpJGJ5D7v.mZ/HrDmgDazw54TyJme', 'Le Tonnelier');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2CEDC87728CDC89C` (`home_id`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D9BEC0C4EBF07F38` (`livres_id`),
  ADD KEY `IDX_D9BEC0C4CF18BB82` (`reponse_id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC634F99BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_AC634F9960BB6FE6` (`auteur_id`),
  ADD KEY `IDX_AC634F993375BD21` (`editeur_id`);

--
-- Index pour la table `rencontre`
--
ALTER TABLE `rencontre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_460C35ED28CDC89C` (`home_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `rencontre`
--
ALTER TABLE `rencontre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `FK_2CEDC87728CDC89C` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`);

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `FK_D9BEC0C4CF18BB82` FOREIGN KEY (`reponse_id`) REFERENCES `commentaires` (`id`),
  ADD CONSTRAINT `FK_D9BEC0C4EBF07F38` FOREIGN KEY (`livres_id`) REFERENCES `livre` (`id`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_AC634F993375BD21` FOREIGN KEY (`editeur_id`) REFERENCES `editeur` (`id`),
  ADD CONSTRAINT `FK_AC634F9960BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`),
  ADD CONSTRAINT `FK_AC634F99BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `rencontre`
--
ALTER TABLE `rencontre`
  ADD CONSTRAINT `FK_460C35ED28CDC89C` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
