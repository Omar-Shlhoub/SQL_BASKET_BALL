----- Basics SQL Querry----- 
----- Omar shlhoub -----
--Basket ball database (D. Group By)
----------------------------------------------------------------------------------

--(Vraag 1.)

--Geef per jaar van toetreding het aantal leden dat in dat jaar is toegetreden.

--MYSQL 

SELECT jaartoe, COUNT(nr)
FROM lid
GROUP BY jaartoe

--------------------------

--(Vraag 2.) 

--Geef het aantal mannelijke en het aantal vrouwelijk leden
.
--MYSQL

SELECT geslacht, COUNT(geslacht) AS aantal
FROM lid
GROUP BY geslacht

--------------------------

--(Vraag 3.)

--Geef voor elk lid voor wie minstens 1 boete is betaald, het lidnummer, de gemiddelde boete (2
--decimalen) en het aantal boetes.

--MYSQL

SELECT  lid_nr, 
        round(avg(bedrag), 2) AS gemiddelde, 
        COUNT(lid_nr) AS aantal_boetes

FROM boete
GROUP BY lid_nr
HAVING COUNT(lid_nr)>= 1

--------------------------

--(Vraag 4.) 

--Geef van elk lid het lidnummer, de achternaam en het totaal aan boetebedragen die voor hem of
--haar geregistreerd zijn. Alle leden komen precies één keer in de lijst voor en bij leden waarvoor geen
--boete is geregistreerd moet het getal 0 getoond worden. Tip: zoek op wat de IFNULL() functie doet.

--MYSQL

SELECT  nr, 
        achternaam, 
        SUM(ifnull (bedrag, 0.00))
FROM lid AS l
LEFT JOIN boete AS b 
ON l.nr = b.lid_nr
GROUP BY nr

--------------------------

--(Vraag 5.)

--Geef het lidnummer van elke speler voor wie in totaal meer dan €15.- aan boetes is betaald.

--MYSQL

SELECT lid_nr, SUM(bedrag) AS totaal_boetes
FROM boete
GROUP BY lid_nr
HAVING SUM(bedrag)> 15

--------------------------

--(Vraag 6.) 

--Geef de voorletters, tussenvoegsel en achternaam en het aantal boetes van elk lid voor wie meer dan
--één boete is betaald.

--MYSQL

SELECT voorletters, tussenvoegsel, achternaam, COUNT(lid_nr) AS aantal_boetes
FROM boete AS b
JOIN lid AS l ON b.lid_nr = l.nr
GROUP BY lid_nr
HAVING COUNT(lid_nr)> 1

--------------------------

--(Vraag 7.)

--Geef van de leden met boetes de hoogste en de laagste boete die geregistreerd is.

--MYSQL

SELECT voorletters, tussenvoegsel, achternaam, MAX(bedrag) AS HoogsteBoete,
MIN(bedrag) AS laagsteBoete
FROM lid AS l
JOIN boete AS b ON l.nr = b.lid_nr
GROUP BY lid_nr
HAVING COUNT(lid_nr)>= 1

--------------------------

--(Vraag 8.)

--Geef van elk team de teamcode, het totaal aantal thuis gewonnen wedstrijden.

--MYSQL

SELECT team_code_thuis, COUNT(team_code_thuis) AS
aantal_thuis_gewonnen_wedstrijden
FROM wedstrijd
WHERE scorethuis > scoreuit
GROUP BY team_code_thuis

--------------------------

--(Vraag 9.)

--Geef van elk team de teamcode, het totaal aantal thuis gewonnen wedstrijden. Laat ook de teams
--zien die 0 thuiswedstrijden gewonnen hebben.

--MYSQL

SELECT  team_code_thuis,
        SUM(IF (scorethuis > scoreuit, 1, 0)) AS aantal_thuis_gewonnen_wedstrijden
FROM wedstrijd
GROUP BY team_code_thuis

--------------------------

--(Vraag 10.)

--Geef per klasse het aantal teams in die klasse.

--MYSQL 

SELECT klasse, COUNT(code) AS aantalteams
FROM team
GROUP BY klasse

--------------------------

--(Vraag 11.)

--Geef de sporthallen die door meer dan 1 team gebruikt worden als thuishal.

--MYSQL

SELECT sporthal_naam, COUNT(code) aantalTeams
FROM sporthal AS s
JOIN team AS t ON s.naam = t.sporthal_naam
GROUP BY s.naam
HAVING COUNT(code)> 1