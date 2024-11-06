#2024-11-06 

create database Escola_intep;

use Escola_intep;

create table Estudantes(
id int auto_increment primary key,
nome varchar (100) not null,
idade int,
data_nascimento date not null
);

insert into Estudantes (nome,idade,data_nascimento)
values
('gabriel pinto', '23', '2001-05-12'),
('antonio serpa', '22', '2002-03-22'),
('prince magar', '24', '2000-11-30'),
('diego lamichhane', '21', '2003-07-14');

#seleção de dados.
SELECT * FROM Estudantes;

SELECT * FROM Estudantes
WHERE idade > 18;

SELECT * FROM Estudantes
ORDER BY idade DESC;

SELECT * FROM Estudantes
ORDER BY idade DESC
LIMIT 3;

#funções de agregação 
SELECT COUNT(*) AS total_students
FROM Estudantes;

SELECT AVG(idade) AS average_age
FROM Estudantes;

SELECT MIN(idade) AS youngest_age, MAX(idade) AS oldest_age
FROM Estudantes;

