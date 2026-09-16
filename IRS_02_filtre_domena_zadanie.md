# SQL — 2. hodina: presnejšie filtrovanie, agregácie a skupiny

Meno: ______________________  Trieda: ________

Minule sme sa naučili `SELECT`, `WHERE` a `ORDER BY`. Dnes ideme ďalej — presnejšie podmienky,
počítanie nad dátami a skupiny. Postup je rovnaký: **skúšaj a odvádzaj**, čo príkaz robí.

> Pozn.: názvy žánrov sú bez diakritiky (`RPG`, `FPS`, `Akcia`, `Simulacia`, `Plosinovka`,
> `Sport`, `Logicka`, `Party`, `Sandbox`) — píš ich presne tak.

---

## Ako začať (sqliteonline)

1. Otvor **sqliteonline.com**. Vľavo hore skontroluj, že engine je **SQLite** (predvolené).
2. Do editora vlož **celý** príkaz nižšie a klikni **Run** — vytvorí tabuľku `hry` (20 hier).
3. Over: `SELECT * FROM hry;` — malo by ukázať 20 riadkov.
4. Teraz rieš úlohy — píš príkazy do editora a spúšťaj.

```sql
DROP TABLE IF EXISTS hry;
CREATE TABLE hry (
  id INTEGER PRIMARY KEY, nazov TEXT, zaner TEXT,
  rok INTEGER, hodnotenie REAL, cena REAL
);
INSERT INTO hry (id, nazov, zaner, rok, hodnotenie, cena) VALUES
 (1,'The Witcher 3','RPG',2015,9.3,29.99),(2,'Minecraft','Sandbox',2011,9.0,23.95),
 (3,'Counter-Strike 2','FPS',2023,8.1,0.00),(4,'Red Dead Redemption 2','Akcia',2018,9.5,59.99),
 (5,'Stardew Valley','Simulacia',2016,9.1,13.99),(6,'Hollow Knight','Plosinovka',2017,9.2,14.99),
 (7,'FIFA 23','Sport',2022,7.4,39.99),(8,'Portal 2','Logicka',2011,9.4,9.99),
 (9,'Cyberpunk 2077','RPG',2020,7.9,49.99),(10,'Among Us','Party',2018,8.0,3.99),
 (11,'Elden Ring','RPG',2022,9.6,59.99),(12,'Valorant','FPS',2020,8.3,0.00),
 (13,'Celeste','Plosinovka',2018,9.0,19.99),(14,'The Sims 4','Simulacia',2014,7.6,0.00),
 (15,'God of War','Akcia',2018,9.4,49.99),(16,'Rocket League','Sport',2015,8.5,0.00),
 (17,'Baldurs Gate 3','RPG',2023,9.7,59.99),(18,'Fall Guys','Party',2020,7.8,0.00),
 (19,'DOOM Eternal','FPS',2020,8.8,39.99),(20,'Tetris Effect','Logicka',2018,8.9,29.99);
```

---

## ČASŤ A — Presnejšie filtrovanie

Pri úlohách A3–A5 objavíš nové kľúčové slová (nápovedy sú v zátvorke).

**A1.** Vypíš RPG hry, ktoré vyšli **po roku 2019**. *(spoj dve podmienky cez `AND`)*

**A2.** Vypíš hry, ktoré sú **zadarmo** (cena 0).

**A3.** Vypíš hry s cenou **od 10 do 30 €** (vrátane). *(skús `WHERE cena BETWEEN 10 AND 30`)*

**A4.** Vypíš hry, ktoré sú **RPG alebo FPS**. *(skús `WHERE zaner IN ('RPG','FPS')`)*

**A5.** Vypíš hry, ktorých názov **začína na písmeno C**. *(skús `WHERE nazov LIKE 'C%'`)*

**A6.** Vypíš hry, ktoré stoja **viac ako 40 € a zároveň** majú hodnotenie **nad 9**.

---

## ČASŤ B — Agregačné funkcie (počítame nad dátami)

Tieto funkcie vrátia **jedno číslo** z celého stĺpca: `COUNT`, `AVG`, `MIN`, `MAX`, `SUM`.

**B1.** Zisti, **koľko hier** je v tabuľke. *(`COUNT(*)`)*

**B2.** Aká je **priemerná cena** hry? *(`AVG(cena)`)*

**B3.** Ktorá je **najnižšia a najvyššia cena**? *(`MIN(cena)`, `MAX(cena)` v jednom príkaze)*

**B4.** Aké je **najvyššie hodnotenie** v tabuľke?

**B5.** **Koľko hier je zadarmo**? *(spoj `COUNT` s podmienkou `WHERE`)*

---

## ČASŤ C — Skupiny (GROUP BY)

`GROUP BY` rozdelí riadky do skupín a agregačná funkcia sa spočíta pre **každú skupinu zvlášť**.

**C1.** Zisti, **koľko hier je v každom žánri**. *(`SELECT zaner, COUNT(*) FROM hry GROUP BY zaner;`)*

**C2.** Zisti **priemerné hodnotenie pre každý žáner**.

**C3.** Nájdi **najdrahšiu hru v každom žánri**. *(`MAX(cena)` + `GROUP BY zaner`)*

**C4. (bonus)** Vypíš len žánre, ktoré majú **aspoň 3 hry**. *(skupiny sa filtrujú cez `HAVING`, nie `WHERE`)*

**C5. (bonus)** Zoraď žánre **od najviac hier po najmenej**.

---

## Zamysli sa (najprv tipni, potom over v sqliteonline)

1. Čo myslíš, koľko **riadkov** vráti `SELECT zaner, COUNT(*) FROM hry GROUP BY zaner;` a prečo?

   ________________________________________________________________

2. Aký je rozdiel medzi `WHERE` a `HAVING`?

   ________________________________________________________________

3. Doplň príkaz: priemerná cena **len pre RPG hry**:
   `SELECT AVG(cena) FROM hry WHERE ______________ ;`
