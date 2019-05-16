create database EmpresaInstituicaoAluno;
use EmpresaInstituicaoAluno;

create table Empresas (
codigo int primary key,
nome varchar (30),
representante varchar (30)
); 

create table Instituicoes (
codigo int primary key, 
nome varchar (40),
bairro varchar (20)
);

insert into Empresas
   values (100,'TIVIT', 'Alessandro'),
          (101, 'Outsystems', 'Fabiano'),
          (102, 'CIP', 'Henrique'),
          (103, 'PrimeUp', 'Diego'),
          (104, 'Easynvest', 'Laís'), 
          (105, 'Stefanini', 'Rafael');
          
select * from Empresas;
          
insert into Instituicoes
	values (200, 'Albert Einstein','Casa Verde'),
           (201, 'Colégio VIP', 'Imirim'),
           (202, 'Leme do Prado', 'Imirim'),
           (203, 'Said Murad', 'Pq. Guarani'),
           (204, 'Cruzeiro do Sul', 'São Miguel'),
           (205, 'Tito Prates', 'Lauzane');
           
select * from Instituicoes;

-- Nossa, é muito topzera fazer isso auhsuahsuahsa tô orgulhosa
-- de mim mesmo aushuahsas <3 

create table Aluno (
idAluno int primary key auto_increment,
anome
);
		
drop database exerciciomaroto;

          
