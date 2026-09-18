-- S1. Vypíš celú tabu¾ku.
SELECT * FROM hry;

-- S2. Vypíš len názvy a ceny.
SELECT nazov, cena FROM hry;

-- S3. Vypíš hry žánru FPS.
SELECT * FROM hry
WHERE zaner = 'FPS';

-- S4. Zoraï hry od najdrahšej.
SELECT * FROM hry
ORDER BY cena DESC;

-----------------------------------------------

-- F1. RPG hry vydané po roku 2019. (AND)
SELECT * FROM hry
WHERE (zaner = 'RPG') AND (rok > 2019);

-- F2. Hry, ktoré sú zadarmo (cena 0).
SELECT * FROM hry
WHERE cena = 0;

-- F3. Hry s cenou od 10 do 30 € (vrátane). (BETWEEN)
SELECT * FROM hry
WHERE cena BETWEEN 10 AND 30;

-- F4. Hry, ktoré sú RPG alebo FPS. (IN)
SELECT * FROM hry
WHERE zaner IN ('RPG', 'FPS');

-- F5. Hry, ktorých názov zaèína na C. (LIKE 'C%')
SELECT * FROM hry
WHERE nazov LIKE 'C%';

-- F6. Hry drahšie ako 40 € a zároveò hodnotené nad 9.
SELECT * FROM hry
WHERE (cena > 40) and (hodnotenie > 9);

-- F7. Hry aktualizované po 2026-08-01.
sELECt * FROM hry
WHERE aktualizovane > '2026-08-01';

-- F8. Zoraï hry od najnovšie aktualizovanej.
SELECT * FROM hry
ORDER by aktualizovane DESC;

