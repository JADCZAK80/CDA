-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: GesCom
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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) DEFAULT NULL,
  `cat_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`),
  CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `categorie` (`cat_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Electronique',NULL),(2,'Ecouteur',1),(3,'Console',1);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_adress` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_mail` varchar(75) DEFAULT NULL,
  `cus_phone` int(10) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (101,'\"Riviere\"','\"Romain\"','\"2301 boulevard Alsace-Lorraine\"','\"8000','\"Amiens\"','\"risus.morbi@laposte.net\"',0),(102,'\"Bailly\"','\"Lilou\"','\"Ap #125-483 Fusce Street\"','\"8030','\"Birmingham\"','\"sagittis.placerat@Aliquam.co.uk\"',0),(103,'\"Muller\"','\"Alexandre\"','\"P.O. Box 149',' 6931','\"80100\"','\"Abbeville\"',0),(104,'\"Lefebvre\"','\"Élisa\"','\"Ap #850-6013 Suscipit',' Av.\"','\"62000\"','\"Arras\"',0),(105,'\"Andre\"','\"Maëlle\"','\"Ap #449-9035 Ac Street\"','\"5913','\"Vieux-Genappe\"','\"aliquam.adipiscing@fringilla.net\"',0),(106,'\"Lemaire\"','\"Enzo\"','\"P.O. Box 771',' 895 ','\"31779\"','\"Sevastopol\"',0),(107,'\"Perez\"','\"Bienvenue\"','\"Ap #382-9259 Tincidunt',' Rd.\"','\"49960\"','\"Maastricht\"',0),(108,'\"Dumont\"','\"Emma\"','\"299-2527 Blandit Road\"','\"1301','\"Paternopoli\"','\"tristique.ac@Sedmalesuadaaugue.com\"',0),(109,'\"Riviere\"','\"Alice\"','\"P.O. Box 743',' 4502','\"64066\"','\"Campbelltown\"',0),(110,'\"Boucher\"','\"Noë\"','\"865-7652 Nibh. Ave\"','\"7519','\"Fermont\"','\"facilisi.Sed.neque@eteuismodet.ca\"',0),(111,'\"Masson\"','\"Aaron\"','\"680-7022 Sollicitudin Avenue\"','\"6805','\"Renfrew\"','\"felis.Nulla@ligulaAeneangravida.net\"',0),(112,'\"Nazdorovie\"','\"Sergueï\"','\"592 Moskow road\"','\"5176','\"Vladivostok\"','\"serguei@nazdorovie.ru\"',0),(113,'\"Lemoine\"','\"Yasmine\"','\"9317 Sodales Ave\"','\"0619','\"Huntsville\"','\"dolor.sit.amet@Seddiam.net\"',0),(114,'\"Lopez\"','\"Marion\"','\"292 Ligula. Road\"','\"4758','\"Kota\"','\"molestie.in@accumsannequeet.edu\"',0),(115,'\"Blanchard\"','\"Émilie\"','\"Ap #923-6845 Commodo Street\"','\"9084','\"Rodgau\"','\"consectetuer.adipiscing@risusDuisa.co.uk\"',0),(116,'\"Philippe\"','\"Léonard\"','\"7315 Proin Street\"','\"7009','\"Matamata\"','\"sodales.elit.erat@Vivamusnibhdolor.org\"',0),(117,'\"Girard\"','\"Kimberley\"','\"P.O. Box 184',' 8937','\"30481\"','\"Kamalia\"',0),(118,'\"Morin\"','\"Élise\"','\"Ap #846-6229 Eu',' St.\"','\"27844\"','\"West Valley City\"',0),(119,'\"Lefebvre\"','\"Zoé\"','\"677-3832 Dis St.\"','\"9457','\"Caruaru\"','\"Sed@odioAliquamvulputate.net\"',0),(120,'\"Renault\"','\"Lilian\"','\"163 Sed Avenue\"','\"3665','\"La Unión\"','\"erat.semper@est.co.uk\"',0),(121,'\"Remy\"','\"Dimitri\"','\"Ap #801-6517 Eros Avenue\"','\"7800','\"Frigento\"','\"amet.dapibus.id@placerat.ca\"',0),(122,'\"Guillaume\"','\"Lena\"','\"1064 Donec St.\"','\"7838','\"Anchorage\"','\"varius.orci@fermentum.com\"',0),(123,'\"Maillard\"','\"Charlotte\"','\"738 Euismod Avenue\"','\"1791','\"Losino-Petrovsky\"','\"Maecenas.libero@nunc.com\"',0),(124,'\"Albert\"','\"Diego\"','\"Ap #332-8162 Proin Road\"','\"8341','\"Trois-Rivières\"','\"aliquam@vestibulum.edu\"',0),(125,'\"Leclerc\"','\"Lauriane\"','\"Ap #661-6175 Turpis St.\"','\"8810','\"Pékin\"','\"non@auctorveliteget.org\"',0),(126,'\"Poirier\"','\"Paul\"','\"Ap #784-932 Quis Rd.\"','\"4239','\"Flushing\"','\"lectus.sit@ligulaAliquamerat.net\"',0),(127,'\"Hubert\"','\"Marianne\"','\"8 cours javascript\"','\"8009','\"Amiens\"','\"vitae.purus@curae.org\"',0),(128,'\"Caron\"','\"Cédric\"','\"P.O. Box 643',' 5476','\"23735\"','\"Vanderhoof\"',0),(129,'\"Fournier\"','\"Célia\"','\"P.O. Box 301',' 1701','\"14711\"','\"Harrisburg\"',0),(130,'\"Hubert\"','\"Corentin\"','\"Ap #150-5696 Et',' St.\"','\"08762\"','\"Veldwezelt\"',0),(131,'\"Dupont\"','\"Macéo\"','\"P.O. Box 580',' 927 ','\"32275\"','\"Karachi\"',0),(132,'\"Fabre\"','\"Maelys\"','\"P.O. Box 347',' 5390','\"04549\"','\"Francavilla Fontana\"',0),(133,'\"Henry\"','\"Florentin\"','\"4750 Molestie Rd.\"','\"9132','\"Heusden-Zolder\"','\"a.sollicitudin@adipiscingfringilla.ca\"',0),(134,'\"Pons\"','\"Léonard\"','\"6857 Scelerisque Ave\"','\"5281','\"Antofagasta\"','\"lectus@aliquet.edu\"',0),(135,'\"Fleury\"','\"Solene\"','\"Ap #518-8977 Duis Street\"','\"5504','\"Olmué\"','\"mollis@laciniavitae.net\"',0),(136,'\"Richard\"','\"Rémi\"','\"P.O. Box 480',' 2248','\"09509\"','\"Bilbo\"',0),(137,'\"Blanc\"','\"Sarah\"','\"P.O. Box 535',' 8956',' Avenue\"','\"61210\"',0),(138,'\"Evrard\"','\"Paul\"','\"P.O. Box 909',' 6072','\"79346\"','\"Raiganj\"',0),(139,'\"Legrand\"','\"Romane\"','\"P.O. Box 567',' 3645','\"41510\"','\"Vilvoorde\"',0),(140,'\"Huet\"','\"Julien\"','\"285-395 Est',' Rd.\"','\"22174\"','\"Eschwege\"',0),(141,'\"Dubois\"','\"Lamia\"','\"145-1564 Vestibulum Rd.\"','\"8630','\"Valleyview\"','\"Pellentesque.habitant.morbi@musAenean.ca\"',0),(142,'\"Carpentier\"','\"Maïwenn\"','\"P.O. Box 181',' 3727','\"77351\"','\"Farrukhabad-cum-Fatehgarh\"',0),(143,'\"Perez\"','\"Florentin\"','\"2114 Nisi. St.\"','\"7520','\"Trivandrum\"','\"velit.justo.nec@MaurisnullaInteger.com\"',0),(144,'\"Dupont\"','\"Chaïma\"','\"P.O. Box 576',' 4207','\"78616\"','\"Romeral\"',0),(145,'\"Schneider\"','\"Alice\"','\"548-7461 Nunc Av.\"','\"1859','\"Marburg\"','\"Aliquam.erat@eget.org\"',0),(146,'\"Gautier\"','\"Rose\"','\"P.O. Box 705',' 741 ','\"73604\"','\"Kartaly\"',0),(147,'\"Guillot\"','\"Loevan\"','\"Ap #601-2284 Commodo Road\"','\"5487','\"Gonnosfanadiga\"','\"cursus.in@ultriciessem.ca\"',0),(148,'\"Lefevre\"','\"Clémence\"','\"476-8880 Suscipit',' Rd.\"','\"61563\"','\"Vöcklabruck\"',0),(149,'\"Bouvier\"','\"Clara\"','\"P.O. Box 282',' 9786','\"07517\"','\"Wilskerke\"',0),(150,'\"Blanchard\"','\"Adam\"','\"P.O. Box 259',' 7958',' St.\"','\"82728\"',0),(151,'\"Pikatchien\"','\"Jessica\"','\"92 rue de la plage\"','\"2219','\"Plérin\"','\"jessica.pikatchien@plerin.fr\"',0),(152,'\"Bailly\"','\"Léo\"','\"800-2734 Morbi Av.\"','\"5023','\"Widooie\"','\"ornare.lectus@hendreritDonec.edu\"',0),(153,'\"Schneider\"','\"Florentin\"','\"P.O. Box 468',' 4940','\"36508\"','\"Vaux-sur-Sure\"',0),(154,'\"Caron\"','\"Martin\"','\"242-9793 Ipsum Road\"','\"5187','\"Tain\"','\"pharetra.sed@Etiambibendumfermentum.edu\"',0),(155,'\"David\"','\"Lutécia\"','\"665-963 Donec Road\"','\"4466','\"Westkapelle\"','\"lorem@felispurusac.net\"',0),(156,'\"Robert\"','\"Agathe\"','\"6737 Ut',' Road','\"05249\"','\"Sandy\"',0),(157,'\"Rodriguez\"','\"Macéo\"','\"P.O. Box 355',' 2303','\"57821\"','\"Suncheon\"',0),(158,'\"Humbert\"','\"Élouan\"','\"P.O. Box 452',' 8712',' Av.\"','\"05252\"',0),(159,'\"Charpentier\"','\"Lucie\"','\"9957 Morbi Rd.\"','\"2475','\"Aschersleben\"','\"ac.nulla@ante.net\"',0),(160,'\"Colin\"','\"Yanis\"','\"804-4641 Nunc. Avenue\"','\"1682','\"Alness\"','\"sit.amet.orci@turpisnec.co.uk\"',0),(161,'\"Robert\"','\"Élise\"','\"Ap #872-7281 Amet Street\"','\"0969','\"Rocky Mountain House\"','\"erat.nonummy.ultricies@sapienAenean.ca\"',0),(162,'\"Lucas\"','\"Laura\"','\"976-2480 Turpis Ave\"','\"5869','\"Alanya\"','\"vel.mauris@massarutrummagna.ca\"',0),(163,'\"Laurent\"','\"Quentin\"','\"489-9653 Fermentum Rd.\"','\"6569','\"Fort Resolution\"','\"porttitor.interdum@dictum.co.uk\"',0),(164,'\"Giraud\"','\"Kimberley\"','\"7411 Ut Rd.\"','\"5181','\"Stroud\"','\"nec@nectempus.com\"',0),(165,'\"Bailly\"','\"Julien\"','\"Ap #182-3848 Nunc St.\"','\"8218','\"Laramie\"','\"Morbi@feugiatLorem.org\"',0),(166,'\"Chevalier\"','\"Gaspard\"','\"8464 Blandit Rd.\"','\"0386','\"Glain\"','\"elit.sed.consequat@ultricies.co.uk\"',0),(167,'\"Francois\"','\"Tatiana\"','\"Ap #961-9752 Vestibulum Rd.\"','\"7782','\"Cap-de-la-Madeleine\"','\"dictum.mi.ac@ametconsectetueradipiscing.org\"',0),(168,'\"Mercier\"','\"Constant\"','\"Ap #706-6920 Amet Rd.\"','\"4945','\"Haut-Ittre\"','\"tellus.imperdiet@variusorciin.org\"',0),(169,'\"Gomez\"','\"Jérémy\"','\"70 avenue des travailleurs\"','\"8000','\"Amiens\"','\"lacus.Etiam@nibhco.net\"',0),(170,'\"Leroy\"','\"Benjamin\"','\"P.O. Box 202',' 4157',' Avenue\"','\"41799\"',0),(171,'\"Rolland\"','\"Ethan\"','\"907-4675 Pede Rd.\"','\"3205','\"Enterprise\"','\"dolor.Fusce.mi@dignissim.co.uk\"',0),(172,'\"Meunier\"','\"Margaux\"','\"P.O. Box 461',' 5531','\"39165\"','\"Glimes\"',0),(173,'\"Roger\"','\"Thomas\"','\"P.O. Box 505',' 6494','\"06743\"','\"Fino Mornasco\"',0),(174,'\"Renaud\"','\"Anaël\"','\"Ap #309-9136 Suspendisse St.\"','\"4546','\"Westmount\"','\"eget@ipsumcursusvestibulum.edu\"',0),(175,'\"Morin\"','\"Yüna\"','\"8089 Erat St.\"','\"0790','\"Shenkursk\"','\"Integer@lectuspedeultrices.org\"',0),(176,'\"Joly\"','\"Eva\"','\"479-8537 Ipsum Ave\"','\"4223','\"Bhimavaram\"','\"et.nunc.Quisque@odiotristique.com\"',0),(177,'\"Garnier\"','\"Anaël\"','\"4703 Fringilla',' Stre','\"66625\"','\"Kobbegem\"',0),(178,'\"Martinez\"','\"Lina\"','\"Ap #466-9700 Pede. Avenue\"','\"4617','\"My\"','\"nisi.nibh.lacinia@nunc.com\"',0),(179,'\"Le gall\"','\"Nathan\"','\"P.O. Box 792',' 625 ','\"40854\"','\"Ancaster Town\"',0),(180,'\"Martinez\"','\"Fanny\"','\"Ap #677-8255 Et Avenue\"','\"1498','\"Rodgau\"','\"tortor@maurissitamet.co.uk\"',0),(181,'\"Clement\"','\"Lucas\"','\"694-5524 Sit St.\"','\"9226','\"Branchon\"','\"luctus@vitaeorci.org\"',0),(182,'\"Marchal\"','\"Thomas\"','\"200-3480 A Road\"','\"1166','\"Saint-Honor�\"','\"magna.Praesent.interdum@velit.edu\"',0),(183,'\"Rey\"','\"Alicia\"','\"P.O. Box 606',' 9603','\"75377\"','\"l\'Escaillre\"',0),(184,'\"Rey\"','\"Jeanne\"','\"P.O. Box 550',' 3352','\"81795\"','\"Olmué\"',0),(185,'\"Bouvier\"','\"Léonie\"','\"116-5083 Tortor. Ave\"','\"6763','\"Chieti\"','\"Duis.risus.odio@a.com\"',0),(186,'\"Paul\"','\"Marwane\"','\"249-1253 Odio Street\"','\"7088','\"Wimmertingen\"','\"sociis.natoque.penatibus@suscipit.org\"',0),(187,'\"Collin\"','\"Macéo\"','\"Ap #349-3573 Nibh St.\"','\"0444','\"Terrance\"','\"per@pellentesqueSed.ca\"',0),(188,'\"Maillard\"','\"Maelys\"','\"6013 Metus Avenue\"','\"8852','\"Huancayo\"','\"magnis@tristiquealiquet.net\"',0),(189,'\"Maillard\"','\"Constant\"','\"Ap #403-2940 Egestas St.\"','\"6169','\"Heidenheim\"','\"parturient.montes.nascetur@luctussitamet.com\"',0),(190,'\"Daniel\"','\"Félix\"','\"Ap #325-2095 Risus',' Rd.\"','\"12706\"','\"Chimay\"',0),(191,'\"Bon\"','\"Jean\"','\"30 rue de poulainville\"','\"8008','\"Amiens\"','\"adipiscing@gmail.com\"',0),(192,'\"Boulanger\"','\"Mathis\"','\"P.O. Box 595',' 7563','\"92588\"','\"Bhatinda\"',0),(193,'\"Boucher\"','\"Dorian\"','\"P.O. Box 795',' 7040','\"82751\"','\"Jelenia Góra\"',0),(194,'\"Bouvier\"','\"Marion\"','\"1071 Molestie Ave\"','\"3820','\"Limburg\"','\"Suspendisse.aliquet@nibh.co.uk\"',0),(195,'\"Maillard\"','\"Pauline\"','\"4721 Nonummy Av.\"','\"6122','\"Seilles\"','\"magna.Praesent@pedeCum.edu\"',0),(196,'\"Renaud\"','\"Rose\"','\"7837 Hendrerit Rd.\"','\"6720','\"Fremantle\"','\"orci.in@ultriciesornareelit.edu\"',0),(197,'\"Robert\"','\"Maelys\"','\"P.O. Box 393',' 5911',' St.\"','\"06642\"',0),(198,'\"Dupuis\"','\"Carla\"','\"Ap #874-1931 Iaculis Road\"','\"6914','\"Virginia Plage\"','\"nisi@neceuismod.ca\"',0),(199,'\"Meunier\"','\"Angelina\"','\"Ap #784-906 Amet',' Ave\"','\"46591\"','\"Melle\"',0),(200,'\"Philippe\"','\"Maïwenn\"','\"2585 In Street\"','\"5398','\"Lumaco\"','\"elit@Crassed.co.uk\"',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_price` decimal(6,2) NOT NULL,
  `det_quantity` int(5) NOT NULL CHECK (`det_quantity` between 1 and 100),
  `pro_id` int(11) DEFAULT NULL,
  `ord_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`det_id`),
  KEY `pro_id` (`pro_id`),
  KEY `ord_id` (`ord_id`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE,
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `orders` (`ord_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_order_date` date DEFAULT curdate(),
  `ord_ship_date` date DEFAULT NULL,
  `ord_bill_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `cus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id` (`cus_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_ref` varchar(10) NOT NULL,
  `pro_name` varchar(200) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_price` decimal(6,2) NOT NULL,
  `pro_stock` smallint(4) DEFAULT NULL,
  `pro_color` varchar(30) DEFAULT NULL,
  `pro_picture` varchar(40) DEFAULT NULL,
  `pro_add_date` date DEFAULT curdate(),
  `pro_update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pro_publish` tinyint(1) NOT NULL DEFAULT 1,
  `cat_id` int(11) DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`),
  KEY `sup_id` (`sup_id`),
  KEY `idx_pro_ref` (`pro_ref`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categorie` (`cat_id`) ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'AZERTY1','SOLIX-test','écouteurs Bluetooth',10.99,120,'bleu','solix.png','2024-04-29','2024-04-29 11:56:02',1,2,1),(2,'QWERTY2','AIR-POD','Produit d\'une discretion sans pareil',49.99,200,'Blanc','airpod_blanc.png]','2024-04-29','2024-04-29 12:14:50',1,2,1),(3,'QWERTY3','AIR-POD','Produit d\'une discretion sans pareil',59.99,250,'Noir','airpod_noir.png]','2024-04-29','2024-04-29 12:14:50',0,2,1),(4,'SONY5','PS5','console de sony derniere generation',490.99,51,'Blanc','ps5_blanc.png]','2024-04-29','2024-04-29 12:14:50',1,3,1),(5,'SONY4','PS4','console de chez sony',249.99,25,'Noir','ps4_noir.png]','2024-04-29','2024-04-29 12:14:50',1,3,1),(6,'XB0X','Xbox1X','console de microsoft derniere generation',449.99,30,'Blanc','xbox_blanc.png]','2024-04-29','2024-04-29 12:14:50',0,3,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_adress` varchar(150) NOT NULL,
  `sup_mail` varchar(75) DEFAULT NULL,
  `sup_phone` int(10) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ID logistique','AMIENS','150 Rue Alexandre Durouchez','id_logistique@sevice-client.com',322458485);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30  8:59:16
