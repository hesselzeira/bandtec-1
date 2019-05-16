    create table aluno (
    ra int primary key,
    nome varchar (40),
    bairro varchar (40)
    );
select * from aluno;
insert into Aluno values
(1191094, 'Leandrino Cardoso', 'Limão'),
(1191384, 'Gustavo Mario ', 'Morumbi'),
(1191074, 'Maria Ronalda', 'Nacarazi'),
(1191044, 'Rafaela Bispo', 'Imirim'),
(1191022, 'Keyler Rodrigues', 'Casa Verde');

select * from aluno;
select * from aluno where bairro ='Casa Verde';

create table Curso (
    idCurso int primary key identity(100,10),
    nome varchar (20),
    coordenador varchar (30)
);

select * from curso;

insert into curso values
    ('ADS', 'Gerson'),
    ('BD', 'Marise'),  
    ('Redes', 'Alex');

select * from curso;



