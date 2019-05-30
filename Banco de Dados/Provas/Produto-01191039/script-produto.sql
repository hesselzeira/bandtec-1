create database ProvaContinuada3;
use ProvaContinuada3;

create table produto (
	id_produto int primary key auto_increment,
    descricao_produto varchar (45),
    marca_produto varchar (45)
)auto_increment=100;

create table categoria (
	id_categoria int primary key auto_increment,
    nome_categoria varchar (45)
)auto_increment = 1;

create table loja (
	id_loja int primary key auto_increment,
	nome_loja varchar (45),
    data_fundacao date
)auto_increment = 1000;

create table vendido_em (
	fk_produto int,
    fk_loja int,
     primary key (fk_produto, fk_loja)
);

insert into produto values 
(null, 'Gloss que muda de cor', 'Gloss Magic'),
(null, 'Removedor de maquiagem', 'Easy Cleaner'),
(null, 'Esmalte que muda de cor', 'Esmalte Magic'),
(null, 'Perfume chique', '212');

insert into categoria values 
(null, 'mágico'),
(null, 'higiene pessoal');

insert into produtos values
(null, 'Papel Higienico', 'Limpool'),
(null, 'Segura o seu azedinho natural', 'Desodorante Desox');

insert into loja values 
(null, 'Sumirê', '1982-01-01');

insert into loja values 
(null, 'Goya', '1942-01-01'),
(null, 'Omy', '2005-01-01'),
(null, 'Água de Cheiro', '2011-01-01');

alter table vendido_em add column preco_atual int;

select * from produto;
select * from loja;
select * from categoria;

alter table vendido_em add foreign key (fk_produto) references produto(id_produto);
alter table vendido_em add foreign key (fk_loja) references loja(id_loja);

desc produto;

alter table produto add column fk_categoria int;
alter table produto add foreign key (fk_categoria) references categoria(id_categoria);

select * from vendido_em;

update produto set fk_categoria = 1
	where id_produto in (100, 102);

update produto set fk_categoria = 2
	where id_produto in (101, 103);
    
select * from produto;

insert into vendido_em values
(100, 1001, 10);

insert into vendido_em values
(101, 1001, 14),
(101, 1000, 12),
(103, 1002, 5);

select * from vendido_em;

-- 5. Exibir os dados das categorias e os dados dos seus produtos.
select * from produto
	inner join categoria on id_categoria = fk_categoria;
    
-- 6. Exibir os dados de uma determinada categoria e os dados dos seus produtos.
select * from produto
	inner join categoria on id_categoria = fk_categoria
		where id_categoria = 2;
        
-- 7. Exibir a média e a soma dos preços dos produtos, no geral.
select avg(preco_atual) from vendido_em;
select sum(preco_atual) from vendido_em;

-- 8. Exibir o menor preço e o maior preço dos produtos, no geral.
select min(preco_atual) from vendido_em;
select max(preco_atual) from vendido_em;  

-- 9. Exibir os dados dos produtos, os dados das lojas correspondentes e os preços dos produtos em cada loja.
select * from vendido_em
	inner join loja on id_loja = fk_loja
		inner join produto;
        



		
