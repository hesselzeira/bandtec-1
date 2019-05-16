create database Banca;
use Banca;

create table aluno(
	ra int primary key auto_increment,
    nome varchar (30),
    telefone int
)auto_increment = 1;

alter table aluno add column fkAluno int;

insert into aluno values 
(null, 'Larissa', 986329874, 2),
(null, 'Francisco', 987689233, 1);
 
 create table projeto(
	idProjeto int primary key auto_increment,
    pnome varchar (30),
    descricao varchar (60)
)auto_increment = 100;

insert into projeto values 
(null, 'Heat Watch', 'Relógio de nomitoramento'),
(null, 'PaIoTnela', 'Panela com IoT');

alter table aluno add column fkProjeto int;

alter table aluno add column fkAluno int;

alter table aluno add foreign key (fkProjeto) references projeto(idProjeto);
alter table aluno add foreign key (fkAluno) references aluno(ra);      


create table acompanhante(
	idAcompanhante int,
    fkAluno int not null,
    anome varchar (30),
    parentesco varchar (15),
    foreign key(fkAluno) references aluno(ra),
    primary key(fkAluno, idAcompanhante)
);

insert into acompanhante values
(999, 2, 'Francisco', 'pai'),
(998, 1, 'Denise', 'mamãe');


update aluno set fkProjeto = 100 where ra = 1;

update aluno set fkProjeto = 101 where ra = 2;

select * from aluno, projeto where fkProjeto = idProjeto;

select * from aluno, acompanhante where acompanhante.fkAluno = ra;
select * from aluno as a, aluno as r where a.fkAluno = r.ra;

select * from aluno, projeto where fkProjeto = idProjeto and pnome = 'PaIoTnela';

select * from aluno, projeto, acompanhante where fkProjeto = idProjeto and acompanhante.fkAluno = ra;

select * from acompanhante;




