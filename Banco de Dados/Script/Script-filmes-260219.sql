create database Filme;
use Filme;
create table Filme (
   idFilme int primary key,
   titulo varchar (40),
   genero varchar (40),
   diretor varchar (40)
);
select * from filme;
insert into filme
    values (1,'Roma','drama','Alfonso Cuarón');
    
insert into filme (idFilme,titulo) values
(2,'Nasce Uma Estrela');

insert into filme (titulo,idFilme) values
('Bohemian Rhapsody',3);

insert into Filme (idFilme,titulo) values
(4, 'Fragmentado'),
(5, 'Star Wars III'),
(6, 'Avatar'),
(7, 'A Origem'),
(8, 'Os Incríveis'),
(9, 'Sexto Sentido'),
(10, 'Indiana Jones'),
(11, 'Titanic');

-- duas maneiras de atualizar dados --

update Filme set diretor ='George Lucas'
     where idFilme = 5 or idFilme= 10;

update Filme set diretor ='James Camaron'
     where idFilme in (6,11);
     
update Filme set genero='suspense',
                 diretor='M. Night Shyamalan'
			where idFilme in (4,9);
            
update Filme set genero='ficção científica'
           where idFilme in (5,6);
           
select * from Filme;

update Filme set genero='romance'
           where idFilme in (2,11);
           
update Filme set diretor='Bradley Cooper'
          where idFilme =2;
          
update Filme set genero='biografia',
                 diretor='Bryan Singer'
                 where idFilme=3;
                 
update Filme set genero='ficção científica',
				diretor='Christopher Nolen'
				where idFilme=7;

update Filme set genero='animação', 
                 diretor='Brad Bird'
                 where idFilme=8;
                 
update Filme set genero='aventura' where idFilme=10;

-- apagando uma linha com id --
select * from Filme;

delete from Filme where idFilme = 6;

delete from Filme where idFilme in (11,5);

-- como acrescentar uma coluna --

alter table Filme add column ano int;

select * from Filme;

-- alterando o tamanho da coluna--
alter table Filme modify titulo varchar(50);

-- desc mostra informações/estrutura da tabela--
-- desc e describe são os mesmos --
desc Filme;
describe filme;

-- deletar coluna--
alter table Filme drop column ano;

select * from Filme order by titulo; 
select * from filme order by diretor;
select * from filme order by diretor desc, titulo desc;
