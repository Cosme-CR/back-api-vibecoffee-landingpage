# Permite criar um database
create database db_vibe_coffee;

use db_vibe_coffee;

# criar tabela usuario
create table tbl_usuario (
    id        int          not null primary key auto_increment,
    nome      varchar(100) not null,
    usuario   varchar(100) not null,
    senha     varchar(514) not null
);

# criar tabela produto
create table tbl_produto (
    id        int          not null primary key auto_increment,
    nome      varchar(50)  not null,
    descricao text         not null,
    foto      varchar(254) not null,
    status    boolean      
    );

# criar tabela categoria
create table tbl_categoria (
    id        int          not null primary key auto_increment,
    categoria varchar(100) not null
);

# criar tabela tipo
create table tbl_tipo (
    id        int          not null primary key auto_increment,
    tipo      varchar(45)  not null
);

# ALTERADA: criar tabela tipo_categoria
create table tbl_tipo_categoria (
    id           int not null primary key auto_increment,
    id_tipo      int not null,  -- Nome ajustado para o seu SELECT
    id_categoria int not null,  -- Nome ajustado para o seu SELECT

    ## fazer relacao entre duas tabelas
    constraint FK_TIPO_TIPOCATEGORIA
    foreign key (id_tipo)
    references tbl_tipo(id),

    constraint FK_CATEGORIA_TIPOCATEGORIA
    foreign key (id_categoria)
    references tbl_categoria(id)
);

# criar tabela produto_tipo_categoria
create table tbl_produto_tipo_categoria (
    id                    int          not null primary key auto_increment,
    id_tbl_produto        int          not null,
    id_tbl_tipo_categoria int          not null,
    preco                 decimal(6,2) not null,

    ## fazer relacao entre duas tabelas
    constraint FK_PRODUTO_PRODUTO_TIPO_CATEGORIA
    foreign key (id_tbl_produto)
    references tbl_produto(id),

    constraint FK_TIPO_CATEGORIA_PRODUTO_TIPO_CATEGORIA
    foreign key (id_tbl_tipo_categoria)
    references tbl_tipo_categoria(id)
);

INSERT INTO tbl_categoria (categoria) VALUES
('Cafés'),
('Chás'),
('Doces'),
('Drinks'),
('Salgados'),
('Bolos'),
('Sanduíches'),
('Sucos');

INSERT INTO tbl_tipo (tipo) VALUES
('Quente'),
('Gelado'),
('Artesanal'),
('Premium'),
('Tradicional'),
('Vegano'),
('Doce'),
('Salgado');

INSERT INTO tbl_tipo_categoria (id_tipo, id_categoria) VALUES
(1,1), -- Cafés -> Quente
(1,2), -- Chás -> Quente
(7,3), -- Doces -> Doce
(2,4), -- Drinks -> Gelado
(8,5), -- Salgados -> Salgado
(7,6), -- Bolos -> Doce
(8,7), -- Sanduíches -> Salgado
(2,8); -- Sucos -> Gelado

INSERT INTO tbl_produto (nome, descricao, foto, status) VALUES

-- CAFÉS
('Espresso Tradicional','Café espresso intenso.','espresso.jpg',true),
('Cappuccino','Café com espuma cremosa.','cappuccino.jpg',true),
('Latte','Café com leite vaporizado.','latte.jpg',true),
('Mocha','Café com chocolate.','mocha.jpg',true),
('Macchiato','Espresso com espuma.','macchiato.jpg',true),
('Americano','Espresso diluído em água.','americano.jpg',true),
('Flat White','Café com leite aveludado.','flatwhite.jpg',true),
('Affogato','Café com sorvete.','affogato.jpg',true),
('Café Especial','Blend premium da casa.','especial.jpg',true),
('Frappe de Café','Café gelado com chantilly.','frappe.jpg',true),

-- CHÁS
('Chá de Camomila','Chá relaxante.','camomila.jpg',true),
('Chá Verde','Chá antioxidante.','verde.jpg',true),
('Chá Preto','Sabor marcante.','preto.jpg',true),
('Chá de Hortelã','Refrescante.','hortela.jpg',true),
('Chá de Erva Doce','Aromático.','erva-doce.jpg',true),
('Chá de Frutas','Frutas vermelhas.','frutas.jpg',true),
('Chá Gelado Limão','Gelado e refrescante.','limao.jpg',true),
('Chá Gelado Pêssego','Sabor suave.','pessego.jpg',true),
('Chá de Hibisco','Levemente ácido.','hibisco.jpg',true),
('Chá Especial','Receita da casa.','cha-especial.jpg',true),

-- DOCES
('Brownie','Chocolate intenso.','brownie.jpg',true),
('Cheesecake','Frutas vermelhas.','cheesecake.jpg',true),
('Donut','Cobertura doce.','donut.jpg',true),
('Torta de Limão','Cremosa.','torta-limao.jpg',true),
('Brigadeiro Gourmet','Chocolate belga.','brigadeiro.jpg',true),
('Cookie de Chocolate','Massa macia.','cookie.jpg',true),
('Muffin','Recheado.','muffin.jpg',true),
('Cupcake','Cobertura cremosa.','cupcake.jpg',true),
('Pudim','Tradicional.','pudim.jpg',true),
('Sonho','Recheio de creme.','sonho.jpg',true),

-- DRINKS
('Mojito Sem Álcool','Limão e hortelã.','mojito.jpg',true),
('Pink Lemonade','Refrescante.','pink.jpg',true),
('Soda Italiana','Frutas e gás.','soda.jpg',true),
('Drink Tropical','Frutas tropicais.','tropical.jpg',true),
('Drink de Morango','Morango fresco.','morango.jpg',true),
('Drink de Manga','Manga natural.','manga.jpg',true),
('Drink Blue','Xarope azul.','blue.jpg',true),
('Drink Citrus','Mix cítrico.','citrus.jpg',true),
('Drink Especial','Receita exclusiva.','drink-especial.jpg',true),
('Milk Drink','Cremoso e gelado.','milkdrink.jpg',true),

-- SALGADOS
('Coxinha','Frango cremoso.','coxinha.jpg',true),
('Empada','Frango temperado.','empada.jpg',true),
('Esfiha','Carne temperada.','esfiha.jpg',true),
('Pão de Queijo','Tradicional mineiro.','pao-queijo.jpg',true),
('Kibe','Carne e trigo.','kibe.jpg',true),
('Enroladinho','Presunto e queijo.','enroladinho.jpg',true),
('Pastel Assado','Recheio especial.','pastel.jpg',true),
('Torta Salgada','Legumes e queijo.','torta-salgada.jpg',true),
('Croquete','Crocante.','croquete.jpg',true),
('Mini Pizza','Queijo e tomate.','pizza.jpg',true),

-- BOLOS
('Bolo de Chocolate','Cobertura cremosa.','bolo-chocolate.jpg',true),
('Bolo de Cenoura','Com chocolate.','cenoura.jpg',true),
('Bolo Red Velvet','Massa vermelha.','redvelvet.jpg',true),
('Bolo de Limão','Cobertura cítrica.','bolo-limao.jpg',true),
('Bolo de Coco','Raspas de coco.','bolo-coco.jpg',true),
('Bolo de Fubá','Tradicional.','fuba.jpg',true),
('Bolo Prestígio','Chocolate e coco.','prestigio.jpg',true),
('Bolo Formigueiro','Granulado.','formigueiro.jpg',true),
('Bolo Especial','Receita da casa.','bolo-especial.jpg',true),
('Bolo Vulcão','Muito recheio.','vulcao.jpg',true),

-- SANDUÍCHES
('Sanduíche Natural','Frango e salada.','natural.jpg',true),
('Sanduíche Vegano','Vegetais frescos.','vegano.jpg',true),
('Misto Quente','Presunto e queijo.','misto.jpg',true),
('Sanduíche de Atum','Atum temperado.','atum.jpg',true),
('Sanduíche de Frango','Frango desfiado.','frango.jpg',true),
('Sanduíche Especial','Receita exclusiva.','sanduiche-especial.jpg',true),
('Sanduíche Integral','Pão integral.','integral.jpg',true),
('Sanduíche de Peru','Peito de peru.','peru.jpg',true),
('Sanduíche Caprese','Tomate e queijo.','caprese.jpg',true),
('Club Sandwich','Tradicional americano.','club.jpg',true),

-- SUCOS
('Suco de Laranja','Natural.','laranja.jpg',true),
('Suco de Limão','Refrescante.','limao-suco.jpg',true),
('Suco de Abacaxi','Natural.','abacaxi.jpg',true),
('Suco de Maracujá','Levemente ácido.','maracuja.jpg',true),
('Suco de Morango','Fruta fresca.','morango-suco.jpg',true),
('Suco Verde','Detox.','verde-suco.jpg',true),
('Suco de Manga','Natural.','manga-suco.jpg',true),
('Suco Tropical','Mix de frutas.','tropical-suco.jpg',true),
('Suco de Uva','Integral.','uva.jpg',true),
('Suco Especial','Receita da casa.','suco-especial.jpg',true);

INSERT INTO tbl_produto_tipo_categoria
(id_tbl_produto, id_tbl_tipo_categoria, preco)
VALUES

-- CAFÉS
(1,1,8.50),
(2,1,10.00),
(3,1,11.50),
(4,1,12.00),
(5,1,9.50),
(6,1,8.00),
(7,1,13.50),
(8,1,15.00),
(9,1,18.00),
(10,1,16.50),

-- CHÁS
(11,2,7.50),
(12,2,8.00),
(13,2,8.50),
(14,2,7.00),
(15,2,7.50),
(16,2,9.00),
(17,2,10.00),
(18,2,10.50),
(19,2,9.50),
(20,2,12.00),

-- DOCES
(21,3,9.50),
(22,3,12.00),
(23,3,8.00),
(24,3,11.50),
(25,3,6.00),
(26,3,7.50),
(27,3,8.50),
(28,3,9.00),
(29,3,7.00),
(30,3,8.50),

-- DRINKS
(31,4,14.00),
(32,4,12.50),
(33,4,11.00),
(34,4,15.00),
(35,4,13.50),
(36,4,13.00),
(37,4,14.50),
(38,4,12.00),
(39,4,16.00),
(40,4,15.50),

-- SALGADOS
(41,5,8.00),
(42,5,7.50),
(43,5,8.50),
(44,5,6.50),
(45,5,8.00),
(46,5,7.00),
(47,5,9.50),
(48,5,10.00),
(49,5,8.50),
(50,5,11.00),

-- BOLOS
(51,6,12.00),
(52,6,11.00),
(53,6,14.00),
(54,6,11.50),
(55,6,12.50),
(56,6,9.50),
(57,6,13.50),
(58,6,10.50),
(59,6,15.00),
(60,6,16.00),

-- SANDUÍCHES
(61,7,12.00),
(62,7,13.50),
(63,7,9.00),
(64,7,13.00),
(65,7,14.00),
(66,7,16.00),
(67,7,12.50),
(68,7,14.50),
(69,7,15.00),
(70,7,17.00),

-- SUCOS
(71,8,8.50),
(72,8,8.00),
(73,8,9.00),
(74,8,9.50),
(75,8,10.00),
(76,8,11.00),
(77,8,10.50),
(78,8,12.00),
(79,8,11.50),
(80,8,13.00);

INSERT INTO tbl_produto
(nome, descricao, foto, status)
VALUES
('Chocolate Cremoso',
 'Bebida de chocolate com leite e chantilly.',
 'chocolate-cremoso.jpg',
 true);
 
 INSERT INTO tbl_tipo_categoria
(id_tipo, id_categoria)
VALUES
(2,1); -- Gelado + Cafés

INSERT INTO tbl_produto_tipo_categoria
(id_tbl_produto, id_tbl_tipo_categoria, preco)
VALUES
(81,1,11.90), -- Chocolate Cremoso Quente
(81,9,14.90); -- Chocolate Cremoso Gelado

-- CATEGORIA ÁLCOOL
INSERT INTO tbl_categoria (categoria)
VALUES ('Álcool');

-- TIPOS
INSERT INTO tbl_tipo (tipo)
VALUES
('Com Álcool'),
('Sem Álcool');

-- RELAÇÃO TIPO + CATEGORIA
-- Considerando que:
-- Álcool = id 9
-- Com Álcool = id 9
-- Sem Álcool = id 10

INSERT INTO tbl_tipo_categoria
(id_tipo, id_categoria)
VALUES
(9,9),
(10,9);

-- PRODUTO
INSERT INTO tbl_produto
(nome, descricao, foto, status)
VALUES
(
'Mojito Especial',
'Drink refrescante com hortelã, limão e gelo.',
'mojito-especial.jpg',
true
);

-- PREÇOS
-- Considerando que o produto recebeu id 82
-- e que as relações acima receberam ids 10 e 11

INSERT INTO tbl_produto_tipo_categoria
(id_tbl_produto, id_tbl_tipo_categoria, preco)
VALUES
(82,10,24.90), -- Com Álcool
(82,11,17.90); -- Sem Álcool
