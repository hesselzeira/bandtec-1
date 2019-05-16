create database AlunoDisciplina;
use AlunoDisciplina;

create table Aluno(
	ra int primary key auto_increment,
    nomeAluno varchar (45),
    bairro varchar (45)
)auto_increment = 54000;

create table Disciplina (
	idDisc int primary key auto_increment,
    nomeDisc varchar (45)
)auto_increment = 100;

create table AlunoDisc(
	fkRa int,
    foreign key (fkRa) references Aluno(ra),
    fkDisc int, 
    foreign key (fkDisc) references Disciplina(idDisc),
    nota decimal (4,2),
    falta int,
    primary key (fkRa, fkDisc)
);

select * from AlunoDisc;

insert into Aluno values
	(null, 'Maria Teixeira', 'Vila Mariana'),
    (null, 'Jonathan Oliveira', 'Tatuapé'),
    (null, 'Kátia da Silva', 'Cambuci'),
    (null, 'Mário Souza', 'Pinheiros');
    
select * from Aluno;

insert into Disciplina values
	(null, 'Banco de dados'), (null, 'Algoritmos'), 
    (null, 'Arquitetura'), (null, 'Pesquisa e Inovação');
    
Select * from Disciplina;

insert into AlunoDisc values 
	(54000, 100, 8, 2), (54000, 101, 6, 0), (54000, 102, 7.5, 4), 
    (54001, 100, 6,4), (54001, 101, 
    
    