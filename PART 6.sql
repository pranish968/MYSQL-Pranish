-- ACTIDADE 1,2,3 -23/10/2024

CREATE DATABASE ProductsDB;
use productsDB;

CREATE TABLE Produtos (
    ID_NF INT,
    ID_ITEM INT,
    COD_PROD INT,
    VALOR_UNIT DECIMAL,
    QUANTIDADE INT,
    DESCONTO DECIMAL NULL
);

INSERT INTO Produtos (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO)
VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, NULL),
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 7, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL),
(3, 4, 2, 13.50, 7, NULL);

SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM Produtos
WHERE DESCONTO IS NULL;

UPDATE Produtos
SET DESCONTO = 0
WHERE DESCONTO IS NULL;

SELECT ID_NF
FROM Produtos
WHERE DESCONTO BETWEEN 10 AND 20
AND QUANTIDADE > 10;

SELECT QUANTIDADE, VALOR_UNIT
FROM Produtos
WHERE COD_PROD = 2;

#to remove SQL from safe mode.
 SET SQL_SAFE_UPDATES = 0;
 
drop database productsDB;