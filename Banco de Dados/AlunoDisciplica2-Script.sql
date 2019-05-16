create database AlunoDisciplina2;
use AlunoDisciplina2;

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
   select * from aluno
	inner join alunoDisc on fkra = ra;
    

   
-- exibir os dados da Maria Teixeira e das disciplinas que ela cursa, além
-- das notas e das faltas
select * from Aluno, Disciplina, AlunoDisc
   where ra = fkra and idDisc = fkDisc
   and nomeAluno='Maria Teixeira';
   
-- exibir os dados dos alunos que cursam Banco de Dados, além
-- das notas e das faltas
select * from Aluno, Disciplina, AlunoDisc
   where ra = fkra and idDisc = fkDisc
   and nomeDisc='Banco de Dados';
   
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
       
Create table Curso(
	idCurso int primary key,
    nomeCurso varchar (40),
    coordenador varchar(45)
    );
    
select * from aluno;
select * from disciplina;

insert into curso values
	(1000, 'ADS', 'Gerson'),
    (1001, 'BD', 'Yoshi'),
    (1002, 'REDES', 'Alex');
-- acrescenta uma coluna na tabela aluno, e configura essa coluna
-- como chave estrangeira para curso
alter table Aluno add fkcurso int, 
	add foreign key (fkCurso) references Curso(idCurso);
    
select * from Aluno;

update aluno set fkcurso = 1000 where ra in (54000,54002);
update aluno set fkcurso = 1001 where ra = 54001;

select * from Aluno, Curso where fkCurso = idCurso;
select * from Aluno 
	inner join Curso on fkCurso=idCurso;
    
select * from Aluno 
	join Curso on fkCurso = idCurso
		where nomeCurso = 'ADS'; 
        
-- Exibir todos os alunos e os cursos correspondentes 
-- inclusive os alunos que não tem curso associado
select * from aluno left join curso on fkCurso = idCurso;

-- Exibir todos os cursos e os alunos correspondentes 
-- inclusive os cursos que não tem aluno associado
select * from aluno right join curso on fkcurso = idcurso;

select * from curso right join aluno on fkcurso = idcurso;

select * from curso;

-- Exibir os dados dos alunos, dos cursos, das disciplinas
select * from Aluno 
	join curso on fkCurso = idCurso
    join AlunoDisc on fkRa = ra 
    join Disciplina on fkDisc = idDisc;
    
start transaction; -- dar nome da transação pq vc pode dar uma transação dentro da outra
-- begin transaction -
delete from curso where idcurso = 1002;
select * from curso;
rollback; -- desfaz o que foi feito 

select * from curso;

select * from curso;
insert into curso values (1003, 'CCO', 'Marise');

start transaction;
delete from curso where idCurso = 1003;
select * from curso;
rollback;
