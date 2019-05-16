
-- Cria o banco de dados (schema) chamado adsb
create database adsbNovo;
-- Seleciona o banco de dados adsb
use adsbNovo;

-- Cria a tabela Aluno, com os campos ra, nome, bairro
-- O campo ra é a chave primária da tabela
-- ra vai conter dados numéricos inteiros
-- nome e bairro conterão dados caracteres
create table Aluno (
  ra int primary key,
  nome varchar(30),
  bairro varchar(20) 
);

-- Exibe todas as colunas (e todas as linhas) da tabela Aluno
select * from Aluno;

-- Insere dados de um aluno na tabela Aluno
insert into Aluno 
  values (01191016,'Marcos Paulo','Vila Primavera');

-- Insere os dados de vários alunos
insert into Aluno values
   (01191026,'Gabriel Domingos','Jd Sta Edwiges'),
   (01191023,'Jennifer Januario','Interlagos'),
   (01191037,'Leonardo Melo','Jd Lenise'),
   (01191059,'Livia Monteiro','Sao Jose'),
   (01191004,'Luis Fernando','Imirim');

-- Seleciona todos as colunas da tabela Aluno
select * from Aluno;

-- Criação da tabela Curso
create table Curso (
  idCurso int primary key auto_increment,
  nome varchar(15),
  coordenardor varchar(30)
) auto_increment = 100; 

select * from Curso;

-- Inserção de dados na tabela Curso
insert into Curso values 
   (null, 'ADS', 'Gerson'),
   (null, 'BD', 'Marise'),
   (null, 'Redes', 'Alex');

-- Altera a tabela Aluno, adicionando uma coluna chamada idCurso, do tipo int   
alter table Aluno add column idCurso int;

-- Exibe a estrutura da tabela Aluno
desc Aluno;

-- Exibe os dados da tabela Aluno
select * from Aluno;

-- Altera a tabela Aluno, adicionando a restrição de chave estrangeira à coluna idCurso
-- Essa coluna da tabela Aluno será uma chave estrangeira para a coluna idCurso da tabela Curso
alter table Aluno add foreign key(idCurso) references Curso(idCurso);

-- Exibe novamente a estrutura da tabela Aluno
desc Aluno;

-- Atribui valores para a coluna idCurso da tabela Aluno
-- Os valores atribuídos aqui tem que existir na tabela Curso
update Aluno set idCurso= 100 
   where ra in (1191004,1191023,1191037);
update Aluno set idCurso= 101
   where ra in (1191016, 1191026);
update Aluno set idCurso= 102 where ra = 1191059;

-- Exibe os dados do alunos do curso de id 100
select * from Aluno where idCurso = 100;

-- Exibe os dados das duas tabelas, tudo misturado
select * from Aluno, Curso;

-- Exibe os dados das duas tabelas, de forma que cada aluno seja exibido juntamente com 
-- os dados do curso correspondente 
select * from Aluno, Curso where Aluno.idCurso = Curso.idCurso;

-- Idem ao comando anterior, mas apelidando as tabelas
select * from Aluno as a, Curso as c
   where a.idCurso = c.idCurso;


-- Exibindo os dados de forma que não repita os dados do idCurso
select ra,a.nome,bairro,a.idCurso,c.nome,coordenardor
       from Aluno as a, Curso as c
       where a.idCurso = c.idCurso;
       
-- Idem ao comando anterior, mas usando a.* para exibir todas as colunas da tabela Aluno
select a.*, c.nome, coordenardor 
       from Aluno as a, Curso as c
       where a.idCurso = c.idCurso;

-- Exibir os dados dos alunos e cursos correspondentes somente dos alunos que fazem o curso 'ADS'
-- supondo que eu não sei o idCurso de 'ADS'       
select a.*, c.nome, coordenardor 
       from Aluno as a, Curso as c
       where a.idCurso = c.idCurso and c.nome = 'ADS';

-- Exibir os dados dos alunos que fazem o curso 'ADS'
-- supondo que eu não sei o idCurso de 'ADS'       
select a.* from Aluno as a, Curso as c
       where a.idCurso = c.idCurso and c.nome = 'ADS';
       
       