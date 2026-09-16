# IRS — Pojmy databázy, doména a SELECT — UČITEĽSKÁ VERZIA

Žiacka verzia: `02_model-a-select_studenti.md`. Dáta: `02_model-a-select_data.sql` (sqliteonline, 20 hier,
so stĺpcom `aktualizovane`). SQL riešenia sú overené v SQLite.

**Rozsah (hod. 5–6, celok 1 + zopakovanie SELECT):** entita, atribút, záznam (N-tica), **doména do hĺbky**
(rozsah/znamienko, zaokrúhľovanie peňazí, dátumy/časy, časové pásmo), dáta vs. informácia;
prakticky SELECT + filtrovanie `AND`/`BETWEEN`/`IN`/`LIKE` + práca s dátumom. **Bez** agregácií, `GROUP BY`, `HAVING`.

---

## ČASŤ 1 — Teória: riešenia a poznámky

**Pojmy jednou vetou:** entita = o čom je tabuľka (hra) · atribút = stĺpec · záznam/N-tica = riadok ·
doména = povolené hodnoty atribútu · dáta = surové hodnoty · informácia = odpoveď z dát.

**T1.** entita = hra; atribúty napr. `nazov`, `cena`, `aktualizovane`; záznam napr.
`(1, The Witcher 3, RPG, 2015, 9.3, 29.99, 2026-07-15 09:20)`.

**T2. (rozsah/znamienko)** Neplatné: `cena = -5` (záporná cena), `hodnotenie = 12` (mimo 0–10),
`zaner = 'RGP'` (preklep — nie je platný žáner), `aktualizovane = '2026-02-30 10:00'` (30. február neexistuje).
Platné: `rok = 2015`.

**T3. (návrh domény)** (a) `rok` = celé čísla, rozumne 1958–tento rok; (b) `hodnotenie` = desatinné 0–10;
(c) `zaner` = konečná množina žánrov (číselník); (d) `aktualizovane` = platný dátum a čas (ISO 8601).

**T4. (peniaze / zaokrúhľovanie — otvorená)**
REAL/FLOAT ukladá čísla v pohyblivej rádovej čiarke → **nepresne** (`0.1 + 0.2` ≠ `0.3`). Pri sčítaní
tisícok cien sa drobné chyby **nasčítajú** a súčet „nesedí" o centy — pri peniazoch neprípustné.
Riešenie: ukladať ceny ako **DECIMAL/NUMERIC** (presný typ) alebo **v centoch ako celé číslo**; zaokrúhľovať
až pri zobrazení. *(Ukážka na tabuli: v SQLite `SELECT 0.1 + 0.2;` → 0.30000000000000004.)*

**T5. (dátumy — otvorená)** `03/04/2026` = **3. apríl** (deň/mesiac, EU) alebo **4. marec** (mesiac/deň, US) —
nejednoznačné. `2026-04-03` (ISO 8601) je jednoznačné a **správne sa zoraďuje** aj ako text (rok→mesiac→deň).

**T6. (časové pásmo — otvorená)** `12:00 UTC` = u nás v lete (UTC+2) **14:00**. Systémy ukladajú čas v **UTC**,
aby bol jeden jednoznačný okamih bez ohľadu na pásmo a letný/zimný čas; do lokálneho času sa prepočíta
až pri zobrazení. *(Inak by ten istý zápis znamenal iný okamih pre servery/používateľov v rôznych pásmach.)*

**T7. (návrh domény — otvorená)** `pocet_hracov` = **kladné celé číslo, aspoň 1** (rozumná horná hranica,
napr. do ~100). Doména má zakázať: 0 a záporné, desatinné (2.5 hráča), text. *(Prijímame každý zmysluplný návrh.)*

**T8.** „59.99" → dáta · „Najnovšie aktualizovaná hra je Valorant" → informácia · „2026-09-14 19:30" → dáta.

---

## ČASŤ 2 — Precvičenie: riešenia (overené)

**SELECT:**
- **S1.** `SELECT * FROM hry;` → 20 riadkov
- **S2.** `SELECT nazov, cena FROM hry;`
- **S3.** `SELECT * FROM hry WHERE zaner='FPS';` → Counter-Strike 2, Valorant, DOOM Eternal (**3**)
- **S4.** `SELECT * FROM hry ORDER BY cena DESC;` → najdrahšie 59.99 (RDR 2, Elden Ring, Baldurs Gate 3)

**Filtrovanie:**
- **F1.** `... WHERE zaner='RPG' AND rok>2019;` → Cyberpunk, Elden Ring, Baldurs Gate 3 (**3**)
- **F2.** `... WHERE cena=0;` → 5 hier
- **F3.** `... WHERE cena BETWEEN 10 AND 30;` → 6 hier (Portal 2 za 9.99 sa nezmestí)
- **F4.** `... WHERE zaner IN ('RPG','FPS');` → 7 hier
- **F5.** `... WHERE nazov LIKE 'C%';` → Counter-Strike 2, Cyberpunk 2077, Celeste (**3**)
- **F6.** `... WHERE cena>40 AND hodnotenie>9;` → RDR 2, Elden Ring, God of War, Baldurs Gate 3 (**4**)

**Dátum:**
- **F7.** `... WHERE aktualizovane > '2026-08-01';` → **11 hier** (Tetris Effect, FIFA 23, Rocket League, Stardew, Elden Ring, Minecraft, Baldurs Gate 3, Fall Guys, CS2, Among Us, Valorant)
- **F8.** `... ORDER BY aktualizovane DESC;` → najnovšie: Valorant (09-14), Among Us (09-12), Counter-Strike 2 (09-10)
- **F9.** Áno, zoradí sa správne — formát ISO `RRRR-MM-DD HH:MM` sa **abecedne (textovo) zoraďuje rovnako ako chronologicky**. Práve preto je ISO formát v databázach štandard. *(Kontrast: `16.9.2026` ako text by sa zoradil zle.)*

---

## Návrh priebehu (2 × 45 min)
- **1. hodina — pojmy + doména:** entita/atribút/záznam (~10 min), potom **doména do hĺbky**
  (~25 min) s dôrazom na 5 typických problémov — záporné čísla, zaokrúhľovanie peňazí, konečná množina,
  dátumy/formáty, časové pásma. Úlohy T1–T3 priebežne.
- **2. hodina — otvorené otázky + prax:** T4–T7 ako **diskusia** (skvelé pre rýchlejších žiakov — nemajú
  „správnu jednu" odpoveď), potom SELECT/filter S1–S4, F1–F9.
- **Pre rýchlych:** T4–T7 sú zámerne otvorené; nechaj ich argumentovať a porovnať návrhy. Prípadne
  bonus: nech vymyslia vlastný atribút a jeho doménu.
- **Teaser na koniec:** opakujúci sa žáner `RPG` → prečo viac tabuliek (ďalšia hodina 7–8).

### Poznámka k tejto téme
Doména tu pripravuje neskoršie **dátové typy a obmedzenia** (celok 2: `NOT NULL`, `CHECK`, kľúče) a aj
**číselníky** (celok 1, ďalšia hodina). Príklad `0.1+0.2` a časové pásma bývajú „aha momenty".
