USE LOCATIONS
GO

CREATE TABLE Clients(
	noCli NUMERIC(6) not null,
	nom VARCHAR(30) not null,
	prenom VARCHAR(30) null,
	adresse VARCHAR(120) null,
	cpo CHAR(5) not null CONSTRAINT CK_Clients_cpo CHECK(cpo between 01000 and 95999),
	ville VARCHAR(80)  not null CONSTRAINT DF_Clients_ville DEFAULT 'NANTES',
	CONSTRAINT PK_Clients_noCli PRIMARY KEY(noCli),

);

CREATE TABLE Fiches(

	noFic NUMERIC(6) not null,
	noCli NUMERIC(6) not null,
	dateCrea DATETIME not null		CONSTRAINT DF_Fiches_dateCrea DEFAULT getDate(),
	datePaye DATETIME null,			
	etat CHAR(2) not null	CONSTRAINT DF_Fiches_etat DEFAULT 'EC',
							CONSTRAINT CK_Fiches_etat CHECK(etat='EC' or etat='RE' or etat='SO'),

	CONSTRAINT PK_Fiches_noFic  PRIMARY KEY(noFic),
	CONSTRAINT FK_Fiches_noCli FOREIGN KEY(noCli)
			REFERENCES Clients(noCli) ON DELETE CASCADE,
	CONSTRAINT CK_Fiches_datePaye CHECK((datePaye IS NULL) OR (datePaye > dateCrea)),
	CONSTRAINT CK_Fiches_datePaye_etat CHECK((datePaye IS NULL AND etat <> 'SO') OR (datePaye IS NOT NULL AND etat = 'SO')),
);

CREATE TABLE Gammes(
	codeGam CHAR(5) not null,
	libelle VARCHAR(30) not null,
	CONSTRAINT UN_Gammes_libelle UNIQUE(libelle),
	CONSTRAINT PK_Gammes_codeGam  PRIMARY KEY(codeGam),
);

CREATE TABLE Categories(
	codeCate CHAR(5) not null,
	libelle VARCHAR(30) not null,
	CONSTRAINT UN_Categories_libelle UNIQUE(libelle),
	CONSTRAINT PK_Categories_codeTable PRIMARY KEY(codeCate),
);

CREATE TABLE Tarifs(
	codeTarif CHAR(5) not  null,
	libelle varchar(30) not null,
	prixJour NUMERIC(5,2) not null CONSTRAINT CK_Tarifs_prixJour CHECK(prixJour >= 0),
	CONSTRAINT UN_Tarifs_Libelle UNIQUE(libelle),
	CONSTRAINT PK_Tarifs_codeTarif PRIMARY KEY(codeTarif),
);

CREATE TABLE Grille_Tarifs(
	codeGam CHAR(5) not null,
	codeCate CHAR(5) not null,
	codeTarif CHAR(5) not null,
	CONSTRAINT PK_Grille_Tarifs_codeGam_codeCate PRIMARY KEY(codeGam,codeCate),
	CONSTRAINT FK_Grille_Tarifs_codeGam FOREIGN KEY(codeGam)
		REFERENCES Gammes(codeGam),
	CONSTRAINT FK_Grille_Tarifs_codeCate FOREIGN KEY(codeCate)
		REFERENCES Categories(codeCate),
	CONSTRAINT FK_Grille_Tarifs_codeTarif FOREIGN KEY(codeTarif)
		REFERENCES Tarifs(codeTarif),
);

CREATE TABLE Articles(
	refArt CHAR(8) not null,
	designation VARCHAR(80) not null,
	codeGam CHAR(5) not null,
	codeCate CHAR(5) not null,
	CONSTRAINT PK_Articles_refArt PRIMARY KEY(refArt),
	CONSTRAINT FK_Articles_grillesTarifs FOREIGN KEY(codeGam, codeCate)
		REFERENCES Grille_Tarifs(codeGam,codeCate),
);

CREATE TABLE Lignes_Fic(
	
	noFic NUMERIC(6) not  null,
	noLig NUMERIC(3) not null,
	refArt CHAR(8) not null,
	depart DATETIME not  null CONSTRAINT DF_Lignes_Fic DEFAULT getDate(),
	retour  DATETIME null, 
	CONSTRAINT CK_Lignes_Fic_retour CHECK (retour > depart),
	CONSTRAINT PK_Lignes_Fic_noLig_noFic PRIMARY KEY(noLig, noFic),
	CONSTRAINT FK_Lignes_Fic_noFic FOREIGN KEY(noFic)
		REFERENCES Fiches(noFic) ON DELETE CASCADE,
	CONSTRAINT FK_Lignes_Fic_refArt FOREIGN KEY(refArt)
		REFERENCES Articles(refArt),
);

-- INDEX SUR LES CLEF ETRANGERES

CREATE NONCLUSTERED INDEX FK_Fiches_Clients
	ON Fiches(noCli ASC);

CREATE NONCLUSTERED INDEX FK_Grille_Tarifs_codeGam
	ON Grille_Tarifs(codeGam ASC);
		CREATE NONCLUSTERED INDEX FK_Grille_Tarifs_codeCate
		ON Grille_Tarifs(codeCate ASC);
			CREATE NONCLUSTERED INDEX FK_Grille_Tarifs_codeTarifs
			ON Grille_Tarifs(codeTarif ASC);
	
CREATE NONCLUSTERED INDEX FK_Articles_grilleTarifs
	ON Articles(codeGam,codeCate);

CREATE NONCLUSTERED INDEX  FK_Lignes_Fic_noFic
	ON Lignes_Fic(noFic);
	
CREATE NONCLUSTERED INDEX  FK_Lignes_Fic_refArt
	ON Lignes_Fic(refArt);