#07-11-2024
create database empresa;
use empresa;

create table funcionarios(
id_funcionario int,
nome varchar(20),
morada varchar(40) ,
contacto int,
primary key(id_funcionario)
);


create table clientes(id_cliente int auto_increment ,
nome varchar(20),
morada varchar(40) ,
contacto int,
id_funcionario int,
primary key(id_cliente),
foreign key(id_funcionario) references funcionarios(id_funcionario));

select * from clientes,funcionarios;

insert into funcionarios values 
(1,'prince 1','figueira',920123456),
(2,'prince 2','marinha das ondas ',123456778),
(3,'prince 3','lisbon',435456547),
(4,'prince 4','porto',658678679);

insert into clientes values 
(1,'celso 1','figueira',920123455,1),
(2,'celso 2','marinha das ondas ',123456779,2),
(3,'celso 3','lisbon',435456542,3),
(4,'celso 4','porto',658678676,4);


select funcionarios.nome, funcionarios.id_funcionario
from funcionarios
inner join clientes
on funcionarios.id_funcionario = clientes.id_funcionario;
