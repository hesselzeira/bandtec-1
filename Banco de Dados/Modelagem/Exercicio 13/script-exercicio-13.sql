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

-- 5 Exibir todos os dados dos grupos e dos seus respectivos alunos
select * from avaliado_por
	inner join grupo on fk_grupo = id_grupo
	inner join aluno on avaliado_por.fk_aluno = aluno.RA;
    
 -- 6  Exibir todos os dados de um determinado grupo e de seus respectivos alunos
select * from avaliado_por
	inner join grupo on id_grupo = fk_grupo 
		inner join aluno on aluno.RA = fk_aluno
			where id_grupo = 3;
            
-- 7 Exibir a média das notas

alter table avaliado_por add column nota int; 

select * from avaliado_por;

update avaliado_por set nota = 10 
	where fk_grupo = 3 and fk_aluno in (2923,9834);
    
update avaliado_por set nota = 8 
	where fk_grupo = 2 and fk_aluno = 2359;
    
update avaliado_por set nota = 9 
	where fk_grupo = 1 and fk_aluno = 8294;
 
-- 7 Exibir a média das notas
-- avg = average = média
select avg(nota) from avaliado_por;

-- 8 Nota mínima e nota máxima 
select min(nota) from avaliado_por;
select max(nota) from avaliado_por;

-- 9 Exibir a soma das notas dadas aos grupos no geral
select sum(nota) from avaliado_por;

-- 10 Exibir os dados dos professores que avaliam cada grupo, os dados dos grupos a data e a hora da banca
alter table avaliado_por add column hora_inico int;
alter table avaliado_por add column hora_final int;

update avaliado_por set hora_inico = 13
	where fk_grupo = 3 and fk_aluno in (2923,9834);

update avaliado_por set hora_final = 15
		where fk_grupo = 2 and fk_aluno = 2359;
        
update avaliado_por set hora_final = 15
	where fk_grupo = 3 and fk_aluno in (2923,9834);
    
update avaliado_por set hora_inico = 13
		where fk_grupo = 2 and fk_aluno = 2359;
        
update avaliado_por set hora_inico = 17
	where fk_grupo = 1 and fk_aluno = 8294;
    
update avaliado_por set hora_final= 19
	where fk_grupo = 1 and fk_aluno = 8294;

-- 10 Exibir os dados dos professores que avaliam cada grupo, os dados dos grupos a data e a hora da banca

select * from grupo;

select * from professor;

select * from aluno;

desc avaliado_por;
