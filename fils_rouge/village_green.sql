-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 29 mai 2024 à 10:23
-- Version du serveur : 10.6.16-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `village_green`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`admin`@`localhost` PROCEDURE `commandeNonRemise` ()  BEGIN
SELECT C.*
FROM commande C
JOIN utilisateur U on U.`Id_utilisateur`=C.`Id_utilisateur`
WHERE U.reduction=NULL and C.etat_livraison='En cours de livraison';
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `delaisMoyenLivraison` ()  BEGIN
SELECT AVG(DATEDIFF(commande.date_commande, commande.date_facturation))
FROM commande
WHERE commande.date_commande is NOT NULL AND commande.date_facturation is NOT NULL;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `Id_article` int(11) NOT NULL,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `prix_HT` decimal(10,2) NOT NULL,
  `Id_sous_rubrique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`Id_article`, `libelle_court`, `libelle`, `image`, `prix_HT`, `Id_sous_rubrique`) VALUES
(1, 'Tambourin', 'Diamètre: 10\" Corps en bois Peau naturelle clouée (non accordable) 9 paires de cymbalette', 'tambourin.png', '11.90', 1),
(2, 'Timbale', 'Fût parabolique en fibre de verre, Pédale d\'accordage fixe, Accordage fin.', 'timbale.png', '2100.90', 1),
(3, 'Djembé', 'Modèle 38241095, Hauteur: env. 500 mm, Diamètre: 240-260 mm, Fût en acajou, Peau de chèvre naturelle', 'djembe.png', '70.99', 1),
(4, 'Xylophone', 'Format de table, 3 octaves, Tessiture: Do5 - Do8, La = 442 Hz, Cadre en bois', 'xylophone.png', '298.99', 2),
(5, 'Carillons tubulaires', '1 1/2 octave, Tessiture: Do5 - Fa6, La = 442 Hz, Tubes standards 1,25\"', 'carillons.png', '5499.00', 2),
(6, 'Triangle', 'Triangle 15cm, Batte incl.', 'triangle.png', '5499.00', 2),
(7, 'Contrebasse', 'Fabriquée en Europe, Table en épicéa massif, Fond bombé en érable massif, Touche ronde en ébène', 'contrebasse.png', '2490.00', 3),
(8, 'Violoncelle', 'Table et fond en contreplaqué, Manche en érable, Touche en érable teinté noir', 'violoncelle.png', '410.49', 3),
(9, 'Violon', 'Set bon marché comprenant un violon étudiant, un archet et un étui, Table en épicéa massif', 'violon.png', '70.00', 3),
(10, 'Harpe', '29 cordes, Tessiture: Sol3 - Sol, Corps et cadre en hêtre, Leviers de demi-ton', 'harpe.png', '550.00', 4),
(11, 'Harpe celtique', '36 cordes, 31 leviers de demi-ton, Tessiture: Do1 - Do6,Corps en frêne', 'harpeC.png', '550.00', 4),
(12, 'Ukulélé', 'Electro-acoustique, Série Custom Line Kahuna, Pan coupé, Corps en acacia', 'ukulele.png', '111.15', 4),
(13, 'Piano numérique', 'Avec accompagnement automatique, 88 touches lestées, Mécanique à marteaux, 500 sons', 'pianoNum.png', '555.55', 5),
(14, 'Piano droit', 'Equipé du système Aures,Mécanique Millennium III avec pièces en carbone ABS, Pupitre de 100 cm', 'pianoDroit.png', '13100.90', 5),
(15, 'Piano à queue', 'Mécanique Millennium III avec pièces en ABS Styran, Pédale sostenuto, Têtes des marteaux avec feutre', 'pianoAQue.png', '10100.99', 5),
(16, 'Tuba', 'Modèle \"Student\", Tuba 4/4 compact, 4 palettes, Rotules', 'Tuba.png', '1800.99', 6),
(17, 'Trompette', 'Branche d\'embouchure en laiton doré, Pistons en acier inoxydable, Perce: ML', 'Trompette.png', '149.99', 6),
(18, 'Trombone', 'Corps en laiton, Perce ML: 12,2 mm, Diamètre du pavillon: 205 mm', 'Trombone.png', '189.99', 6),
(19, 'Saxophone', 'Clé de Fa avant, Clé de Fa# aigu, Corps, bocal et clétage en laiton', 'Saxophone.png', '555.55', 7),
(20, 'Clarinette', 'Nouvelle version améliorée, En grenadille, Système allemand', 'Clarinette.png', '889.99', 7),
(21, 'Flûte traversière', 'Tête, corps et mécanique en maillechort argenté, Mi mécanique, Plateaux creux', 'Clarinette.png', '169.69', 7);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `article_fournisseur`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `article_fournisseur` (
`Id_article` int(11)
,`libelle_court` varchar(30)
,`libelle` varchar(100)
,`image` varchar(100)
,`prix_HT` decimal(10,2)
,`Id_sous_rubrique` int(11)
,`numéro_fournisseur` varchar(20)
,`nom` varchar(50)
,`adresse` varchar(200)
,`pays` varchar(30)
,`ville` varchar(50)
,`téléphone` varchar(20)
,`code_postal` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `article_rubrique`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `article_rubrique` (
`Id_article` int(11)
,`article_image` varchar(100)
,`article_libelle` varchar(100)
,`article_libelle_court` varchar(30)
,`article_prixHT` decimal(10,2)
,`Id_sous_rubrique` int(11)
,`sous_rubrique_image` varchar(100)
,`sous_rubrique_libelle` varchar(100)
,`sous_rubrique_libelle_court` varchar(30)
,`Id_Rubrique` int(11)
,`rubrique_image` varchar(100)
,`rubrique_libelle` varchar(100)
,`rubrique_libelle_court` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `montant_commande_HT` decimal(11,2) NOT NULL,
  `montant_commande_TTC` decimal(11,2) NOT NULL,
  `TVA` decimal(5,2) DEFAULT NULL,
  `Id_facture` int(11) NOT NULL,
  `date_facturation` date NOT NULL DEFAULT current_timestamp(),
  `moyen_paiement` varchar(20) NOT NULL,
  `adresse_facturation` varchar(100) NOT NULL,
  `etat_facture` varchar(20) NOT NULL,
  `adresse_livraison` varchar(100) NOT NULL,
  `etat_livraison` varchar(20) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composer_de`
--

CREATE TABLE `composer_de` (
  `Id_commande` int(11) NOT NULL,
  `Id_article` int(11) NOT NULL,
  `nombre_d_article` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `encadre`
--

CREATE TABLE `encadre` (
  `Id_utilisateur` int(11) NOT NULL,
  `matricule_personnel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `encadre`
--

INSERT INTO `encadre` (`Id_utilisateur`, `matricule_personnel`) VALUES
(1, 'UNK-0000-NOW'),
(2, 'POP-0088-POP'),
(3, 'UNK-0000-NOW'),
(4, 'POP-0088-POP'),
(5, 'UNK-0000-NOW');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `numéro_fournisseur` varchar(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `téléphone` varchar(20) NOT NULL,
  `code_postal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`numéro_fournisseur`, `nom`, `adresse`, `pays`, `ville`, `téléphone`, `code_postal`) VALUES
('272-06-5061', 'Omega Protein Corporation', 'Apt 1425', 'China', 'Lingbei', '988-523-1996', ''),
('314-44-1522', 'BP p.l.c.', '17th Floor', 'Philippines', 'San Jose', '701-605-2925', '8427'),
('431-40-3894', 'Celestica, Inc.', 'Room 1572', 'China', 'Hengshan', '389-738-5886', ''),
('467-98-9455', 'Evertec, Inc.', 'Apt 709', 'China', 'Shanxi', '606-430-5957', ''),
('490-14-2726', 'Armstrong World Industries Inc', '7th Floor', 'Poland', 'Dobra', '251-355-5618', '72-210'),
('663-72-8566', 'Richmont Mines, Inc.', 'PO Box 25724', 'Ukraine', 'Fontanka', '532-238-0234', ''),
('706-78-5806', 'Bonanza Creek Energy, Inc.', 'Apt 229', 'Russia', 'Novozavedennoye', '784-332-2536', '357813'),
('750-35-0406', 'TrueCar, Inc.', 'PO Box 22055', 'Mexico', 'Santiago', '774-708-5322', '54784'),
('801-59-9912', 'Kenon Holdings Ltd.', 'PO Box 65049', 'China', 'Shataping', '135-131-0684', ''),
('865-64-9469', 'Exxon Mobil Corporation', 'PO Box 53794', 'Sweden', 'Bollstabruk', '480-709-3122', '873 80');

-- --------------------------------------------------------

--
-- Structure de la table `fournit`
--

CREATE TABLE `fournit` (
  `numéro_fournisseur` varchar(20) NOT NULL,
  `Id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournit`
--

INSERT INTO `fournit` (`numéro_fournisseur`, `Id_article`) VALUES
('272-06-5061', 1),
('272-06-5061', 11),
('272-06-5061', 21),
('314-44-1522', 2),
('314-44-1522', 12),
('431-40-3894', 3),
('431-40-3894', 13),
('467-98-9455', 4),
('467-98-9455', 14),
('490-14-2726', 5),
('490-14-2726', 15),
('663-72-8566', 6),
('663-72-8566', 16),
('706-78-5806', 7),
('706-78-5806', 17),
('750-35-0406', 8),
('750-35-0406', 18),
('801-59-9912', 9),
('801-59-9912', 19),
('865-64-9469', 10),
('865-64-9469', 20);

-- --------------------------------------------------------

--
-- Structure de la table `gere`
--

CREATE TABLE `gere` (
  `Id_article` int(11) NOT NULL,
  `matricule_personnel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gere`
--

INSERT INTO `gere` (`Id_article`, `matricule_personnel`) VALUES
(1, 'MAX-6858-LUX'),
(2, 'MAX-6858-LUX'),
(3, 'MAX-6858-LUX'),
(4, 'MAX-6858-LUX'),
(5, 'MAX-6858-LUX'),
(6, 'MAX-6858-LUX'),
(7, 'MAX-6858-LUX'),
(8, 'MAX-6858-LUX'),
(9, 'MAX-6858-LUX'),
(10, 'MAX-6858-LUX'),
(11, 'MAX-6858-LUX'),
(12, 'MAX-6858-LUX'),
(13, 'MAX-6858-LUX'),
(14, 'MAX-6858-LUX'),
(15, 'MAX-6858-LUX'),
(16, 'MAX-6858-LUX'),
(17, 'MAX-6858-LUX'),
(18, 'MAX-6858-LUX'),
(19, 'MAX-6858-LUX'),
(20, 'MAX-6858-LUX'),
(21, 'MAX-6858-LUX');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `Id_livraison` int(11) NOT NULL,
  `date_livraison` date DEFAULT NULL,
  `URL_transporteur` varchar(50) DEFAULT NULL,
  `nom_transporteur` varchar(50) DEFAULT NULL,
  `Id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `l_a`
--

CREATE TABLE `l_a` (
  `Id_article` int(11) NOT NULL,
  `Id_livraison` int(11) NOT NULL,
  `quantité_livré` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `matricule_personnel` varchar(30) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `téléphone` varchar(50) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `mot_de_passe` varchar(300) DEFAULT NULL,
  `service` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  `code_postal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`matricule_personnel`, `nom`, `prenom`, `adresse`, `téléphone`, `mail`, `mot_de_passe`, `service`, `role`, `code_postal`) VALUES
('FED-4868-FES', 'ALCAPONE', 'Pedro', '4 rue des lilas', '07/15/82/72/89', 'pedro.alcapone@village_green.com', 'M1tra1lette', 'COMMERCIAL', 'CHEF', '84450'),
('MAX-6858-LUX', 'LICORNE', 'Magalax', '13 rue des arc-en-ciel', '09/12/40/89/69', 'magalax.licorne@village_green.com', 'M@tr@que', 'GESTION', 'CHEF', '84450'),
('POP-0088-POP', 'POPO', 'Eric', ' 67 rue des déchets', '07/18/69/71/29', 'eric.popo@village_green.com', '1KaKa00', 'COMMERCIAL', 'EMPLOYER', '84450'),
('UNK-0000-NOW', 'UNKNOW', 'Aline', '1 allée de la plage', '07/15/82/72/89', 'aline.unknow@village_green.com', 'JeSa1sPas', 'COMMERCIAL', 'EMPLOYER', '84482'),
('ZDE-4568-AZE', 'ESCOBAR', 'Pablo', '9 rue des coques', '07/01/02/52/87', 'pablo.escobar@village_green.com', '1Traf1que', 'DIRECTION', 'CHEF', '84550');

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `Id_Rubrique` int(11) NOT NULL,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`Id_Rubrique`, `libelle_court`, `libelle`, `image`) VALUES
(1, 'Percussion', 'liste des instruments à percussion (membranophones et idiophones)', 'percussion.png'),
(2, 'Corde', 'les instruments à cordes (frottées, pincées ou frappées)', 'corde.png'),
(3, 'Vent', 'les instruments à vent (cuivres et bois)', 'vent.png');

-- --------------------------------------------------------

--
-- Structure de la table `sous_rubrique`
--

CREATE TABLE `sous_rubrique` (
  `Id_sous_rubrique` int(11) NOT NULL,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `Id_Rubrique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sous_rubrique`
--

INSERT INTO `sous_rubrique` (`Id_sous_rubrique`, `libelle_court`, `libelle`, `image`, `Id_Rubrique`) VALUES
(1, 'Les membranophones', 'La famille d’instruments des membranophones.', 'percussionM.png', 1),
(2, 'Les idiophones', 'La famille des idiophones.', 'percussionI.png', 1),
(3, 'Les cordes frottées', 'Dans cette famille, on a le violon, l’alto, le violoncelle.', 'cordesF.png', 2),
(4, 'Les cordes pincées', 'Dans cette famille, on a par exemple la basse, la guitare.', 'cordesP.png', 2),
(5, 'Les cordes frappées', 'La famille des cordes frappées, les cordes sont frappées soit manuellement soit mécaniquement.', 'cordesFrap.png', 2),
(6, 'Les cuivres', 'La famille des cuivres regroupe les instruments comme le trombone, la trompette à pistons, le tuba.', 'cuivres.png', 3),
(7, 'Les bois', 'Parmi les bois, on connaît bien le saxophone, la clarinette, le basson.', 'bois.png', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Id_utilisateur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prénom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `Téléphone` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `mot_de_passe` varchar(300) NOT NULL,
  `reduction` decimal(5,2) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Id_utilisateur`, `nom`, `prénom`, `adresse`, `code_postal`, `pays`, `ville`, `Téléphone`, `mail`, `mot_de_passe`, `reduction`, `type`) VALUES
(1, 'DUPONT', 'Marc', '9 rue des pont', '80090', 'FRANCE', 'AMIENS', '06/12/69/85/12', 'marc.dupont@gmail.com', '1Tunnel', '10.00', 'spéciale'),
(2, 'DUPOND', 'Marie', '94 rue des porc-épique', '85090', 'FRANCE', 'DOUX', '06/14/71/47/58', 'marie.dupond@gmail.fr', '1Vortex', NULL, 'particulier'),
(3, 'CAP', 'Cesar', '45 rue des laurier', '84090', 'FRANCE', 'AMER', '06/17/32/47/63', 'cesar.cap@hotmail.fr', '2Gaulois', '30.00', 'spéciale'),
(4, 'INCONNU', 'Didier', '9 rue des impasses', '90000', 'FRANCE', 'PARTER', '06/10/80/00/00', 'didier.inconnu@gmail.com', '1Connu', NULL, 'particulier'),
(5, 'Bella', 'Belle', '90 rue des champs', '60000', 'FRANCE', 'ROSE', '06/18/50/77/88', 'belle.bella@gmail.fr', '1Bgelle', '12.00', 'spéciale');

-- --------------------------------------------------------

--
-- Structure de la vue `article_fournisseur`
--
DROP TABLE IF EXISTS `article_fournisseur`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `article_fournisseur`  AS SELECT `article`.`Id_article` AS `Id_article`, `article`.`libelle_court` AS `libelle_court`, `article`.`libelle` AS `libelle`, `article`.`image` AS `image`, `article`.`prix_HT` AS `prix_HT`, `article`.`Id_sous_rubrique` AS `Id_sous_rubrique`, `fournisseur`.`numéro_fournisseur` AS `numéro_fournisseur`, `fournisseur`.`nom` AS `nom`, `fournisseur`.`adresse` AS `adresse`, `fournisseur`.`pays` AS `pays`, `fournisseur`.`ville` AS `ville`, `fournisseur`.`téléphone` AS `téléphone`, `fournisseur`.`code_postal` AS `code_postal` FROM ((`article` join `fournit` on(`fournit`.`Id_article` = `article`.`Id_article`)) join `fournisseur` on(`fournit`.`numéro_fournisseur` = `fournit`.`numéro_fournisseur`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `article_rubrique`
--
DROP TABLE IF EXISTS `article_rubrique`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `article_rubrique`  AS SELECT `a`.`Id_article` AS `Id_article`, `a`.`image` AS `article_image`, `a`.`libelle` AS `article_libelle`, `a`.`libelle_court` AS `article_libelle_court`, `a`.`prix_HT` AS `article_prixHT`, `s`.`Id_sous_rubrique` AS `Id_sous_rubrique`, `s`.`image` AS `sous_rubrique_image`, `s`.`libelle` AS `sous_rubrique_libelle`, `s`.`libelle_court` AS `sous_rubrique_libelle_court`, `r`.`Id_Rubrique` AS `Id_Rubrique`, `r`.`image` AS `rubrique_image`, `r`.`libelle` AS `rubrique_libelle`, `r`.`libelle_court` AS `rubrique_libelle_court` FROM ((`article` `a` join `sous_rubrique` `s` on(`a`.`Id_sous_rubrique` = `s`.`Id_sous_rubrique`)) join `rubrique` `r` on(`r`.`Id_Rubrique` = `s`.`Id_Rubrique`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`Id_article`),
  ADD KEY `Id_sous_rubrique` (`Id_sous_rubrique`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Id_commande`),
  ADD KEY `Id_facture` (`Id_facture`),
  ADD KEY `Id_utilisateur` (`Id_utilisateur`);

--
-- Index pour la table `composer_de`
--
ALTER TABLE `composer_de`
  ADD PRIMARY KEY (`Id_commande`,`Id_article`),
  ADD KEY `Id_article` (`Id_article`);

--
-- Index pour la table `encadre`
--
ALTER TABLE `encadre`
  ADD PRIMARY KEY (`Id_utilisateur`,`matricule_personnel`),
  ADD KEY `matricule_personnel` (`matricule_personnel`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`numéro_fournisseur`);

--
-- Index pour la table `fournit`
--
ALTER TABLE `fournit`
  ADD PRIMARY KEY (`numéro_fournisseur`,`Id_article`),
  ADD KEY `Id_article` (`Id_article`);

--
-- Index pour la table `gere`
--
ALTER TABLE `gere`
  ADD PRIMARY KEY (`Id_article`,`matricule_personnel`),
  ADD KEY `matricule_personnel` (`matricule_personnel`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`Id_livraison`),
  ADD KEY `Id_commande` (`Id_commande`);

--
-- Index pour la table `l_a`
--
ALTER TABLE `l_a`
  ADD PRIMARY KEY (`Id_article`,`Id_livraison`),
  ADD KEY `Id_livraison` (`Id_livraison`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`matricule_personnel`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`Id_Rubrique`);

--
-- Index pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD PRIMARY KEY (`Id_sous_rubrique`),
  ADD KEY `Id_Rubrique` (`Id_Rubrique`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `Id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `Id_livraison` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `Id_Rubrique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  MODIFY `Id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Id_sous_rubrique`) REFERENCES `sous_rubrique` (`Id_sous_rubrique`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`);

--
-- Contraintes pour la table `composer_de`
--
ALTER TABLE `composer_de`
  ADD CONSTRAINT `composer_de_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`),
  ADD CONSTRAINT `composer_de_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`);

--
-- Contraintes pour la table `encadre`
--
ALTER TABLE `encadre`
  ADD CONSTRAINT `encadre_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`),
  ADD CONSTRAINT `encadre_ibfk_2` FOREIGN KEY (`matricule_personnel`) REFERENCES `personnel` (`matricule_personnel`);

--
-- Contraintes pour la table `fournit`
--
ALTER TABLE `fournit`
  ADD CONSTRAINT `fournit_ibfk_1` FOREIGN KEY (`numéro_fournisseur`) REFERENCES `fournisseur` (`numéro_fournisseur`),
  ADD CONSTRAINT `fournit_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`);

--
-- Contraintes pour la table `gere`
--
ALTER TABLE `gere`
  ADD CONSTRAINT `gere_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  ADD CONSTRAINT `gere_ibfk_2` FOREIGN KEY (`matricule_personnel`) REFERENCES `personnel` (`matricule_personnel`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`);

--
-- Contraintes pour la table `l_a`
--
ALTER TABLE `l_a`
  ADD CONSTRAINT `l_a_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  ADD CONSTRAINT `l_a_ibfk_2` FOREIGN KEY (`Id_livraison`) REFERENCES `livre` (`Id_livraison`);

--
-- Contraintes pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`Id_Rubrique`) REFERENCES `rubrique` (`Id_Rubrique`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
