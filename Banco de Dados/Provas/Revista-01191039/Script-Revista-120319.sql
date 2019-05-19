create database jogador;
use jogador;

create table revista (
idRevista int primary key,
titulo varchar (40),
editora varchar (20),
assunto varchar (30)
);

select * from revista;

insert into revista values
	(1, 'Rolling Stone', 'Wenner Publishing', 'Música'),
	(2, 'Mundo Estranho', 'Editora Abril', 'Curiosidades'),
	(3, 'Superinteressante', 'Editora Abril', 'Curiosidades'),
	(4, 'Realidade', 'Editora Abril','Jornalismo'),
	(5, 'Piauí','Editora Alvinegra', 'Jornalismo'),
	(6, 'Época', 'Editora Globo', 'Jornalismo'),
	(7, 'Veja', 'Editora Abril', 'Jornalismo');

select * from revista;
select titulo, assunto from revista;
select * from revista where editora = 'Editora Abril';
select * from revista where assunto = 'Música';
select * from revista order by editora;
select * from revista order by titulo desc;
select * from revista where titulo like '%E';
select * from revista where assunto like 'C%';
select * from revista where editora like '_E%';
select * from revista where titulo like '%N_';

update revista set editora = 'WP'
		where idRevista = 1;
        
select * from revista;

delete from revista where idRevista = 6;

select * from revista;

drop table revista;

