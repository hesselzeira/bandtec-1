create database FuncionarioADSB;
use FuncionarioADSB;

create table Funcionario (
idFunc int primary key auto_increment,
nome varchar (40) not null,
-- sexo char (1),
-- check (sexo = 'm' or sexo = 'f'),
-- enum é 
sexo enum('m', 'f'),
salario decimal (7,2)
)auto_increment =100;

insert into Funcionario (sexo, salario)
	values ('m', 4000);
    
insert into Funcionario values
	(null, 'José da Silva', 'n', 10000);
    
insert into Funcionario values
	(null, 'José da Silva', 'm', 10000);
    
select * from funcionario;

alter table Funcionario add idSuperv int,
	add foreign key(idSuperv) references Funcionario(idFunc);
    
insert into Funcionario values
	(null, 'Maria Oliveira', 'f', 7000.00, 100 ),
	(null, 'Pedro Teixeira', 'm', 7500.00, 100),
    (null, 'Claudia Fontana', 'm', 5000.00, 101),
    (null, 'Cristina Silva', 'f', 4000.00, 102);
    
select f.idfunc, f.nome, f.sexo, f.salario, s.nome, s.idfunc from funcionario as f, funcionario as s
		where f.idfunc = s.idSuperv;