--(Vraag 1.) 

--Geef van elk lid het lidnummer, de achternaam en de boetebedragen die voor hem of haar
--geregistreerd zijn. Dus ook alle leden zonder boetes laten zien!

--MYSQL 

SELECT l.nr, l.achternaam, b.bedrag
FROM lid AS l
LEFT JOIN boete AS b ON l.nr = b.lid_nr

-----------------------------

--(Vraag 2.)

--Geef van elk lid het lidnummer, de achternaam en de boetebedragen die voor hem of haar
--geregistreerd zijn. Alle leden komen in de lijst voor en bij leden waarvoor geen boete is
--geregistreerd moet het getal 0 getoond worden. Tip: zoek op wat de IFNULL() functie doet.

--MYSQL

SELECT l.nr, l.achternaam, IFNULL (b.bedrag, 0.00) AS boetebedrag
FROM lid AS l
LEFT JOIN boete AS b ON l.nr = b.lid_nr

-----------------------------

--(Vraag 3.) 

--Geef een overzicht van alle leden. Toon het lidnummer, de achternaam, het geslacht en van de
--aanvoerders ook het team (teamcode en teamnaam) waar ze aanvoerder van zijn.

--MYSQL

SELECT nr, achternaam, geslacht, code, naam
6 of 50
FROM lid AS l
LEFT JOIN team AS t ON l.nr = t.lid_nr_aanvoerder

-----------------------------

--(Vraag 4.) 

--Geef een lijst van de leden die spelen in team ‘REDGH1’. Toon indien mogelijk informatie over de
--bestuursfunctie die het lid heeft gehad. Toon het lidnummer, de achternaam, de functie en de
--begindatum.

--MYSQL 

SELECT l.nr, l.achternaam, b.functie, b.begindatum
FROM lid AS l
LEFT JOIN bestuurslid AS b ON l.nr = b.lid_nr
WHERE l.team_code_speelt_in = 'REDGH1'