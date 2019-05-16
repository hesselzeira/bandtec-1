create database AtletaNovo;
use AtletaNovo;
create table Atleta (
idAtleta int primary key,
nome varchar (40),
modalidade varchar (40), 
qtdMedalha int
); 
select * from atleta;
insert into atleta
    values (1, 'Daiane dos Santos','Ginástica Artística',17),
		   (2, 'Diego Hipólito', 'Ginástica Artística', 12),
           (3, 'César Cielo', 'Natação', 22),
           (4, 'Michael Phelps', 'Natação', 24),
           (5, 'Cristiano Ronaldo', 'Futebol', 5),
           (6, 'Marta Vieira', 'Futebol', 10),
           (7, 'Neymar', 'Futebol', 14),
           (8, 'Messi', 'Futebol', 15);
select * from atleta;
select nome,qtdMedalha from atleta;
select * from Atleta where modalidade like 'G%';
select * from Atleta order by modalidade;
select * from Atleta order by qtdMedalha desc;
select * from Atleta where nome like '%S%';
select * from Atleta where nome like 'C%';
select * from Atleta where nome like 'O%';
select * from Atleta where nome like '%R_';

update Atleta set qtdMedalha = 11 where idAtleta = '6';
select * from atleta;
update Atleta set modalidade = 'Nado Borboleta' where idAtleta = '4';
select * from atleta;

create table Pais (
idPais int primary key,
pnome varchar (30),
capital varchar (30)
);

select * from Pais;

insert into Pais 
	values (1, 'Brasil', 'Brasília'),
		   (2, 'EUA', 'Washington'),
           (3, 'Portugal', 'Lisboa'),
           (4, 'Argentina', 'Buenos Aires');

alter table atleta add column fkPais int;
desc atleta;

alter table atleta add foreign key (fkPais) references Pais(idPais);

update atleta set fkPais= 1
	where idAtleta in (1,2,3,6,7);
    
select * from atleta;

update atleta set fkPais = 2
	where idAtleta = 4;

update atleta set fkPais = 3
	where idAtleta = 5;
    
update atleta set fkPais = 4 
	where idAtleta = 8;
    
select a.*, p.pnome, p.capital
       from Atleta as a, Pais as p
       where a.fkPais = p.idPais;

-- Selecionando o atleta da Argentina --
select * from atleta
where fkPais = 4; 
