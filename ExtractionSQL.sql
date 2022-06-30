USE LOCATIONS
GO


--A.... Liste des clients dont le nom commence par "D" --

SELECT * 
FROM Clients c
WHERE c.nom LIKE 'D%';


--B....  La liste de tous les clients --

SELECT * FROM Clients;

--C.... La liste des fiches (N°,  ETAT pour les clients (nom, prenom) qui habitent en loire Atlantique (44)--

SELECT f.noFic, f.etat, c.nom, c.prenom
FROM Fiches f
	INNER JOIN Clients c ON f.noCli = c.noCli
WHERE c.cpo LIKE '44%';

--D.... Afficher la fiche N°1002 --

SELECT f.noFic, c.nom, c.prenom, a.refArt, a.designation, lf.depart, lf.retour, t.prixJour, montant=(DATEDIFF("DD", depart, ISNULL(retour, GETDATE())))*prixJour
FROM Clients c
	INNER JOIN Fiches f ON c.noCli = f.noCli
	INNER JOIN Lignes_Fic lf ON f.noFic = lf.noFic
	INNER JOIN Articles a ON lf.refArt = a.refArt 
	LEFT JOIN Grille_Tarifs gt  ON a.codeCate = gt.codeCate AND a.codeGam = gt.codeGam
	LEFT JOIN Tarifs t ON gt.codeTarif = t.codeTarif

WHERE f.noFic = 1002

--E.... Prix Journalier moyen de location par gamme --

SELECT g.libelle AS Gamme, AVG(t.prixJour) AS Tarif_Moyen
FROM Grille_Tarifs gt
	INNER JOIN Gammes g  ON gt.codeGam = g.codeGam
	INNER JOIN Tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY g.libelle


--F.... Liste des Articles loué au moins 3 fois --

SELECT lf.refArt AS Référence, a.designation AS Désignation, COUNT(*)[Nombre de Locations]
FROM Lignes_Fic lf
	INNER JOIN Articles a ON lf.refArt = a.refArt
GROUP BY lf.refArt, a.designation
HAVING COUNT(*) >= 3

-- G.... Détail  de la fiche N°1002 avec un total --

SELECT f.noFic, c.nom, c.prenom, a.refArt, a.designation, lf.depart, lf.retour, t.prixJour, montant=(DATEDIFF("DD", depart, ISNULL(retour, GETDATE())))*prixJour
FROM Clients c
	INNER JOIN Fiches f ON c.noCli = f.noCli
	INNER JOIN Lignes_Fic lf ON f.noFic = lf.noFic
	INNER JOIN Articles a ON lf.refArt = a.refArt 
	LEFT JOIN Grille_Tarifs gt  ON a.codeCate = gt.codeCate AND a.codeGam = gt.codeGam
	LEFT JOIN Tarifs t ON gt.codeTarif = t.codeTarif

WHERE f.noFic = 1002;