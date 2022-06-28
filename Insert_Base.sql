USE LOCATIONS
GO

BEGIN TRAN [INSERT_BASE];


-- INSERT CLIENTS --

INSERT INTO Clients VALUES(1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens');
INSERT INTO Clients VALUES(2, 'Bernard', 'Barnabé', 'Rue du bar', '01000', 'Bourg en Bresse');
INSERT INTO Clients VALUES(3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', DEFAULT);
INSERT INTO Clients VALUES(4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon');
INSERT INTO Clients VALUES(5, 'Ernest', 'Etienne', 'Rue de l''échaffaud', '42000', 'Saint-Etienne');
INSERT INTO Clients VALUES(6, 'Ferdinand', 'François', 'Rue de la convention', '44100', DEFAULT);
INSERT INTO Clients VALUES(9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris');
INSERT INTO Clients VALUES(14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

SELECT * FROM Clients;

-- POINT DE SAUVEGARDE AVANT INSERT FICHES --

SAVE TRAN [BEFORE_INSERT_FICHES];

INSERT INTO Fiches VALUES(1001, 14, GETDATE()-15, GETDATE()-13,'SO');
INSERT INTO Fiches VALUES(1002, 4, GETDATE()-13,null,'EC');
INSERT INTO Fiches VALUES(1003, 1, GETDATE()-12,GETDATE()-10,'SO');
INSERT INTO Fiches VALUES(1004, 6, GETDATE()-11,null,'EC');
INSERT INTO Fiches VALUES(1005, 3, GETDATE()-10,null,'EC');
INSERT INTO Fiches VALUES(1006, 9, GETDATE()-10,null,'RE');
INSERT INTO Fiches VALUES(1007, 1, GETDATE()-3,null,'EC');
INSERT INTO Fiches VALUES(1008, 2, GETDATE(),null,'EC');

SELECT * FROM Fiches;

-- POINT DE SAUVEGARDE AVANT INSERT GAMMES --

SAVE TRAN [BEFORE_INSERT_GAMMES];

INSERT INTO Gammes VALUES('PR', 'Matériel Professionnel');
INSERT INTO Gammes VALUES('HG', 'Haut de Gamme');
INSERT INTO Gammes VALUES('MG', 'Moyenne Gamme');
INSERT INTO Gammes VALUES('EG', 'Entrée de Gamme');

SELECT * FROM Gammes;

-- POINT DE SAUVEGARDE AVANT INSERT CATEGORIES --

SAVE TRAN [BEFORE_INSERT_CATEGORIES];

INSERT INTO Categories VALUES('MONO', 'Monoski');
INSERT INTO Categories VALUES('SURF', 'Surf');
INSERT INTO Categories VALUES('PA', 'Patinette');
INSERT INTO Categories VALUES('FOA', 'Ski de fond Alternatif');
INSERT INTO Categories VALUES('FOP', 'Ski de fond patineur');
INSERT INTO Categories VALUES('SA', 'Ski alpin');

SELECT * FROM Categories;

-- POINT DE SAUVEGARDE AVANT INSERT TARIFS --

SAVE TRAN [BEFORE_INSERT_TARIFS];

INSERT INTO Tarifs VALUES('T1', 'Base', 10);
INSERT INTO Tarifs VALUES('T2', 'Chocolat', 15);
INSERT INTO Tarifs VALUES('T3', 'Bronze', 20);
INSERT INTO Tarifs VALUES('T4', 'Argent', 30);
INSERT INTO Tarifs VALUES('T5', 'Or', 50);
INSERT INTO Tarifs VALUES('T6', 'Platine', 90);

SELECT * FROM Tarifs;

-- POINT DE SAUVEGARDE AVANT INSERT GRILLE TARIF --

SAVE TRAN  [BEFORE_INSERT_GRILLE_TARIFS];

INSERT INTO  Grille_Tarifs VALUES('EG', 'MONO', 'T2');
INSERT INTO  Grille_Tarifs VALUES('MG', 'MONO', 'T2');
INSERT INTO  Grille_Tarifs VALUES('EG', 'SURF', 'T1');
INSERT INTO  Grille_Tarifs VALUES('MG', 'SURF', 'T2');
INSERT INTO  Grille_Tarifs VALUES('HG', 'SURF', 'T3');
INSERT INTO  Grille_Tarifs VALUES('PR', 'SURF', 'T5');
INSERT INTO  Grille_Tarifs VALUES('EG', 'PA', 'T1');
INSERT INTO  Grille_Tarifs VALUES('MG', 'PA', 'T2');
INSERT INTO  Grille_Tarifs VALUES('EG', 'FOA', 'T1');
INSERT INTO  Grille_Tarifs VALUES('MG', 'FOA', 'T2');
INSERT INTO  Grille_Tarifs VALUES('HG', 'FOA', 'T4');
INSERT INTO  Grille_Tarifs VALUES('PR', 'FOA', 'T6');
INSERT INTO  Grille_Tarifs VALUES('EG', 'FOP', 'T2');
INSERT INTO  Grille_Tarifs VALUES('MG', 'FOP', 'T3');
INSERT INTO  Grille_Tarifs VALUES('HG', 'FOP', 'T4');
INSERT INTO  Grille_Tarifs VALUES('PR', 'FOP', 'T6');
INSERT INTO  Grille_Tarifs VALUES('EG', 'SA', 'T1');
INSERT INTO  Grille_Tarifs VALUES('MG', 'SA', 'T2');
INSERT INTO  Grille_Tarifs VALUES('HG', 'SA', 'T4');
INSERT INTO  Grille_Tarifs VALUES('PR', 'SA', 'T6');

SELECT * FROM Grille_Tarifs;

-- POINT DE SAUVEGARDE AVANT INSERT ARTICLES --

SAVE TRAN [BEFORE_INSERT_ARTICLES];

INSERT INTO Articles VALUES('F01', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO Articles VALUES('F02','Fischer Cruiser','EG','FOA');
INSERT INTO Articles VALUES('F03','Fischer Cruiser','EG','FOA');
INSERT INTO Articles VALUES('F04','Fischer Cruiser','EG','FOA');
INSERT INTO Articles VALUES('F05','Fischer Cruiser','EG','FOA');
INSERT INTO Articles VALUES('F10','Fischer Sporty Crown','MG','FOA');
INSERT INTO Articles VALUES('F20','Fischer RCS Classic Gold','PR','FOA');
INSERT INTO Articles VALUES('F21','Fischer RCS Classic Gold','PR','FOA');
INSERT INTO Articles VALUES('F22','Fischer RCS Classic Gold','PR','FOA');
INSERT INTO Articles VALUES('F23','Fischer RCS Classic Gold','PR','FOA');
INSERT INTO Articles VALUES('F50','Fischer SOSSkating VASA','HG','FOP');
INSERT INTO Articles VALUES('F60','Fischer RCS CARBOLITE Skating','PR','FOP');
INSERT INTO Articles VALUES('F61','Fischer RCS CARBOLITE Skating','PR','FOP');
INSERT INTO Articles VALUES('F62','Fischer RCS CARBOLITE Skating','PR','FOP');
INSERT INTO Articles VALUES('F63','Fischer RCS CARBOLITE Skating','PR','FOP');
INSERT INTO Articles VALUES('F64','Fischer RCS CARBOLITE Skating','PR','FOP');
INSERT INTO Articles VALUES('P01','Décathlon Allegre junior 150','EG','PA');
INSERT INTO Articles VALUES('P10','Fischer mini ski patinette','MG','PA');
INSERT INTO Articles VALUES('P11','Fischer mini ski patinette','MG','PA');
INSERT INTO Articles VALUES('S01','Décathlon Apparition','EG','SURF');
INSERT INTO Articles VALUES('S02','Décathlon Apparition','EG','SURF');
INSERT INTO Articles VALUES('S03','Décathlon Apparition','EG','SURF');
INSERT INTO Articles VALUES('A01','Salomon 24X+Z12','EG','SA');
INSERT INTO Articles VALUES('A02','Salomon 24X+Z12','EG','SA');
INSERT INTO Articles VALUES('A03','Salomon 24X+Z12','EG','SA');
INSERT INTO Articles VALUES('A04','Salomon 24X+Z12','EG','SA');
INSERT INTO Articles VALUES('A05','Salomon 24X+Z12','EG','SA');
INSERT INTO Articles VALUES('A10','Salomon Pro Link Equipe 4S','PR','SA');
INSERT INTO Articles VALUES('A11','Salomon Pro Link Equipe 4S','PR','SA');
INSERT INTO Articles VALUES('A21','Salomon Pro Link Equipe 4S','PR','SA');

SELECT * FROM Articles;

-- POINT DE SAUVEGARDE AVANT INSERT LIGNES FIC --

SAVE TRAN [BEFORE_INSERT_LIGNES_FIC];

INSERT INTO Lignes_Fic VALUES(1001, 1, 'F05', GETDATE()-15, GETDATE()-13);
INSERT INTO Lignes_Fic VALUES(1001, 2, 'F50', GETDATE()-15, GETDATE()-14);
INSERT INTO Lignes_Fic VALUES(1001, 3, 'F60', GETDATE()-13, DATEADD(HH,6,GETDATE()-13));
INSERT INTO Lignes_Fic VALUES(1002, 1, 'A03', GETDATE()-13, GETDATE()-9);
INSERT INTO Lignes_Fic VALUES(1002, 2, 'A04', GETDATE()-12, GETDATE()-7);
INSERT INTO Lignes_Fic VALUES(1002, 3, 'S03', GETDATE()-8, null);
INSERT INTO Lignes_Fic VALUES(1003, 1, 'F50', GETDATE()-12, GETDATE()-10);
INSERT INTO Lignes_Fic VALUES(1003, 2, 'F05', GETDATE()-12, GETDATE()-10);
INSERT INTO Lignes_Fic VALUES(1004, 1, 'P01', GETDATE()-6, null);
INSERT INTO Lignes_Fic VALUES(1005, 1, 'F05', GETDATE()-9, GETDATE()-5);
INSERT INTO Lignes_Fic VALUES(1005, 2, 'F10', GETDATE()-4 ,null);
INSERT INTO Lignes_Fic VALUES(1006, 1, 'S01', GETDATE()-10, GETDATE()-9);
INSERT INTO Lignes_Fic VALUES(1006, 2, 'S02', GETDATE()-10, GETDATE()-9);
INSERT INTO Lignes_Fic VALUES(1006, 3, 'S03', GETDATE()-10, GETDATE()-9);
INSERT INTO Lignes_Fic VALUES(1007, 1, 'F50', GETDATE()-3, GETDATE()-2);
INSERT INTO Lignes_Fic VALUES(1007, 3, 'F60', GETDATE()-1, null);
INSERT INTO Lignes_Fic VALUES(1007, 2, 'F05', GETDATE()-3, null);
INSERT INTO Lignes_Fic VALUES(1007, 4, 'S02', GETDATE(), null);
INSERT INTO Lignes_Fic VALUES(1008, 1, 'S01', GETDATE(), null);

SELECT * FROM Lignes_Fic;

ROLLBACK TRAN  [BEFORE_INSERT_FICHES];
ROLLBACK TRAN  [BEFORE_INSERT_GAMMES];
ROLLBACK TRAN  [BEFORE_INSERT_CATEGORIES];
ROLLBACK TRAN  [BEFORE_INSERT_TARIFS];
ROLLBACK TRAN  [BEFORE_INSERT_GRILLE_TARIFS];
ROLLBACK TRAN  [BEFORE_INSERT_ARTICLES];
ROLLBACK TRAN  [BEFORE_INSERT_LIGNES_FIC];

ROLLBACK TRAN [INSERT_BASE];

COMMIT TRAN [INSERT_BASE];

SELECT * FROM Articles;
SELECT * FROM Categories; 
SELECT * FROM Clients;
SELECT * FROM Fiches;
SELECT * FROM Gammes;
SELECT *  FROM Grille_Tarifs;
SELECT * FROM Lignes_Fic;
SELECT  * FROM Tarifs;