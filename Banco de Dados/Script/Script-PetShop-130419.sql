create database PetShop;
use PetShop;

create table pet(
idPet int primary key auto_increment,
pnome varchar (30),
espécie varchar (30),
raça varchar (30),
dataNasc date
)auto_increment = 101;

select * from pet;

insert into pet values 
	(null, 'Dumbo', 'Cachorro', 'Cocker Spaniel', '2004-03-21'),
    (null, 'Frida', 'Gato', 'Bombaim', '2014-01-01'),
    (null, 'James', 'Gato', 'Bombaim', '2019-12-04'),
    (null, 'Snarf', 'Gato', 'Vira Lata', '2013-01-01'),
    (null, 'Taz', 'Cachorro', 'Pastor Alemão', '1995-01-01'),
    (null, 'Bidu', 'Cachorro', 'Vira Lata', '1990-01-01'),
    (null, 'Bob', 'Cachorro','Vira Lata', '1992-01-01'); 
    
create table cliente (
	idCliente int primary key auto_increment,
    cnome varchar (30) not null, 
    telefone int,
    bairro varchar (20),
    sexo enum('m', 'f')
)auto_increment = 1;

select * from cliente;

insert into cliente values 
	(null, 'Denise da Conceição', 969084399, 'Pq. Guarani', 'f'),
    (null, 'Adenil da Conceição', 22343903, 'AE Carvalho', 'm'),
    (null, 'Larissa Hessel', 943323410, 'Consolação', 'f'),
    (null, 'Beatriz Lima', 82934123, 'Imirim', 'f');
    
insert into cliente values
	(null, 'Romualdo de Sá', 989819230, 'Barra Funda', '');
    
alter table pet add column fkCliente int;
    
alter table pet add foreign key (fkCliente) references cliente(idCliente);

select * from pet;
select * from cliente;
desc pet;

update pet set fkCliente = 3 
	where idPet in (102,103);

update pet set fkCliente = 4 
	where idPet = 105;
    
update pet set fkCliente = 1
	where idPet = 101;
    
update pet set fkCliente = 2 
	where idPet = 107;
    
update pet set fkCliente = 4
	where idPet in (104,106);
    
desc cliente;
    
alter table cliente modify cnome varchar(40);

select * from pet where espécie = 'gato';
select pnome, dataNasc from pet;
select * from pet order by pnome;
select * from cliente order by bairro desc;
select * from pet where pnome like 'B%';
select * from cliente where cnome like '% Conceição';

update cliente set telefone = 22363911
	where idCliente = 2;
    
select * from cliente;

select * from cliente, pet;
select * from cliente where sexo = 'f';
alter table cliente drop column sexo;

select * from pet;



delete from pet where idPet = 107;



	


