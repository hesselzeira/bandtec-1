create database my_music;
use my_music;

create table musica(
	idMusica int primary key auto_increment,
	titulo_musica varchar (45) not null,
    artista varchar (45) not null,
    genero varchar (45) not null,
    album varchar (45) not null, 
    ano int
)auto_increment = 1;