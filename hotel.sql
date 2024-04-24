create database hotel;
use hotel;
create table station (
    numero_station int AUTO_INCREMENT NOT NULL,
    nom_station varchar(50),
    PRIMARY KEY(numero_station)
);
create table client (
    adresse varchar(100),
    nom varchar(50),
    prenom varchar(50),
    numero_client INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(numero_client)
);
create table hotel (
    capacite INT,
    categorie varchar(10),
    nom varchar(50),
    adresse varchar(100),
    numero_hotel INT AUTO_INCREMENT NOT NULL,
    numero_station INT,
    PRIMARY KEY(numero_hotel),
    FOREIGN KEY(numero_station) REFERENCES station(numero_station)
);
create table chambre (
    capacite INT,
    degre_confort INT CHECK (degre_confort BETWEEN 18 and 25),
    exposition varchar(50),
    type_chambre varchar(50),
    numero_chambre INT UNIQUE,
    numero_hotel INT,
    PRIMARY KEY(numero_chambre),
    FOREIGN KEY(numero_hotel) REFERENCES hotel(numero_hotel)
);
create table reservation (
    numero_chambre INT,
    numero_client INT,
    date_debut DATETIME,
    date_fin DATETIME,
    date_reservation DATETIME,
    montant_arrhes DECIMAL(10,2),
    prix_total DECIMAL(20,2),
    PRIMARY KEY(numero_chambre,numero_client),
    FOREIGN KEY(numero_chambre) REFERENCES chambre(numero_chambre),
    FOREIGN KEY(numero_client) REFERENCES client(numero_client)
);