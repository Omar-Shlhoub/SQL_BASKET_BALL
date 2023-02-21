SELECT t.code, l.voorletters, l.tussenvoegsel, l.achternaam
FROM team AS t
JOIN lid AS l ON t.lid_nr_aanvoerder = l.nr