create database adsb; 
use adsb; 
create table Aluno (
  ra int primary key, 
  nome varchar(30), 
  bairro varchar(20) 
  );
  select * from Aluno; 
  insert into Aluno 
    values (01191059, 'Larissa Hessel', 'Pq. Guarani'), 
    (01191034, 'Alan Rocha', 'Vila Zilda'),
    (01191456, 'Bianca Carvalho', 'Laguinhos Roxo'),
    (01198888, 'Nicole Dias', 'Imirim');

    -- auhsuahsuahsua 
    select bairro from Aluno;
select * from Aluno where ra > 0111910;
select * from Aluno;

-- Exibir os dados em ordem alfabética 
select * from Aluno order by nome;    
select * from Aluno order by bairro;

-- Exibir os alunos em ordem descrescente, de Z-A 
select * from Aluno order by nome desc;

-- Exibir os dados dos alunos cujo nome começa com L 
select * from Aluno where nome like 'W%';
select * from Aluno where bairro like 'Vila%'; 

-- Exibir os dados dos alunos cujo nome termina com a letra A
select * from Aluno where nome like '%s';

-- Exibir os dados dos alunos cujo nome tenha a letra 
-- como segunda letra
select * from Aluno where nome like '_____r%'; 
-- Alunos cujo o nome tenham a letra a 
select * from Aluno where nome like '%a%';

-- Alunos cujo RA seja diferente de 01191018
select * from Aluno where ra <> 01191018;

-- Para atualizar/ alterar o bairo Vila Zilda para Fontalis 
update Aluno set bairro = 'Fontalis'
 where ra = 01191034;
 
 update Aluno set bairro = 'pra puta que pariu',
				nome= 'William fdp'
                where ra= 01191018; 
                
update Aluno set bairro = 'Tatu de Carro',
                 nome = 'William Coitado'
                 where ra = 1191018;
                 
insert into Aluno values
(1191018, 'William Marques', 'Tatuapé');

select * from Aluno;

create table curso (
	idCurso int primary key auto_increment,
	nome varchar (20),
	coordenador varchar (30)
	)auto_increment = 100;
    
select * from curso;

insert into Curso values
	(null, 'ADS', 'Gerson'),
    (null, 'BD', 'Marise'),
    (null, 'Redes', 'Alex');
			
alter table aluno add column idCurso int;
select * from aluno;

describe aluno;

alter table aluno add foreign key (idCurso) references curso (idCurso);

describe aluno;

update Aluno set idCurso = 100 
	where ra in (1191018,1191059, 1191456);
    
update aluno set idCurso = 101
	where ra in (1191034);
    
update aluno set idCurso = 102
	where ra in (1198888);
    
-- Exibe os dados dos alunos do curso de id 100

select * from Aluno where idCurso = 100;

-- jeito errado de exibir as duas tabelas
select * from aluno, curso;

-- jeito correto, colocando o nome da tabela antes do nome da coluna e usar 'WHERE'.
select * from aluno, curso where aluno.idCurso = curso.idCurso;

-- apelidando tabelas para ficar mais facil de tratar as informações
select * from aluno as a, curso as c
	where a.idCurso = c.idCurso;
    
    
-- uma forma de selecionar as colunas para a exibição 
select ra, a.nome, bairro, a.idCurso, c.nome, coordenador
	from Aluno as a, Curso as c
    where a.idCurso = c.idCurso;
    
-- outra forma mais fácil
select a.*, c.nome, coordenador
	from Aluno as a, Curso as c
	where a.idCurso = c.idCurso;
    
-- exibir os dados dos alunos que fazem o curso 'ADS'
-- supondo que eu não sei o idCurso de 'ADS'
select a.*, c.nome, coordenador
	from Aluno as a, Curso as c
	where a.idCurso = c.idCurso and c.nome = 'ADS';


