create database EmpresaInstituicaoAluno;
use EmpresaInstituicaoAluno;

create table Empresas (
idEmpresa int primary key,
enome varchar (30),
representante varchar (30)
); 

create table Instituicoes (
idInstituto int primary key, 
inome varchar (40),
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
anome varchar (40),
idade int,
localidade varchar (5),
fkEmpresa int,
foreign key(fkEmpresa) references Empresas(idEmpresa),
fkInstituto int,
foreign key (fkInstituto) references Instituicoes(idInstituto)
)auto_increment = 300;

select * from aluno;
select * from empresas, instituicoes;

insert into aluno values 
	(null, 'Mário', 19, 'ZL', 105, 202),
    (null, 'Olívia', 17, 'ZS', 100, 204),
    (null, 'Fernando', 23, 'ZC', 104, 203),
    (null, 'Leonardo', 20, 'ZN', 102, 200),
    (null, 'Felicia', 19, 'ZL', 103, 201), 
    (null, 'Sérgio', 21, 'ZO', 101, 205);








		


          
