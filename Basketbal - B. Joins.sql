----- Basics SQL Querry----- 
----- Omar shlhoub -----
--Basket ball database (B.Joins)
----------------------------------------------------------------------------------
--(Vraag 1.) 

--Geef van elk team de teamgegevens en de gegevens van de aanvoerder.

--MYSQL

SELECT *
FROM team AS t
JOIN lid AS l ON t.lid_nr_aanvoerder = l.nr

----------------

--(Vraag 2.)

--Geef van elk team de teamcode en de naam van de aanvoerder.

--MYSQL 

SELECT t.code, l.voorletters, l.tussenvoegsel, l.achternaam
FROM team AS t
JOIN lid AS l ON t.lid_nr_aanvoerder = l.nr

----------------

--(Vraag 3.)

--Geef van elk team uit de klasse B2000 de teamcode en de achternaam van de aanvoerder.

--MYSQL

SELECT t.code, l.achternaam
FROM team AS t
JOIN lid AS l ON t.lid_nr_aanvoerder = l.nr
WHERE t.klasse = 'B2000'

----------------

--(Vraag 4.) 

--Geef van de leden met boetes het lidnummer, de naam en de boetebedragen die voor hem of haar geregistreerd zijn.

--MYSQL

SELECT b.lid_nr, l.achternaam, b.bedrag
FROM boete AS b
JOIN lid AS l ON b.lid_nr = l.nr

----------------

--(Vraag 5.) 

--Geef van de vrouwelijke leden uit Volendam het lidnummer, de naam en de boetebedragen die voor haar geregistreerd zijn.

--MYSQL

SELECT l.nr, l.achternaam, b.bedrag
FROM lid AS l
JOIN boete AS b ON l.nr = b.lid_nr
WHERE geslacht = 'v' AND woonplaats = 'Volendam'

----------------

--(Vraag 6.)

--Geef van de leden, die aanvoerder van een team zijn, het lidnummer en de achternaam. Geef ook de teamcode en de klasse van het team waarvan hij of zij aanvoerder is.

--MYSQL 

SELECT l.nr, l.achternaam, t.code, t.klasse
FROM lid AS l
JOIN team AS t 
ON l.nr = t.lid_nr_aanvoerder

----------------

--(Vraag 7.)

--Geef het lidnummer, de achternaam en de woonplaats van elke vrouwelijke speler die niet in Delft woonachtig is.

--MYSQL

SELECT l.nr, l.achternaam, l.woonplaats
FROM lid AS l
WHERE geslacht = 'v' AND woonplaats <> 'Delft '

----------------

--(Vraag 8.)

--Geef de lidnummers van de leden die in de periode 2000-2005 tot de vereniging zijn toegetreden.

--MYSQL

SELECT DISTINCT (nr)
FROM lid
WHERE jaartoe BETWEEN 2000 AND 2005

----------------

--(Vraag 9.)

--Geef een lijst van leden met de achternaam, de geboortedatum en de huidige leeftijd.

--MYSQL

SELECT nr,  achternaam, 
            geboortedatum, 
            FLOOR((CURDATE() - geboortedatum) / 10000) AS leeftijd
FROM lid

----------------

--(Vraag 10.)

--Geef de achternaam van de leden en het volledig adres. Het adres moet in één kolom komen te staan met als kolomkop ‘adres’.

--MYSQL

SELECT achternaam, 
        concat(straat, " ", huisnr, " ", postcode," ", woonplaats) AS adres
FROM lid

----------------

--(Vraag 11.)

--Geef een lijst van teams met hun thuis gewonnen wedstrijden. Laat het team zien met daarachter de uitslag in één kolom als volgt bijv.: 30 – 24.

--MYSQL

SELECT code, naam, concat(w.scorethuis, ' - ', w.scoreuit) AS uitslag
FROM team AS t
JOIN wedstrijd AS w ON t.code = w.team_code_thuis
WHERE w.scorethuis > w.scoreuit

----------------

--(Vraag 12.)

--Geef een lijst met boetes die meer dan acht jaar geleden uitgedeeld zijn.

--MYSQL

SELECT *
FROM boete
WHERE (YEAR(CURDATE())- YEAR(datumovertreding))> 8

----------------

--(Vraag 13.)

--Geef een lijst van alle vrouwelijke leden, waarbij voorletters, voorvoegsel en naam in één kolom
--verschijnt en het geslacht in de tweede. In die tweede kolom moet het woord ´vrouw´ komen te
--staan. Tip: SQL functie CONCAT_WS is CONCAT met seperator

--MYSQL 

SELECT CONCAT_WS(' ', voorletters, tussenvoegsel, achternaam) AS naam,'vrouw' AS geslacht
FROM lid
WHERE geslacht = 'v'

----------------

--(Vraag 14.)

--Geef een lijst met leden, waarbij voorletters, voorvoegsel en achternaam in één kolom verschijnt en
--het geslacht in de tweede. In die tweede kolom moet het woord ´man´ of ´vrouw´ komen te staan.
--Tip: gebruik CASE WHEN …

--MYSQL
SELECT  concat_ws(' ', voorletters, tussenvoegsel, achternaam) AS naam,
        CASE
        WHEN geslacht = 'v' THEN 'vrouw'
        ELSE 'man'
        END
FROM lid
