#20/11/2024
CREATE DATABASE School;
USE School;

CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_birth DATE
);

INSERT INTO Students (id, name, age, date_of_birth)
VALUES
(1, 'prince', 10, '2013-05-12'),
(2, 'marlie bob', 15, '2008-03-25'),
(3, 'kim jong', 36, '1987-11-02');

UPDATE Students
SET age = 12
WHERE id = 1;

DELETE FROM Students
WHERE age > 35;

#to remove SQL from safe mode.
 SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Students;

CREATE TABLE Sum (
    pedidoID INT ,
    Empresa VARCHAR(20),
    Quantidade INT
);

INSERT INTO Sum (pedidoID, Empresa,Quantidade)
VALUES
(1, 'A',20),
(2, 'B',50  ),
(3, 'B',50);

SELECT * FROM Students;

select Sum(Quantidade) as Sum_total from Sum;

select Empresa, Sum(quantidade) as Sum_total
from Sum
group by Empresa;


SELECT SUM(age) AS Total_Age FROM Students;

SELECT SUM(age) AS Total_Age_Over_18 FROM Students
WHERE age > 18;

