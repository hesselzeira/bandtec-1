create database Jornal;
use Jornal;

create table jornalista(
idJornalista int primary key auto_increment,
jnome varchar (40),
dataNasc date,
telefone char (14),
fkJornalista int
)auto_increment = 1;

create table telejornal(
idTele int primary key auto_increment,
tnome varchar (20),
horario int,
regiao varchar (15)
)auto_increment = 100;

insert into jornalista values
(null, 'Zé Ancora', '1982-01-01', 5511987654281, '2'),
(null, 'Maria do Tempo', '1980-01-01', 5513943554281, '1'),
(null, 'Rosa de Sá', '1964-01-01', 5517987654281, '2'),
(null, 'Cornalius Cam', '1991-01-01', 5522987654281, '2');

select * from jornalista;

insert into telejornal values
(null, 'MGTV', 12,'Estadual'),
(null, 'SPTV', 12, 'Estadual'),
(null, 'Jornal Nacional', 20, 'Nacional'),
(null, 'Bom dia SP', 5, 'Estadual');

select * from telejornal;

alter table jornalista add column fkTele int;
alter table jornalista add foreign key (fkJornalista) references jornalista(idJornalista);
alter table jornalista add foreign key (fkTele) references telejornal(idTele);

desc jornalista;

update jornalista set fkTele = 100 
	where idJornalista = 1;
    
update jornalista set fkTele = 100 
	where idJornalista = 2;
    
update jornalista set fkTele = 101 
	where idJornalista = 4;
    
update jornalista set fkTele = 102 
	where idJornalista = 3;

select * from jornalista;

select * from jornalista, telejornal where fkTele = idTele;
select * from jornalista,telejornal where fkTele = idTele and idTele = 100; 

select * from jornalista as j, jornalista as jj where j.fkjornalista = jj.idJornalista;

select a.*,p.nome from jornalista as a , telejornal as p
		where idJornalista = fkjornalista;



