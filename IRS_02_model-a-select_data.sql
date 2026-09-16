-- Tabuľka hry pre 2. hodinu IRS (sqliteonline.com — engine SQLite)
-- Vlož celý text do editora a spusti (Run) — stačí raz na začiatku hodiny.
-- Nový stĺpec: aktualizovane = dátum a čas poslednej aktualizácie (formát ISO 8601).

DROP TABLE IF EXISTS hry;

CREATE TABLE hry (
  id           INTEGER PRIMARY KEY,
  nazov        TEXT,
  zaner        TEXT,
  rok          INTEGER,
  hodnotenie   REAL,     -- 0 az 10
  cena         REAL,     -- v eurach
  aktualizovane TEXT     -- datum a cas, ISO 8601: 'YYYY-MM-DD HH:MM'
);

INSERT INTO hry (id, nazov, zaner, rok, hodnotenie, cena, aktualizovane) VALUES
  (1,  'The Witcher 3',         'RPG',        2015, 9.3, 29.99, '2026-07-15 09:20'),
  (2,  'Minecraft',             'Sandbox',    2011, 9.0, 23.95, '2026-09-01 12:00'),
  (3,  'Counter-Strike 2',      'FPS',        2023, 8.1,  0.00, '2026-09-10 18:45'),
  (4,  'Red Dead Redemption 2', 'Akcia',      2018, 9.5, 59.99, '2026-05-02 10:00'),
  (5,  'Stardew Valley',        'Simulacia',  2016, 9.1, 13.99, '2026-08-20 14:30'),
  (6,  'Hollow Knight',         'Plosinovka', 2017, 9.2, 14.99, '2026-03-11 08:15'),
  (7,  'FIFA 23',               'Sport',      2022, 7.4, 39.99, '2026-08-05 16:00'),
  (8,  'Portal 2',              'Logicka',    2011, 9.4,  9.99, '2026-01-20 11:00'),
  (9,  'Cyberpunk 2077',        'RPG',        2020, 7.9, 49.99, '2026-06-30 22:10'),
  (10, 'Among Us',              'Party',      2018, 8.0,  3.99, '2026-09-12 13:05'),
  (11, 'Elden Ring',            'RPG',        2022, 9.6, 59.99, '2026-08-28 07:40'),
  (12, 'Valorant',              'FPS',        2020, 8.3,  0.00, '2026-09-14 19:30'),
  (13, 'Celeste',               'Plosinovka', 2018, 9.0, 19.99, '2026-04-18 15:50'),
  (14, 'The Sims 4',            'Simulacia',  2014, 7.6,  0.00, '2026-02-27 09:00'),
  (15, 'God of War',            'Akcia',      2018, 9.4, 49.99, '2026-07-01 12:12'),
  (16, 'Rocket League',         'Sport',      2015, 8.5,  0.00, '2026-08-09 20:00'),
  (17, 'Baldurs Gate 3',        'RPG',        2023, 9.7, 59.99, '2026-09-05 10:30'),
  (18, 'Fall Guys',             'Party',      2020, 7.8,  0.00, '2026-09-08 17:15'),
  (19, 'DOOM Eternal',          'FPS',        2020, 8.8, 39.99, '2026-06-14 11:45'),
  (20, 'Tetris Effect',         'Logicka',    2018, 8.9, 29.99, '2026-08-02 13:20');

-- Kontrola: SELECT * FROM hry;
