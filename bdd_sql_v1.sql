DROP TABLE IF EXISTS panier;
DROP TABLE IF EXISTS ligne_commande;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS etat;
DROP TABLE IF EXISTS chaussure;
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user (
    id_user INT AUTO_INCREMENT
    ,username VARCHAR(25)
    ,password VARCHAR(100)
    ,role VARCHAR(25)
    ,est_actif VARCHAR(20)
    ,pseudo VARCHAR(25)
    ,email VARCHAR(50)
    ,PRIMARY KEY (id_user)
);

INSERT INTO user (id_user, email, username, password, role,  est_actif) VALUES
(NULL, 'admin@admin.fr', 'admin', 'sha256$pBGlZy6UukyHBFDH$2f089c1d26f2741b68c9218a68bfe2e25dbb069c27868a027dad03bcb3d7f69a', 'ROLE_admin', 1);
INSERT INTO user  (id_user, email, username, password, role, est_actif) VALUES
(NULL, 'client@client.fr', 'client', 'sha256$Q1HFT4TKRqnMhlTj$cf3c84ea646430c98d4877769c7c5d2cce1edd10c7eccd2c1f9d6114b74b81c4', 'ROLE_client', 1);
INSERT INTO user  (id_user, email, username, password, role,  est_actif) VALUES
(NULL, 'client2@client2.fr', 'client2', 'sha256$ayiON3nJITfetaS8$0e039802d6fac2222e264f5a1e2b94b347501d040d71cfa4264cad6067cf5cf3', 'ROLE_client',1);
SELECT * FROM user;

CREATE TABLE IF NOT EXISTS chaussure (
    id_chaussure INT AUTO_INCREMENT
    ,nomModele VARCHAR(50)
    ,pointure NUMERIC(3,1)
    ,type VARCHAR(20)
    ,fournisseur VARCHAR(50)
    ,marque VARCHAR(50)
    ,couleur VARCHAR(20)
    ,prix NUMERIC(6,2)
    ,PRIMARY KEY (id_chaussure)
);

INSERT INTO chaussure(id_chaussure,nomModele ,pointure, type,fournisseur ,marque ,couleur, prix) VALUES
(NULL,'AirMax' ,42,'sport','fournisseurA','Nike' , 'noir', 99);
INSERT INTO chaussure(id_chaussure,nomModele , pointure, type,fournisseur ,marque, couleur, prix) VALUE
(NULL,'Stan Smith' , 39,'ville','fournisseurB' ,'Adidas' , 'bleu', 130);
INSERT INTO chaussure(id_chaussure,nomModele , pointure, type,fournisseur ,marque,  couleur, prix) VALUE
(NULL,'RS max' , 46,'sneaker', 'fournisseurB','Puma' ,'beige' ,  180);

SELECT * FROM chaussure;


CREATE TABLE IF NOT EXISTS etat (
    id_etat INT AUTO_INCREMENT
    ,libelle VARCHAR(25)
    ,PRIMARY KEY (id_etat)
);

CREATE TABLE IF NOT EXISTS commande (
    id_commande INT AUTO_INCREMENT
    ,date_achat DATE
    ,id_user INT
    ,id_etat INT
    ,PRIMARY KEY (id_commande)
    ,CONSTRAINT fk_commande_user FOREIGN KEY (id_user) REFERENCES user (id_user)
    ,CONSTRAINT fk_commande_etat FOREIGN KEY (id_etat) REFERENCES etat (id_etat)
);

CREATE TABLE IF NOT EXISTS ligne_commande (
    id_ligne_commande INT AUTO_INCREMENT
    ,id_commande INT
    ,id_chaussure INT
    ,prix_unit NUMERIC(6,2)
    ,quantite INT
    ,PRIMARY KEY (id_ligne_commande)
    ,CONSTRAINT fk_commande_commande FOREIGN KEY (id_commande) REFERENCES commande (id_commande)
    ,CONSTRAINT fk_commande_chaussure FOREIGN KEY (id_chaussure) REFERENCES chaussure (id_chaussure)
);

CREATE TABLE IF NOT EXISTS panier (
    id_panier INT AUTO_INCREMENT
    ,date_ajout DATE
    ,id_user INT
    ,id_chaussure INT
    ,prix_unit NUMERIC(6,2)
    ,quantite INT
    ,PRIMARY KEY (id_panier)
    ,CONSTRAINT fk_commande_user1 FOREIGN KEY (id_user) REFERENCES user (id_user)
    ,CONSTRAINT fk_commande_chaussure1 FOREIGN KEY (id_chaussure) REFERENCES chaussure (id_chaussure)
);
