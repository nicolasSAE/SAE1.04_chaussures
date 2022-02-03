DROP TABLE IF EXISTS panier;
DROP TABLE IF EXISTS ligne_commande;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS etat;
DROP TABLE IF EXISTS chaussure;
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT
    ,username VARCHAR(25)
    ,password VARCHAR(100)
    ,role VARCHAR(25)
    ,est_actif VARCHAR(20)
    ,pseudo VARCHAR(25)
    ,email VARCHAR(50)
    ,PRIMARY KEY (id_user)
);

INSERT INTO user (id, email, username, password, role,  est_actif) VALUES
(NULL, 'admin@admin.fr', 'admin', 'sha256$pBGlZy6UukyHBFDH$2f089c1d26f2741b68c9218a68bfe2e25dbb069c27868a027dad03bcb3d7f69a', 'ROLE_admin', 1);
INSERT INTO user  (id, email, username, password, role, est_actif) VALUES
(NULL, 'client@client.fr', 'client', 'sha256$Q1HFT4TKRqnMhlTj$cf3c84ea646430c98d4877769c7c5d2cce1edd10c7eccd2c1f9d6114b74b81c4', 'ROLE_client', 1);
INSERT INTO user  (id, email, username, password, role,  est_actif) VALUES
(NULL, 'client2@client2.fr', 'client2', 'sha256$ayiON3nJITfetaS8$0e039802d6fac2222e264f5a1e2b94b347501d040d71cfa4264cad6067cf5cf3', 'ROLE_client',1);

CREATE TABLE IF NOT EXISTS chaussure (
    id_chaussure INT AUTO_INCREMENT
    ,libelle_chaussure VARCHAR(25)
    ,type_chaussure VARCHAR(25)
    ,pointure NUMERIC(3,1)
    ,fournisseur VARCHAR(25)
    ,marque VARCHAR(25)
    ,couleur VARCHAR(25)
    ,prix NUMERIC(6,2)
    ,PRIMARY KEY (id_chaussure)
);

INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de marche','DURAMO',40,'astreyee','adidas','noir',40),
('chaussures de marche','DURAMO',38,'astreyee','adidas','noir',40),
('chaussures de marche','DURAMO',45,'astreyee','adidas','noir',40);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de marche','HW 100',45,'stockX','Kalenji','rouge',60),
('chaussures de marche','HW 100',44,'stockX','Kalenji','rouge',60);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de marche','TRAIL RUNNING',42.5,'astreyee','ASICS','blanc',35),
('chaussures de marche','TRAIL RUNNING',44.5,'astreyee','ASICS','blanc',35),
('chaussures de marche','TRAIL RUNNING',43,'astreyee','ASICS','blanc',35);

INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de ville','Derbies Remake',41,'stockX','AZZARO','marron',100),
('chaussures de ville','Derbies Remake',42,'stockX','AZZARO','marron',100),
('chaussures de ville','Derbies Remake',38,'stockX','AZZARO','marron',100),
('chaussures de ville','Derbies Remake',44,'stockX','AZZARO','marron',100);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de ville','Derbies cuir',37,'astreyee','SANTONI','noir',250),
('chaussures de ville','Derbies cuir',38,'astreyee','SANTONI','noir',250),
('chaussures de ville','Derbies cuir',41,'astreyee','SANTONI','noir',250);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de ville','Derbies cuir',39,'astreyee','SCHMOOVE','marron',60),
('chaussures de ville','Derbies cuir',42,'astreyee','SCHMOOVE','marron',60);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('chaussures de ville','Derbies cuir Eki',39,'astreyee','CAMPERLAB','rouge',55),
('chaussures de ville','Derbies cuir Eki',40,'astreyee','CAMPERLAB','rouge',55),
('chaussures de ville','Derbies cuir Eki',42,'astreyee','CAMPERLAB','rouge',55);

INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('baskets','Air Max 90',42,'astreyee','NIKE','noir',120),
('baskets','Air Max 90',43,'astreyee','NIKE','noir',120);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('baskets','Air Huarache',42,'astreyee','NIKE','noir',130),
('baskets','Air Huarache',41,'astreyee','NIKE','noir',130),
('baskets','Air Huarache',38,'astreyee','NIKE','noir',130);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('baskets','Jordan 11 Retro Coll 2021 GS',38,'astreyee','JORDAN','gris',260),
('baskets','Jordan 11 Retro Coll 2021 GS',40,'astreyee','JORDAN','gris',260),
('baskets','Jordan 11 Retro Coll 2021 GS',43,'astreyee','JORDAN','gris',260);
INSERT INTO chaussure (type_chaussure,libelle_chaussure,pointure,fournisseur,marque,couleur,prix) VALUES
('baskets','Jordan 1 Retro High Bred',39,'astreyee','JORDAN','rouge',510),
('baskets','Jordan 1 Retro High Bred',40,'astreyee','JORDAN','rouge',510),
('baskets','Jordan 1 Retro High Bred',41,'astreyee','JORDAN','rouge',510),
('baskets','Jordan 1 Retro High Bred',42,'astreyee','JORDAN','rouge',510);

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
