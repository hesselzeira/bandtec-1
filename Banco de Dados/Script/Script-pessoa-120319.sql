create database Pessoa;
use Pessoa;

create table pessoa (
	idPessoa int primary key auto_increment, -- campo gerado automaticamente pelo sql -- 
	nome varchar (40),
	dataNasc date -- tipo para datas nascimento, e vamos usar muito para o projeto --
	);

select * from pessoa;

insert into pessoa values
   (null, 'Cláudia Silvia', '2000-02-10'),
   (null, 'William Marques Nicolau', '2000-03-19'),
   (null, 'Larissa Conceição Hessel', '2000-02-07'),
   (null, 'Jesus Cristo', '0000-12-25'),
   (null, 'Papai Noel', '1632-01-01');
   
   insert into pessoa (nome, dataNasc) values
	('Nerfetiti', '1380-05-21'),
    ('Michael Jackson','1958-08-29');

select * from pessoa order by nome;
select nome from pessoa;
select * from pessoa where nome like 'C%';
select * from pessoa where nome like '%r_';
select * from pessoa order by dataNasc desc;

insert into pessoa values
	(10, 'Catatau', '2005-07-05');

insert into pessoa (nome, dataNasc) values
	('Mickey Mouse', '1928-11-18');
    
update Pessoa set nome = 'Catatau Rosis' where idPessoa = 10;

select * from pessoa	;

delete from Pessoa where idPessoa = 1;

alter table pessoa auto_increment = 30;

insert into pessoa (nome) values
	('Bob Esponja');
    
update pessoa set dataNasc = '1992-03-04' where idPessoa = 30;

create table Teste (
	idTeste int primary key auto_increment,
    nomeTeste varchar (30),
    horaTeste time
    ) auto_increment = 1000;
    
    select * from Teste;
    
    describe teste;

insert into teste values
	(null, 'teste 1', '1:30');
    
select idTeste as codigo, nomeTeste as 'Nome do Teste',
	   horaTeste as Horário from teste;
       
insert into Teste values
	(null, 'Teste 2', '2:10'),
    (null, 'Teste 3', '1:40');
    
select * from Teste;