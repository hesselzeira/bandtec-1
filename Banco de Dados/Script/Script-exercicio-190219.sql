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
			
-- Elimina a tabela Aluno 
drop table Aluno;
drop database adsb; 