create database clinica;
use clinica;
create table dentista (
CRO int primary key,
nome varchar (50),
telefone int,
email varchar (40)
);

select * from dentista;

insert into dentista values
	(1345-3, 'Dr. Alex', 1122348463, 'dr.alex@dentista.com'),
    (8245-6, 'Dra. Tandara', 1134593245, 'dra.tandara@dentista.com'),
    (7263-6, 'Dr. William', 1122734509, 'dr.william@dentista,com'),
    (1931-0, 'Dr. Lucas', 1198763900, 'dr.lucas@dentista.com');
    
create table paciente (
idPaciente int primary key auto_increment,
pnome varchar (40),
idade int,
telefone int
)auto_increment=1;

select * from paciente;

insert into paciente values
	(null, 'Larissa', 19, 11943323410),
    (null, 'Enzo', 3, 1122345691),
    (null, 'Josh', 32, 1123763120),
    (null, 'Anthony', 50, 1163450284);
    
alter table paciente add column fkdentista int;
alter table paciente add foreign key(fkdentista) 
references dentista(CRO);

desc paciente;

update paciente set fkdentista= 1345-3
	where idPaciente in (1,4);
    
update paciente set fkdentista = 7263-6
	where idPaciente in (2,3);
    
update dentista set nome = 'Dr. Nicolau'
               where CRO = 7257;
               
delete from dentista where CRO = 8239;

select * from dentista;

delete from dentista where CRO = 1931;
