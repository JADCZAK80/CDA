-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: village_green
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `Id_article` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `prix_HT` decimal(10,2) NOT NULL,
  `Id_sous_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_article`),
  KEY `Id_sous_rubrique` (`Id_sous_rubrique`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Id_sous_rubrique`) REFERENCES `sous_rubrique` (`Id_sous_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Tambourin','Diamètre: 10\" Corps en bois Peau naturelle clouée (non accordable) 9 paires de cymbalette','tambourin.png',11.90,1),(2,'Timbale','Fût parabolique en fibre de verre, Pédale d\'accordage fixe, Accordage fin.','timbale.png',2100.90,1),(3,'Djembé','Modèle 38241095, Hauteur: env. 500 mm, Diamètre: 240-260 mm, Fût en acajou, Peau de chèvre naturelle','djembe.png',70.99,1),(4,'Xylophone','Format de table, 3 octaves, Tessiture: Do5 - Do8, La = 442 Hz, Cadre en bois','xylophone.png',298.99,2),(5,'Carillons tubulaires','1 1/2 octave, Tessiture: Do5 - Fa6, La = 442 Hz, Tubes standards 1,25\"','carillons.png',5499.00,2),(6,'Triangle','Triangle 15cm, Batte incl.','triangle.png',5499.00,2),(7,'Contrebasse','Fabriquée en Europe, Table en épicéa massif, Fond bombé en érable massif, Touche ronde en ébène','contrebasse.png',2490.00,3),(8,'Violoncelle','Table et fond en contreplaqué, Manche en érable, Touche en érable teinté noir','violoncelle.png',410.49,3),(9,'Violon','Set bon marché comprenant un violon étudiant, un archet et un étui, Table en épicéa massif','violon.png',70.00,3),(10,'Harpe','29 cordes, Tessiture: Sol3 - Sol, Corps et cadre en hêtre, Leviers de demi-ton','harpe.png',550.00,4),(11,'Harpe celtique','36 cordes, 31 leviers de demi-ton, Tessiture: Do1 - Do6,Corps en frêne','harpeC.png',550.00,4),(12,'Ukulélé','Electro-acoustique, Série Custom Line Kahuna, Pan coupé, Corps en acacia','ukulele.png',111.15,4),(13,'Piano numérique','Avec accompagnement automatique, 88 touches lestées, Mécanique à marteaux, 500 sons','pianoNum.png',555.55,5),(14,'Piano droit','Equipé du système Aures,Mécanique Millennium III avec pièces en carbone ABS, Pupitre de 100 cm','pianoDroit.png',13100.90,5),(15,'Piano à queue','Mécanique Millennium III avec pièces en ABS Styran, Pédale sostenuto, Têtes des marteaux avec feutre','pianoAQue.png',10100.99,5),(16,'Tuba','Modèle \"Student\", Tuba 4/4 compact, 4 palettes, Rotules','Tuba.png',1800.99,6),(17,'Trompette','Branche d\'embouchure en laiton doré, Pistons en acier inoxydable, Perce: ML','Trompette.png',149.99,6),(18,'Trombone','Corps en laiton, Perce ML: 12,2 mm, Diamètre du pavillon: 205 mm','Trombone.png',189.99,6),(19,'Saxophone','Clé de Fa avant, Clé de Fa# aigu, Corps, bocal et clétage en laiton','Saxophone.png',555.55,7),(20,'Clarinette','Nouvelle version améliorée, En grenadille, Système allemand','Clarinette.png',889.99,7),(21,'Flûte traversière','Tête, corps et mécanique en maillechort argenté, Mi mécanique, Plateaux creux','Clarinette.png',169.69,7);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `montant_commande_HT` decimal(11,2) NOT NULL,
  `montant_commande_TTC` decimal(11,2) NOT NULL,
  `TVA` decimal(5,2) DEFAULT NULL,
  `Id_facture` int(11) NOT NULL,
  `moyen_paiement` varchar(20) NOT NULL,
  `adresse_facturation` varchar(100) NOT NULL,
  `etat_facture` varchar(20) NOT NULL,
  `adresse_livraison` varchar(100) NOT NULL,
  `etat_livraison` varchar(20) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Id_commande`),
  KEY `Id_facture` (`Id_facture`),
  KEY `Id_utilisateur` (`Id_utilisateur`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer_de`
--

DROP TABLE IF EXISTS `composer_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composer_de` (
  `Id_commande` int(11) NOT NULL,
  `Id_article` int(11) NOT NULL,
  `nombre_d_article` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_commande`,`Id_article`),
  KEY `Id_article` (`Id_article`),
  CONSTRAINT `composer_de_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`),
  CONSTRAINT `composer_de_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer_de`
--

LOCK TABLES `composer_de` WRITE;
/*!40000 ALTER TABLE `composer_de` DISABLE KEYS */;
/*!40000 ALTER TABLE `composer_de` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encadre`
--

DROP TABLE IF EXISTS `encadre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encadre` (
  `Id_utilisateur` int(11) NOT NULL,
  `matricule_personnel` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_utilisateur`,`matricule_personnel`),
  KEY `matricule_personnel` (`matricule_personnel`),
  CONSTRAINT `encadre_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`),
  CONSTRAINT `encadre_ibfk_2` FOREIGN KEY (`matricule_personnel`) REFERENCES `personnel` (`matricule_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encadre`
--

LOCK TABLES `encadre` WRITE;
/*!40000 ALTER TABLE `encadre` DISABLE KEYS */;
INSERT INTO `encadre` VALUES (1,'UNK-0000-NOW'),(2,'POP-0088-POP'),(3,'UNK-0000-NOW'),(4,'POP-0088-POP'),(5,'UNK-0000-NOW');
/*!40000 ALTER TABLE `encadre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `numéro_fournisseur` varchar(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `téléphone` varchar(20) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`numéro_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES ('272-06-5061','Omega Protein Corporation','Apt 1425','China','Lingbei','988-523-1996',''),('314-44-1522','BP p.l.c.','17th Floor','Philippines','San Jose','701-605-2925','8427'),('431-40-3894','Celestica, Inc.','Room 1572','China','Hengshan','389-738-5886',''),('467-98-9455','Evertec, Inc.','Apt 709','China','Shanxi','606-430-5957',''),('490-14-2726','Armstrong World Industries Inc','7th Floor','Poland','Dobra','251-355-5618','72-210'),('663-72-8566','Richmont Mines, Inc.','PO Box 25724','Ukraine','Fontanka','532-238-0234',''),('706-78-5806','Bonanza Creek Energy, Inc.','Apt 229','Russia','Novozavedennoye','784-332-2536','357813'),('750-35-0406','TrueCar, Inc.','PO Box 22055','Mexico','Santiago','774-708-5322','54784'),('801-59-9912','Kenon Holdings Ltd.','PO Box 65049','China','Shataping','135-131-0684',''),('865-64-9469','Exxon Mobil Corporation','PO Box 53794','Sweden','Bollstabruk','480-709-3122','873 80');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournit`
--

DROP TABLE IF EXISTS `fournit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournit` (
  `numéro_fournisseur` varchar(20) NOT NULL,
  `Id_article` int(11) NOT NULL,
  PRIMARY KEY (`numéro_fournisseur`,`Id_article`),
  KEY `Id_article` (`Id_article`),
  CONSTRAINT `fournit_ibfk_1` FOREIGN KEY (`numéro_fournisseur`) REFERENCES `fournisseur` (`numéro_fournisseur`),
  CONSTRAINT `fournit_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournit`
--

LOCK TABLES `fournit` WRITE;
/*!40000 ALTER TABLE `fournit` DISABLE KEYS */;
INSERT INTO `fournit` VALUES ('272-06-5061',1),('272-06-5061',11),('272-06-5061',21),('314-44-1522',2),('314-44-1522',12),('431-40-3894',3),('431-40-3894',13),('467-98-9455',4),('467-98-9455',14),('490-14-2726',5),('490-14-2726',15),('663-72-8566',6),('663-72-8566',16),('706-78-5806',7),('706-78-5806',17),('750-35-0406',8),('750-35-0406',18),('801-59-9912',9),('801-59-9912',19),('865-64-9469',10),('865-64-9469',20);
/*!40000 ALTER TABLE `fournit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gere`
--

DROP TABLE IF EXISTS `gere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gere` (
  `Id_article` int(11) NOT NULL,
  `matricule_personnel` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_article`,`matricule_personnel`),
  KEY `matricule_personnel` (`matricule_personnel`),
  CONSTRAINT `gere_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  CONSTRAINT `gere_ibfk_2` FOREIGN KEY (`matricule_personnel`) REFERENCES `personnel` (`matricule_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gere`
--

LOCK TABLES `gere` WRITE;
/*!40000 ALTER TABLE `gere` DISABLE KEYS */;
INSERT INTO `gere` VALUES (1,'MAX-6858-LUX'),(2,'MAX-6858-LUX'),(3,'MAX-6858-LUX'),(4,'MAX-6858-LUX'),(5,'MAX-6858-LUX'),(6,'MAX-6858-LUX'),(7,'MAX-6858-LUX'),(8,'MAX-6858-LUX'),(9,'MAX-6858-LUX'),(10,'MAX-6858-LUX'),(11,'MAX-6858-LUX'),(12,'MAX-6858-LUX'),(13,'MAX-6858-LUX'),(14,'MAX-6858-LUX'),(15,'MAX-6858-LUX'),(16,'MAX-6858-LUX'),(17,'MAX-6858-LUX'),(18,'MAX-6858-LUX'),(19,'MAX-6858-LUX'),(20,'MAX-6858-LUX'),(21,'MAX-6858-LUX');
/*!40000 ALTER TABLE `gere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_a`
--

DROP TABLE IF EXISTS `l_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_a` (
  `Id_article` int(11) NOT NULL,
  `Id_livraison` int(11) NOT NULL,
  `quantité_livré` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_article`,`Id_livraison`),
  KEY `Id_livraison` (`Id_livraison`),
  CONSTRAINT `l_a_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  CONSTRAINT `l_a_ibfk_2` FOREIGN KEY (`Id_livraison`) REFERENCES `livre` (`Id_livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_a`
--

LOCK TABLES `l_a` WRITE;
/*!40000 ALTER TABLE `l_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS `livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livre` (
  `Id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `date_livraison` date DEFAULT NULL,
  `URL_transporteur` varchar(50) DEFAULT NULL,
  `nom_transporteur` varchar(50) DEFAULT NULL,
  `Id_commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_livraison`),
  KEY `Id_commande` (`Id_commande`),
  CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES `livre` WRITE;
/*!40000 ALTER TABLE `livre` DISABLE KEYS */;
/*!40000 ALTER TABLE `livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `code_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`matricule_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES ('FED-4868-FES','ALCAPONE','Pedro','4 rue des lilas','07/15/82/72/89','pedro.alcapone@village_green.com','M1tra1lette','COMMERCIAL','CHEF','84450'),('MAX-6858-LUX','LICORNE','Magalax','13 rue des arc-en-ciel','09/12/40/89/69','magalax.licorne@village_green.com','M@tr@que','GESTION','CHEF','84450'),('POP-0088-POP','POPO','Eric',' 67 rue des déchets','07/18/69/71/29','eric.popo@village_green.com','1KaKa00','COMMERCIAL','EMPLOYER','84450'),('UNK-0000-NOW','UNKNOW','Aline','1 allée de la plage','07/15/82/72/89','aline.unknow@village_green.com','JeSa1sPas','COMMERCIAL','EMPLOYER','84482'),('ZDE-4568-AZE','ESCOBAR','Pablo','9 rue des coques','07/01/02/52/87','pablo.escobar@village_green.com','1Traf1que','DIRECTION','CHEF','84550');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrique` (
  `Id_Rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (1,'Percussion','liste des instruments à percussion (membranophones et idiophones)','percussion.png'),(2,'Corde','les instruments à cordes (frottées, pincées ou frappées)','corde.png'),(3,'Vent','les instruments à vent (cuivres et bois)','vent.png');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_rubrique`
--

DROP TABLE IF EXISTS `sous_rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_rubrique` (
  `Id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `Id_Rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_sous_rubrique`),
  KEY `Id_Rubrique` (`Id_Rubrique`),
  CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`Id_Rubrique`) REFERENCES `rubrique` (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_rubrique`
--

LOCK TABLES `sous_rubrique` WRITE;
/*!40000 ALTER TABLE `sous_rubrique` DISABLE KEYS */;
INSERT INTO `sous_rubrique` VALUES (1,'Les membranophones','La famille d’instruments des membranophones.','percussionM.png',1),(2,'Les idiophones','La famille des idiophones.','percussionI.png',1),(3,'Les cordes frottées','Dans cette famille, on a le violon, l’alto, le violoncelle.','cordesF.png',2),(4,'Les cordes pincées','Dans cette famille, on a par exemple la basse, la guitare.','cordesP.png',2),(5,'Les cordes frappées','La famille des cordes frappées, les cordes sont frappées soit manuellement soit mécaniquement.','cordesFrap.png',2),(6,'Les cuivres','La famille des cuivres regroupe les instruments comme le trombone, la trompette à pistons, le tuba.','cuivres.png',3),(7,'Les bois','Parmi les bois, on connaît bien le saxophone, la clarinette, le basson.','bois.png',3);
/*!40000 ALTER TABLE `sous_rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`Id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'DUPONT','Marc','9 rue des pont','80090','FRANCE','AMIENS','06/12/69/85/12','marc.dupont@gmail.com','1Tunnel',10.00),(2,'DUPOND','Marie','94 rue des porc-épique','85090','FRANCE','DOUX','06/14/71/47/58','marie.dupond@gmail.fr','1Vortex',5.00),(3,'CAP','Cesar','45 rue des laurier','84090','FRANCE','AMER','06/17/32/47/63','cesar.cap@hotmail.fr','2Gaulois',30.00),(4,'INCONNU','Didier','9 rue des impasses','90000','FRANCE','PARTER','06/10/80/00/00','didier.inconnu@gmail.com','1Connu',2.00),(5,'Bella','Belle','90 rue des champs','60000','FRANCE','ROSE','06/18/50/77/88','belle.bella@gmail.fr','1Bgelle',12.00);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 14:01:21
