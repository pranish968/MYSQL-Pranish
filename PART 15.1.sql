#27/11/2024 aother on #29/11/2024
CREATE DATABASE joins_pii_ex6;
USE joins_pii_ex6;

CREATE TABLE modelo (
    codmod INT PRIMARY KEY,
    nome VARCHAR(10),
    marca VARCHAR(10)
);


CREATE TABLE cliente (
    NIF INT PRIMARY KEY,
    nome VARCHAR(20),
    dtnasc DATE
);


CREATE TABLE veiculo (
    matricula VARCHAR(8) PRIMARY KEY,
    modelo_codmod INT,
    cliente_NIF INT,
    FOREIGN KEY (modelo_codmod) REFERENCES modelo(codmod),
    FOREIGN KEY (cliente_NIF) REFERENCES cliente(NIF)
);

CREATE TABLE estacionamento (
    num INT PRIMARY KEY,
    piso INT,
    capacidade INT
);


CREATE TABLE estaciona (
    cod INT PRIMARY KEY,
    estacionamento_num INT,
    veiculo_matricula VARCHAR(8),
    dataentrada DATE,
    datasaida DATE,
    horaentrada TIME,
    horasaida TIME,
    FOREIGN KEY (estacionamento_num) REFERENCES estacionamento(num),
    FOREIGN KEY (veiculo_matricula) REFERENCES veiculo(matricula)
);


INSERT INTO modelo (codmod, nome, marca) VALUES 
(1, 'Civic', 'Honda'),
(2, 'Model S', 'Tesla'),
(3, 'Corolla', 'Toyota');


INSERT INTO cliente (NIF, nome, dtnasc) VALUES 
(1001, 'Pranish Acharya', '1995-03-12'),
(1002, 'Thapa kaji', '1997-06-20'),
(1003, 'John Doe', '1990-01-15');


INSERT INTO veiculo (matricula, modelo_codmod, cliente_NIF) VALUES 
('AA1234PT', 1, 1001),
('BB5678PT', 2, 1002),
('CC9101PT', 3, 1003);

INSERT INTO estacionamento (num, piso, capacidade) VALUES 
(101, 1, 50),
(102, 2, 60),
(103, 3, 70);


INSERT INTO estaciona (cod, estacionamento_num, veiculo_matricula, dataentrada, datasaida, horaentrada, horasaida) VALUES 
(1, 101, 'AA1234PT', '2024-11-01', '2024-11-02', '08:00:00', '18:00:00'),
(2, 102, 'BB5678PT', '2024-11-03', '2024-11-04', '09:00:00', '19:00:00'),
(3, 103, 'CC9101PT', '2024-11-05', '2024-11-06', '10:00:00', '20:00:00');

#A 
SELECT veiculo.matricula, cliente.nome 
FROM veiculo
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF;

#B
SELECT cliente.NIF, cliente.nome 
FROM veiculo
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF
WHERE veiculo.matricula = '21-FC-41';

#C
SELECT veiculo.matricula
FROM estaciona
JOIN veiculo ON estaciona.veiculo_matricula = veiculo.matricula
WHERE estaciona.cod = 1;

#D
SELECT veiculo.matricula, YEAR(estaciona.dataentrada) AS year
FROM estaciona
JOIN veiculo ON estaciona.veiculo_matricula = veiculo.matricula
WHERE estaciona.cod = 1;

#E
SELECT estaciona.dataentrada, estaciona.datasaida 
FROM estaciona
WHERE estaciona.veiculo_matricula = '70-20-ZH';

#F
SELECT cliente.nome 
FROM veiculo
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF
WHERE veiculo.modelo_codmod = 1;

#G
SELECT estaciona.veiculo_matricula, estaciona.horaentrada, estaciona.horasaida 
FROM estaciona
WHERE veiculo_matricula LIKE '%S%';

#H
SELECT cliente.nome 
FROM estaciona
JOIN veiculo ON estaciona.veiculo_matricula = veiculo.matricula
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF
WHERE estaciona.estacionamento_num = 2;

#I 
SELECT cliente.NIF 
FROM estaciona
JOIN veiculo ON estaciona.veiculo_matricula = veiculo.matricula
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF
WHERE estaciona.estacionamento_num = 3;

#J
SELECT modelo.nome 
FROM estaciona
JOIN veiculo ON estaciona.veiculo_matricula = veiculo.matricula
JOIN modelo ON veiculo.modelo_codmod = modelo.codmod
WHERE estaciona.estacionamento_num = 2;

#K 
SELECT veiculo.matricula, cliente.nome AS owner_name, modelo.nome AS model_description
FROM veiculo
JOIN cliente ON veiculo.cliente_NIF = cliente.NIF
JOIN modelo ON veiculo.modelo_codmod = modelo.codmod;
