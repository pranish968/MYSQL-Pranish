#30-10-2024

use portugal;

alter table cidades
rename to codigopostal;

ALTER TABLE codigopostal RENAME COLUMN Area TO AREAKM2;

SELECT AVG(AREAKM2) AS MEDIAAREA
FROM codigopostal;


SELECT codigo_postal, nome
FROM codigopostal
WHERE AREAKM2 > 80;

SELECT * FROM codigopostal
WHERE codigo_postal = 7830;
