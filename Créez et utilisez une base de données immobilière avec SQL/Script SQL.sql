
CREATE TABLE region (
                reg_code VARCHAR NOT NULL,
                reg_nom VARCHAR(40) NOT NULL,
                PRIMARY KEY (reg_code)
);


CREATE TABLE departement (
                dep_code VARCHAR NOT NULL,
                departement_reg_code VARCHAR NOT NULL,
                dep_nom VARCHAR(50) NOT NULL,
                PRIMARY KEY (dep_code)
);


CREATE TABLE Commune (
                com_id VARCHAR NOT NULL,
                dep_code VARCHAR NOT NULL,
                com_nom VARCHAR(50) NOT NULL,
                PTOT INT,
                PRIMARY KEY (com_id)
);


CREATE TABLE Bien (
                ID_Bien INT AUTO_INCREMENT NOT NULL,
                com_id VARCHAR NOT NULL,
                Type_Location VARCHAR(30) NOT NULL,
                Surface_Carrez INT NOT NULL,
                Nombre_pieces INT NOT NULL,
                Surface_reelle INT NOT NULL,
                PRIMARY KEY (ID_Bien)
);


CREATE TABLE Vente (
                ID_Vente INT AUTO_INCREMENT NOT NULL,
                Vente_ID_Bien INT NOT NULL,
                Date DATE NOT NULL,
                Valeur DOUBLE PRECISIONS NOT NULL,
                PRIMARY KEY (ID_Vente)
);


ALTER TABLE departement ADD CONSTRAINT region_departement_fk
FOREIGN KEY (departement_reg_code)
REFERENCES region (reg_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commune ADD CONSTRAINT departement_commune_fk
FOREIGN KEY (dep_code)
REFERENCES departement (dep_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Bien ADD CONSTRAINT commune_bien_fk
FOREIGN KEY (com_id)
REFERENCES Commune (com_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Vente ADD CONSTRAINT bien_vente_fk1
FOREIGN KEY (Vente_ID_Bien)
REFERENCES Bien (ID_Bien)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
