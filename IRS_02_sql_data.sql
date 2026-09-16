-- Rozšírená tabuľka hry pre 2. hodinu (sqliteonline.com — engine SQLite)
-- Viac hier a opakované žánre, aby sme mohli robiť skupiny (GROUP BY) a agregácie.
-- Vlož celý tento text do editora a spusti (Run) — stačí raz na začiatku hodiny.

DROP TABLE IF EXISTS hry;

CREATE TABLE hry (
  id         INTEGER PRIMARY KEY,
  nazov      TEXT,
  zaner      TEXT,
  rok        INTEGER,
  hodnotenie REAL,     -- 0 az 10
  cena       REAL      -- v eurach
);

INSERT INTO hry (id, nazov, zaner, rok, hodnotenie, cena) VALUES
  (1,  'The Witcher 3',         'RPG',        2015, 9.3, 29.99),
  (2,  'Minecraft',             'Sandbox',    2011, 9.0, 23.95),
  (3,  'Counter-Strike 2',      'FPS',        2023, 8.1,  0.00),
  (4,  'Red Dead Redemption 2', 'Akcia',      2018, 9.5, 59.99),
  (5,  'Stardew Valley',        'Simulacia',  2016, 9.1, 13.99),
  (6,  'Hollow Knight',         'Plosinovka', 2017, 9.2, 14.99),
  (7,  'FIFA 23',               'Sport',      2022, 7.4, 39.99),
  (8,  'Portal 2',              'Logicka',    2011, 9.4,  9.99),
  (9,  'Cyberpunk 2077',        'RPG',        2020, 7.9, 49.99),
  (10, 'Among Us',              'Party',      2018, 8.0,  3.99),
  (11, 'Elden Ring',            'RPG',        2022, 9.6, 59.99),
  (12, 'Valorant',              'FPS',        2020, 8.3,  0.00),
  (13, 'Celeste',               'Plosinovka', 2018, 9.0, 19.99),
  (14, 'The Sims 4',            'Simulacia',  2014, 7.6,  0.00),
  (15, 'God of War',            'Akcia',      2018, 9.4, 49.99),
  (16, 'Rocket League',         'Sport',      2015, 8.5,  0.00),
  (17, 'Baldurs Gate 3',        'RPG',        2023, 9.7, 59.99),
  (18, 'Fall Guys',             'Party',      2020, 7.8,  0.00),
  (19, 'DOOM Eternal',          'FPS',        2020, 8.8, 39.99),
  (20, 'Tetris Effect',         'Logicka',    2018, 8.9, 29.99);

-- Kontrola: SELECT * FROM hry;
