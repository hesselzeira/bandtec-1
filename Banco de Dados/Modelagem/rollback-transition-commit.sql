create database AlunoDisciplina;
use AlunoDisciplina;

-- Cria a tabela Aluno, com atributos ra, nomeAluno e bairro
create table Aluno (
  ra int primary key auto_increment,
  nomeAluno varchar(45),
  bairro varchar(45)
) auto_increment= 54000;

-- Cria a tabela Disciplina, com atributos idDisc, nomeDisc
create table Disciplina (
  idDisc int primary key auto_increment,
  nomeDisc varchar(45)
) auto_increment = 100;

-- Tabela associativa AlunoDisc 
-- Esta tabela resulta do relacionamento muitos-para-muitos entre Aluno e Disciplina
-- A chave primária será composta pela fkRa e pela fkDisc
create table AlunoDisc (
  fkRa int,		
  foreign key(fkRa) references Aluno(ra),
  fkDisc int,
  foreign key(fkDisc) references Disciplina(idDisc),
  nota decimal(4,2),  		-- nota do aluno na disciplina
  falta int,				-- quantidade de faltas na disciplina
  primary key (fkRa, fkDisc)
 ); 

-- insere dados na tabela Aluno 
insert into Aluno values 
   (null,'Maria Teixeira','Vila Mariana'),
   (null,'José Oliveira', 'Tatuapé'),
   (null,'Katia da Silva', 'Cambuci'),
   (null,'Mário Souza', 'Pinheiros');
select * from Aluno;

-- insere dados na tabela Disciplina   
insert into Disciplina values
   (null,'Banco de Dados'), (null,'Algoritmos'), 
   (null,'Arquitetura'), (null,'Pesquisa e Inovação');
select * from Disciplina;

-- insere dados na tabela AlunoDisc   
insert into AlunoDisc values
   (54000,100,8,2), (54000,101,6,0), (54000,102,7.5,4),
   (54001,100,6,4), (54001,101,7,3), (54001,103,9,5),
   (54002,100,9,0), (54002,102,8,2), (54002,103,5,10),
   (54003,100,7.5,5), (54003,102,9,0), (54003,103,4,12);
select * from AlunoDisc;  

-- exibir os dados dos alunos e das disciplinas que ele cursa, além
-- das notas e das faltas
select * from Aluno, Disciplina, AlunoDisc
   where ra = fkra and idDisc = fkDisc;
   
-- idem ao comando anterior, usando JOIN
select * from Aluno 
	     join AlunoDisc on fkra = ra  
         join Disciplina on fkDisc = idDisc;
   
-- exibir os dados da Maria Teixeira e das disciplinas que ela cursa, além
-- das notas e das faltas
select * from Aluno, Disciplina, AlunoDisc
   where ra = fkra and idDisc = fkDisc
   and nomeAluno='Maria Teixeira';
   
-- idem ao comando anterior, usando JOIN
select * from Aluno 
	     join AlunoDisc on fkra = ra  
         join Disciplina on fkDisc = idDisc
         where nomeAluno = 'Maria Teixeira';

-- exibir os dados dos alunos que cursam Banco de Dados, além
-- das notas e das faltas
select * from Aluno, Disciplina, AlunoDisc
   where ra = fkra and idDisc = fkDisc
   and nomeDisc='Banco de Dados';
   
-- idem ao comando anterior, usando JOIN
select * from Aluno 
	     join AlunoDisc on fkra = ra  
         join Disciplina on fkDisc = idDisc
         and nomeDisc = 'Banco de Dados';
   
   
select * from AlunoDisc;   

-- exibir a soma das notas e a soma das faltas da tabela AlunoDisc
select sum(nota), sum(falta) from AlunoDisc;

-- exibir a soma das notas e a soma das faltas da tabela AlunoDisc
-- exibe o título das colunas como 'Soma das notas' e 'Soma das faltas'
select sum(nota) as 'Soma das notas',
	   sum(falta) as 'Soma das faltas' from AlunoDisc;

-- exibir a média das notas e a média das faltas da tabela AlunoDisc       
select avg(nota) as 'Média das notas',
       avg(falta) as 'Média das faltas' from AlunoDisc;
       
-- exibir a menor nota e a maior nota da tabela AlunoDisc
select min(nota) as 'Menor nota',
       max(nota) as 'Maior nota' from AlunoDisc;        
   
-- exibir a menor quantidade de faltas e a maior quantidade de faltas da tabela AlunoDisc
select min(falta) as 'Menor quant de faltas',
       max(falta) as 'Maior quant de faltas' from AlunoDisc;        

-- exibir a menor nota e a maior nota agrupado por disciplina
select min(nota) as 'Menor nota',
       max(nota) as 'Maior nota' from AlunoDisc group by fkDisc;        

-- exibir a disciplina, a menor nota e a maior nota agrupado por disciplina   
select fkDisc as idDisciplina, min(nota) as 'Menor nota',
       max(nota) as 'Maior nota' from AlunoDisc group by fkDisc;        

-- exibir o RA, a menor nota e a maior nota agrupado por ra (por aluno)   
select fkRa as RA, min(nota) as 'Menor nota',
       max(nota) as 'Maior nota' from AlunoDisc group by fkRa;        

-- exibir a disciplina, a média das notas e a média das faltas agrupados por disciplina
select fkDisc as idDisciplina, avg (nota) as 'Média das notas',
       avg(falta) as 'Média das faltas' from AlunoDisc
       group by fkDisc;
       
-- exibir apenas a coluna nota da tabela AlunoDisc
select nota from AlunoDisc;

-- exibir apenas as notas distintas (sem repetir) da tabela AlunoDisc
select distinct nota from AlunoDisc; 

-- exibir a quantidade de notas da tabela AlunoDisc
select count(nota) as 'Quant de notas' from AlunoDisc;

-- exibir a quantidade de notas distintas da tabela AlunoDisc
select count(distinct nota) as 'Quant de notas distintas'
       from AlunoDisc;      

-- exibir a disciplina e a quantidade de notas da tabela AlunoDisc,
-- agrupados por disciplina
select fkDisc as Disciplina,
       count(nota) as 'Quant de notas' from AlunoDisc
       group by fkDisc;

-- exibir a disciplina e a quantidade de notas distintas da tabela AlunoDisc,
-- agrupados por disciplina
select fkDisc as Disciplina,
       count(distinct nota) as 'Quant de notas' from AlunoDisc
       group by fkDisc;
   
-- criar a tabela Curso
create table Curso(
   idCurso int primary key,
   nomeCurso varchar(40),
   coordenador varchar(45)
);

select * from Aluno;   
select * from Disciplina;

-- insere dados na tabela Curso
insert into Curso values
   (1000, 'ADS', 'Gerson'),
   (1001, 'BD', 'Yoshi'),
   (1002, 'REDES', 'Alex');

-- acrescenta uma coluna na tabela Aluno, e configura essa coluna
-- como chave estrangeira para Curso
alter table Aluno add fkCurso int,
      add foreign key(fkCurso) references Curso(idCurso);
select * from Aluno; 

-- Atribui valores para a coluna fkCurso da tabela Aluno
update Aluno set fkCurso = 1000 where ra in (54000,54002);
update Aluno set fkCurso = 1001 where ra=54001; 

-- Exibir os alunos e os cursos correspondentes
select * from Aluno, Curso where fkCurso=idCurso;

-- Idem ao comando anterior, usando JOIN
select * from Aluno join Curso on fkCurso=idCurso;
-- join e inner join é o mesmo
select * from Aluno inner join Curso on fkCurso=idCurso;

-- Exibir os dados dos alunos e dos cursos, 
-- mas somente do curso de 'ADS'
select * from Aluno 
         join Curso on fkCurso=idCurso 
         where nomeCurso = 'ADS';
         
-- Exibir todos os alunos e os cursos correspondentes
-- inclusive os alunos que não tem curso associado
select * from Aluno left join Curso on fkCurso=idCurso;         

-- Exibir todos os cursos e os alunos correspondentes
-- inclusive os cursos que não tem aluno associado
select * from Aluno right join Curso on fkCurso=idCurso;         

-- Repetindo o comando usando left join, mas invertendo
-- as tabelas. Agora, o que ele considera left é a tabela Curso
select * from Curso left join Aluno on fkCurso=idCurso;

-- Repetindo o comando usando right join, mas invertendo
-- as tabelas. Agora, o que ele considera right é a tab Aluno
select * from Curso right join Aluno on fkCurso=idCurso;         
         
-- Exibir os dados dos alunos, dos cursos, das disciplinas correspondentes
select * from Aluno 
	     join Curso on fkCurso = idCurso
         join AlunoDisc on fkRa = ra 
         join Disciplina on fkDisc = idDisc;
         
-- Idem ao comando anterior, mas exibindo também os alunos que não estão
-- associados a Curso
select * from Aluno 
	left join Curso on fkCurso = idCurso
         join AlunoDisc on fkRa = ra 
         join Disciplina on fkDisc = idDisc;


-- demonstração do conceito de transaction
-- tudo que é feito entre o "start transaction" e o "rollback" é desfeito no rollback
start transaction;
delete from Curso where idCurso = 1002; 
select * from Curso;
rollback;        

select * from Curso;

-- insere mais um curso
insert into Curso values (1003, 'CCO', 'Marise');         
         
-- tudo que é feito entre o "start transaction" e o "commit" terá efeito permanente
start transaction;
delete from Curso where idCurso = 1003;
select * from Curso;
commit;