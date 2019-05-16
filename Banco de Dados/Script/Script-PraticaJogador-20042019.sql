create database PraticaJogador;
use PraticaJogador;

create table timee (
idTime int primary key auto_increment,
tnome varchar (30),
tecnico varchar (30),
dataFormacao date
)auto_increment=100;

select * from timee;

insert into timee values
(null, 'Corinthians', 'Tite', 1910-09-01),
(null, 'Santos', 'Rodolfo', '1922-01-01'),
(null, 'Flamengo', 'Canildinho', '1900-01-01'),
(null, 'Inter', 'Luciano Gavas', '1970-01-01'),
(null, 'Camarões', 'Ubbuntu Camaroke', '1872-01-01'),
(null, 'Cidade Hessel', 'Chico Homem', '2019-04-12');

select * from timee;

create table jogador (
idJogador int primary key auto_increment,
jnome varchar (40), 
posicao varchar (20),
telefone char (14),
fkJogador int
)auto_increment = 500;

insert into jogador values
(null, 'Zé Caro', 'Atacante', '11 89898989', 503),
(null, 'Albonin', 'Meia', '22 339862823', 504),
(null, 'Cocora', 'Lateral', '11 124676543', 503),
(null, 'Cássio', 'Goleiro', '32 977654812', 500),
(null, 'Júlio César', 'Goleiro', '15 987641938',502),
(null, 'Dentinho', 'Zagueiro', '23 98763456', 500);

select * from jogador;

alter table jogador add foreign key (fkJogador) references jogador(idJogador);

desc jogador;

alter table jogador add column fkTime int;
alter table jogador add foreign key (fkTime) references timee(idTime);

update jogador set fkTime = 100
	where idJogador in (503,504,505);
    
update jogador set fkTime = 105
	where idJogador = 501;
    
update jogador set fkTime = 104
	where idJogador = 502;
    
update jogador set fkTime = 103
	where idJogador = 500;

select * from jogador where jnome like 'C%';
select * from jogador order by posicao desc;
select * from jogador where posicao like 'goleiro';
select * from timee where tecnico like '%k_';
select * from timee order by tecnico;
update jogador set posicao = 'Meia Esquerda'
	where idJogador = 501;
select * from jogador;
select * from  jogador,timee where fkTime = 105 and idTime = 105;
select * from jogador as a, jogador as b where a.fkJogador = b.idJogador;
select * from jogador, timee;

