
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
  coordenador varchar(30)
) auto_increment = 100; 

select * from Curso;

-- Inserção de dados na tabela Curso
insert into Curso values 
   (null, 'ADS', 'Gerson'),
   (null, 'BD', 'Marise'),
   (null, 'Redes', 'Alex');

-- Altera a tabela Aluno, adicionando uma coluna chamada fkCurso, do tipo int   
alter table Aluno add column fkCurso int;

-- Exibe a estrutura da tabela Aluno
desc Aluno;

-- Exibe os dados da tabela Aluno
select * from Aluno;

-- Altera a tabela Aluno, adicionando a restrição de chave estrangeira à coluna fkCurso
-- Essa coluna da tabela Aluno será uma chave estrangeira para a coluna fkCurso da tabela Curso
alter table Aluno add foreign key(fkCurso) references Curso(idCurso);

-- Exibe novamente a estrutura da tabela Aluno
desc Aluno;

-- Atribui valores para a coluna fkCurso da tabela Aluno
-- Os valores atribuídos aqui tem que existir na tabela Curso
update Aluno set fkCurso= 100 
   where ra in (1191004,1191023,1191037);
update Aluno set fkCurso= 101
   where ra in (1191016, 1191026);
update Aluno set fkCurso= 102 where ra = 1191059;

-- Exibe os dados do alunos do curso de id 100
select * from Aluno where fkCurso = 100;

-- Exibe os dados das duas tabelas, tudo misturado
select * from Aluno, Curso;

-- Exibe os dados das duas tabelas, de forma que cada aluno seja exibido juntamente com 
-- os dados do curso correspondente 
select * from Aluno, Curso where Aluno.fkCurso = Curso.idCurso;
select * from Aluno, Curso where fkCurso = idCurso;


-- Idem ao comando anterior, mas apelidando as tabelas
select * from Aluno as a, Curso as c
   where a.idCurso = c.idCurso;


-- Exibindo os dados de forma que não repita os dados do idCurso
select ra,a.nome,bairro,a.fkCurso,c.nome,coordenador
       from Aluno as a, Curso as c
       where a.fkCurso = idCurso;
       
-- Idem ao comando anterior, mas usando a.* para exibir todas as colunas da tabela Aluno
select a.*, c.nome, coordenador 
       from Aluno as a, Curso as c
       where a.fkCurso = c.idCurso;

-- Exibir os dados dos alunos e cursos correspondentes somente dos alunos que fazem o curso 'ADS'
-- supondo que eu não sei o idCurso de 'ADS'       
select a.*, c.nome, coordenador 
       from Aluno as a, Curso as c
       where a.fkCurso = c.idCurso and c.nome = 'ADS';

-- Exibir os dados dos alunos que fazem o curso 'ADS'
-- supondo que eu não sei o idCurso de 'ADS'       
select a.* from Aluno as a, Curso as c
       where a.fkCurso = c.idCurso and c.nome = 'ADS';
       
-- Criação da tabela Disciplina
-- Nela, haverá uma coluna fkCurso, que será chave estrangeira
-- para a tabela Curso
create table Disciplina (
  idDisc int primary key auto_increment,
  nomeDisc varchar(50),
  qtdHor int,
  fkCurso int,
  foreign key(fkCurso) references Curso(idCurso)
) auto_increment=1000;  

-- Inserção de dados na tabela Disciplina
insert into Disciplina values
   (null, 'Algoritmos', 7, 100),
   (null, 'Modelagem de Banco de Dados', 4, 101),
   (null, 'Instalação de Redes Locais', 4, 102),
   (null, 'Banco de Dados', 5, 100);

-- Exemplo de inserção de valor errado para fkCurso, pois o curso de idCurso 103 não existe   
insert into Disciplina values
   (null, 'Tecnologia da Informação', 3, 103);

-- Exibir todos os dados da tabela Disciplina   
select * from Disciplina; 

select * from Curso;
  
-- Exibir os dados das disciplinas e dos cursos correspondentes
select * from Disciplina, Curso where fkCurso=idCurso;

-- Exibir os dados das disciplinas e dos cursos correspondentes
-- sem repetir a informação do idCurso
select d.*,nome,coordenador from Disciplina as d, Curso
      where fkCurso = idCurso;
      
-- Exibir os dados das disciplinas e dos cursos correspondentes
-- sem repetir a informação do idCurso, mas somente do curso de
-- Redes
select d.*,nome,coordenador from Disciplina as d, Curso
      where fkCurso = idCurso and nome= 'Redes';

-- Inserção de mais um aluno na tabela Aluno
-- Como agora já existe a coluna fkCurso, posso já inserir o aluno com o valor
-- dessa coluna:
insert into Aluno values
   (1191890, 'Ze Colmeia','Disney', 102);      
      
select * from Aluno;  

-- Altera a tabela Aluno para acrescentar uma coluna chamada nota, para
-- armazenar valores com casas decimais
alter table Aluno add column nota decimal(4,2); -- tipo decimal é para valores com casas decimais
											    -- 1o número é a quantidade total de dígitos do número
                                                -- 2o número é a quantidade de dígitos após a vírgula

-- Atribui valores para as notas dos 2 primeiros alunos
update Aluno set nota = 5.75 where ra = 1191004;
update Aluno set nota = 7.95 where ra = 1191016; 
  
-- Renomear a coluna nota para notaContinuada
alter table Aluno change nota notaContinuada decimal(4,2);

-- Renomeiar a coluna notaContinuada para notaCont e alterar o tipo para int
alter table Aluno change notaContinuada notaCont int;

-- Exibe a estrutura da tabela Curso e da tabela Aluno
desc Curso;
desc Aluno;

-- Elimina a restrição de primary key da tabela Aluno
alter table Aluno drop primary key;

-- Faz com que a coluna nome da tabela Aluno seja a nova primary key
alter table Aluno modify nome varchar(30) primary key;

-- information_schema é um banco de dados do MySQL que armazena informações internas dos
-- bancos de dados e das tabelas
-- O comando abaixo é para ver as restrições que existem na tabela Aluno do banco de dados adsbNovo
select * from information_schema.TABLE_CONSTRAINTS
   where TABLE_NAME= 'Aluno' and constraint_schema = 'adsbnovo';

-- Elimina a restrição de chave estrangeira da tabela Aluno
-- O nome da restrição pode ser obtido no comando anterior
alter table Aluno drop foreign key aluno_ibfk_1;   
        
       
       