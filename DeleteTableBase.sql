USE LOCATIONS
GO

ALTER TABLE Fiches DROP
	CONSTRAINT  FK_Fiches_noCli;
	
ALTER TABLE Grille_Tarifs DROP
	CONSTRAINT FK_Grille_Tarifs_codeGam,
	CONSTRAINT FK_Grille_Tarifs_codeCate,
	CONSTRAINT FK_Grille_Tarifs_codeTarif;

ALTER TABLE Articles DROP
	CONSTRAINT FK_Articles_grillesTarifs;
	
ALTER TABLE Lignes_Fic DROP
	CONSTRAINT FK_Lignes_Fic_noFic,
	CONSTRAINT FK_Lignes_Fic_refArt;
		
	
DROP TABLE Clients, Fiches, Gammes, Categories, Tarifs, Grille_Tarifs, Articles, Lignes_Fic;
GO

