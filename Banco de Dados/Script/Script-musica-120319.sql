create database musicaNovo;
use musicaNovo;
create table musicas (
idMusica int primary key,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

select * from musicas;

insert into musicas
values (1, 'Give it Away', 'RHCP', 'Funk Rock');

insert into musicas
values (2, 'Bombtrack', 'RATM', 'Funk Rock');

insert into musicas (idMusica, genero)
values (3, 'Metal');

update musicas set titulo= 'Whiplash',
				  artista= 'Metallica'
                  where idMusica = 3;
                  
insert into musicas 
values (4, 'Avisa', 'Falamansa', 'Forró');

insert into musicas
values (5,'Girassol', 'Alceu Valença', 'MPB/Forró'),
 (6, 'Soul To Squeeze','RHCP', 'Rock Alternativo'),
 (7, 'Dosed', 'RHCP','Rock Alternativo');

select * from musicas where artista like '%P';

select titulo,artista from musicas;
select * from musicas where genero = 'Metal';
select * from musicas where artista = 'RHCP';
select * from musicas order by titulo;
select * from musicas order by artista desc;
select * from musicas where titulo like 'D%';
select * from musicas where artista like '%P';
select * from musicas where genero like '_O%';
select * from musicas where titulo like '%E_';

update musicas set genero = 'Xaxado'
               where idMusica = 4;
               
select * from musicas;

alter table musicas modify titulo varchar (50);

select * from musicas;

describe musicas;

create table album (
idAlbum int primary key,
anome varchar (30),
gravadora varchar (30)
);

select * from album;

insert into album values 
	(10, 'Blood Sugar Sexy Magik',  'Warner Bros. Records'),
    (11, 'Rage Against the Machine', 'Epic'),
    (12, ' Kill Em All','Megaforce Records'),
    (13, 'Deixa Entrar', 'Deckdisc'),
    (14, 'Leque Moleque','RCA Records'),
    (15, 'Coneheads', 'Warner Bros. Records'),
    (16, 'By the Way', 'Warner Bros Records');
    
alter table musicas add column fkAlbum int;
alter table musicas add foreign key(fkAlbum) 
references Album(idAlbum);
desc musicas;
select * from musicas;
update musicas set fkAlbum = 10 
		where idMusica = 1;
        
update musicas set fkAlbum = 11
		where idMusica = 2;
        
update musicas set fkAlbum = 12
		where idMusica = 3;
        
select * from album;
select * from musicas;


update musicas set fkAlbum = 13 
	where idMusica=4;
    
update musicas set fkAlbum = 14 
	where idMusica>4;
    
select * from musicas, album
	where fkAlbum = idAlbum;

select * from musicas, album
	where fkAlbum = idAlbum and anome = 'Leque Moleque';
    
select * from musicas, album
	where fkAlbum = idAlbum and gravadora = 'Epic';
    
        


