DROP TABLE IF EXISTS panier;
DROP TABLE IF EXISTS ligne_commande;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS etat;
DROP TABLE IF EXISTS chaussure;
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user (
    id_user INT AUTO_INCREMENT
    ,username VARCHAR(25)
    ,password VARCHAR(50)
    ,role VARCHAR(25)
    ,est_actif VARCHAR(20)
    ,pseudo VARCHAR(25)
    ,email VARCHAR(50)
    ,PRIMARY KEY (id_user)
);

CREATE TABLE IF NOT EXISTS chaussure (
    id_chaussure INT AUTO_INCREMENT
    ,pointure NUMERIC(3,1)
    ,type VARCHAR(20)
    ,couleur VARCHAR(20)
    ,prix NUMERIC(6,2)
    ,PRIMARY KEY (id_chaussure)
);

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



SELECT * FROM panier;