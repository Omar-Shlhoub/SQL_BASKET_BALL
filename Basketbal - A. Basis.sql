----- Basics SQL Querry----- 
----- Omar shlhoub -----
--Basket ball database (A.basic)
----------------------------------------------------------------------------------
--(Vraag 1.)

--Toon alle records van de tabel Lid.

--MYSQL 

SELECT *
FROM lid

----------------

--(Vraag 2.) 

--Geef alle gegevens van de leden die voor 2001 bij de club zijn toegetreden.

--MYSQL 

SELECT *
FROM lid
WHERE jaartoe < 2001

---------------

--(Vraag 3.) 

--Geef van de vrouwelijke leden de achternaam, de geboortedatum en hun lidnummer.

--MYSQL 

SELECT achternaam, geboortedatum, nr
FROM lid
WHERE geslacht = 'v'

---------------

--(Vraag 4.)

--Geef alle leden die geen emailadres hebben.

--MYSQL

SELECT *
FROM lid
WHERE emailadres IS NULL

---------------

--(Vraag 5.) 

--Geef alleen de leden die wel een emailadres hebben.

--MYSQL 

SELECT *
FROM lid
WHERE emailadres IS NOT NULL

---------------

--(Vraag 6.) 

--Geef de namen (met voorletters en tussenvoegsel) van de leden uit Zoetermeer.

--MYSQL 

SELECT voorletters, tussenvoegsel, achternaam
FROM lid
WHERE woonplaats = 'Zoetermeer'

---------------

--(Vraag 7.) 

--Geef de uitslagen van de wedstrijden uit klasse B2000 die tussen 15u en 19u gespeeld zijn.

--MYSQL 

SELECT *
FROM wedstrijd
WHERE klasse = 'B2000' AND tijd BETWEEN '15:00:00' AND '19:00:00'

----------------

--(Vraag 8.) 

--MYSQL 

--Toon alle leden die in Leiden wonen.

SELECT *
FROM lid
WHERE woonplaats = 'Leiden'

----------------

--(Vraag 9.) 

--Geef alle boetes hoger dan 10 euro van het type A.

--MYSQL 

SELECT *
FROM boete
WHERE TYPE = 'A' AND bedrag > 10

-----------------

--(Vraag 10.) 

--Geef alle gegevens van de sporthallen waarvan de naam begint met een S.

--MYSQL 

SELECT *
FROM sporthal
WHERE naam LIKE 'S%'

-----------------

--(Vraag 11.) 

--Geef de gegevens van de thuiswedstrijden van Dames 1 teams. Daarvan eindigt de code op D1.

--MYSQL 
SELECT *
FROM wedstrijd
WHERE team_code_thuis LIKE '%D1'