-- 1
SELECT id, name, lastname, YEAR(dbirth) AS birth_year
FROM clients;

-- 2а
SELECT id, name, lastname, TIMESTAMPDIFF(YEAR, dbirth, CURDATE()) AS age_now
FROM clients;

-- 2б
SELECT id, name, lastname, YEAR(CURDATE()) - YEAR(dbirth) AS age_at_year_end
FROM clients;

-- 3а
SELECT id, name, lastname,
       IF(dbirth > '1992-12-08', NULL,
          TIMESTAMPDIFF(YEAR, dbirth, '1992-12-08')) AS age_on_1992_12_08
FROM clients;

-- 3б
SELECT id, name, lastname,
       IF(dbirth > '2024-07-15', NULL,
          TIMESTAMPDIFF(YEAR, dbirth, '2024-07-15')) AS age_on_2024_07_15
FROM clients;

-- 4а
SELECT id, name, lastname, dbirth
FROM clients
WHERE TIMESTAMPDIFF(YEAR, dbirth, CURDATE() - INTERVAL 1 DAY)
    < TIMESTAMPDIFF(YEAR, dbirth, CURDATE() + INTERVAL 6 DAY);

-- 4б
SELECT id, name, lastname, dbirth
FROM clients
WHERE TIMESTAMPDIFF(YEAR, dbirth, CURDATE() - INTERVAL 1 DAY)
    < TIMESTAMPDIFF(YEAR, dbirth, CURDATE() + INTERVAL 13 DAY);

-- 4в
SELECT id, name, lastname, dbirth
FROM clients
WHERE TIMESTAMPDIFF(YEAR, dbirth, CURDATE() - INTERVAL 1 DAY)
    < TIMESTAMPDIFF(YEAR, dbirth, LAST_DAY(CURDATE()));
