create database exercicio13;
use exercicio13;

create table grupo(
	id_grupo int primary key auto_increment,
    nome_grupo varchar (45),
    descricao_grupo varchar (45)
)auto_increment=1;

create table aluno(
	RA int primary key,
    email_aluno varchar (45),
    nome_aluno varchar (45)
);

create table professor(
	id_professor int primary key auto_increment,
	nome_professor varchar (45),
    disciplina varchar (45)
)auto_increment=10000;

insert into grupo values 
(null, 'PaIoTnela', 'Panela com IOT, um novo conceito de cozinhar'),
(null, 'Heat Watch', 'Relógio para a sua saúde'),
(null, 'Kokoroko', 'Livro digitalizado com automação');

insert into aluno values 
(8294, 'Larissa Hessel', 'larissahessel@outlook.com'),
(2359, 'Francisco Cidade', 'franciscocidadehomemjunior@gmail.com'),
(2923, 'William Marques', 'n4rut0.naruto@yahoo.com'),
(9834, 'Guilherme de Pau', 'guilherme_de_pau_la_@heuhuehueh.com');

insert into professor values 
(null, 'Célia', 'Banco de Dados'),
(null, 'Yoshi', 'Algoritmo'),
(null, 'Vera', 'Socio Emocional'),
(null, 'Fernando', 'Pesquisa e Inovação');

select * from grupo;
select * from aluno;
select * from professor;

alter table professor add column fkGrupo int;
alter table professor add foreign key (fkGrupo) references grupo(id_grupo);

update professor set fkGrupo = 3
	where id_professor = 10000;
    
update professor set fkGrupo = 2
	where id_professor in (10001, 10003);
    
update professor set fkGrupo = 2
	where id_professor = 10002;
    
create table avaliado_por (
	fk_aluno int,
    fk_grupo int,
    
    primary key (fk_aluno, fk_grupo)
);

insert into avaliado_por values 
(8294 , 1),
(2359, 2),
(2923, 3),
(9834, 3);

select * from avaliado_por;

select * from avaliado_por
	inner join grupo
	inner join aluno on avaliado_por.fk_aluno = aluno.RA;
    
select * from grupo
	inner join grupo on id_grupo = 3 
		inner join aluno on RA.aluno = ;

