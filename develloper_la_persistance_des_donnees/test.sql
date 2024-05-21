-- Active: 1715778719442@@127.0.0.1@3306@test
create DATABASE test;

CREATE TABLE test1(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nom VARCHAR(50),
    prenom VARCHAR(50)
);

CREATE TABLE test2(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nom VARCHAR(50),
    prenom VARCHAR(50)
);
CREATE INDEX test on test2(nom);