create database PraticaLivro;
use PraticaLivro;

create table editora (
idEditora int primary key auto_increment,
enome varchar (30),
localização varchar (20),
eano int
)auto_increment=500;


create table livro (
idLivro int primary key auto_increment,
lnome varchar (30),
genero varchar (20),
ano char (4) 
)auto_increment= 1000;

create table autor (
idAutor int primary key auto_increment,
anome varchar (30),
nacionalidade varchar (15),
sexo enum ('m', 'f')
)auto_increment = 1;

insert into editora values 
(null, 'Abril', 'São Paulo', 1986),
(null, 'Rocco', 'São Paulo', 1970),
