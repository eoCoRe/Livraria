-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE autor (
cod_autor INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_autor VARCHAR(400),
ft_autor VARCHAR (150)
);

CREATE TABLE editora (
cod_editora INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_editora VARCHAR(100)
);

CREATE TABLE genero (
cod_genero INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50)
);

CREATE TABLE livro (
cod_livro INTEGER PRIMARY KEY AUTO_INCREMENT,
qtd_estoque INTEGER,
nome VARCHAR(400),
preco DECIMAL(10),
ft_livro VARCHAR (150),
cod_editora INTEGER,
FOREIGN KEY(cod_editora) REFERENCES editora (cod_editora)
);

CREATE TABLE compra (
cod_compra INTEGER PRIMARY KEY AUTO_INCREMENT,
valor_total DECIMAL(10),
data_compra DATE,
cod_pagamento INTEGER,
cod_cliente INTEGER
);

CREATE TABLE forma_pagamento (
cod_pagamento INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50)
);

CREATE TABLE usuario (
cod_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
cpf VARCHAR(20),
email VARCHAR(100),
senha VARCHAR(25),
nome VARCHAR(300),
ft_usuario VARCHAR (150)
);

CREATE TABLE admin (
cod_admin INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50),
cod_cliente INTEGER,
FOREIGN KEY(cod_cliente) REFERENCES usuario (cod_cliente)
);

CREATE TABLE autor_livro (
cod_autor INTEGER,
cod_livro INTEGER,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor),
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro)
);

CREATE TABLE genero_livro (
cod_livro INTEGER,
cod_genero INTEGER,
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro),
FOREIGN KEY(cod_genero) REFERENCES genero (cod_genero)
);

CREATE TABLE comp_liv (
cod_livro INTEGER,
cod_compra INTEGER,
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro),
FOREIGN KEY(cod_compra) REFERENCES compra (cod_compra)
);

ALTER TABLE compra ADD FOREIGN KEY(cod_pagamento) REFERENCES forma_pagamento (cod_pagamento);
ALTER TABLE compra ADD FOREIGN KEY(cod_cliente) REFERENCES usuario (cod_cliente);

insert  into autor (nome_autor,cod_autor, ft_autor) values ("Clarice Lispector","1", "clarice_lispector.jfif"),("Fiódor Dostoiévski","2", "fiodor.jfif"),("Machado de Assis","3", "machado_de_assis.jfif"),("José Saramago","4", "jose.jfif"),("William Shakespeare","5", "shakespeare.jfif"),("Carlos Drummond de Andrade","6", "carlinho.jfif"),("Manuel Bandeira","7", "bandeira.jfif");

insert into editora (nome_editora,cod_editora) values ("Companhia da Letras","10"),("Aleph","11"),("Suma","12"),("Globo Livros","13"),("Darkside","14"),("Globo Livros","15");

insert into genero (descricao,cod_genero) values ("Fantasia","20"),("Ficção científica","21"),("Horror","22"),("Distopia","23"),("Ação e aventura","24"),("Ficção Policial","25"),("Romance","26"),("Infantil","27"),("tragedia","28"),("poema","39");

insert into livro (qtd_estoque,nome,preco,cod_editora,cod_livro, ft_livro) values ("10","A Hora da Estrela","20.80","10","30", "hora_estrela.jfif"),("2","Felicidade Clandestina","25.00","11","31", "felicidade_clan.jfif"),("12","Crime e Castigo","100.00","11","32", "crime.jfif"),("8","Os Demônios","22.00","12","33", "os_demo.jfif"),("52","Dom Casmurro","29.00","13","34", "dom_casm.jfif"),("21","Helena","23.00","12","35", "helena.jfif"),("8","A Caverna","45.00","15","36", "caverna.jfif"),("2","Ensaio sobre a Cegueira","40.20","11","37", "ensaio_cegueira.jfif"),("2","Romeu e Julieta","60.00","14","38", "romeu_julieta.jfif"),("10","Rei Lear","49.99","12","39", "rei_lear.jfif"),("9","poemas","29.99","10","40", "poemas.jfif"),("2","A Rosa do Povo","50.00","14","41", "rosa_povo.jfif"),("20","Belo belo","25.50","12","42", "belo_belo.jfif"),("10","Libertinagem","30.00","13","43", "libert.jfif");

insert into forma_pagamento (descricao,cod_pagamento) values ("pix","50"),("debito","51"),("pix","boleto"),("credito","53");

insert into usuario (cod_cliente,cpf,email,senha,nome, ft_usuario) values ("100","336.960.330-65","fernad@gmail.com","fernandin123","fernando lima", "fernandin.jfif"),("101","316.563.410-69","chaoliwmatadordeporco@gmail.com","bogonaro","pedro zias", "predo.jfif"),("103","422.098.680-41","kelvi@gmail.com","senha12345","kelvion", "kelvion.jfif");

insert into compra (valor_total,data_compra,cod_pagamento,cod_cliente,cod_compra) values ("100.00","2022-08-24","50","100","200"),("82.00","2022-08-25","51","101","201"),("20.80","2022-08-24","52","101","202"),("78.00","2022-08-25","53","103","203");

insert into admin (cod_admin,descricao,cod_cliente) values ("900","suporte","100"),("901","admin","101");

insert into autor_livro (cod_autor,cod_livro) values ("1","30"),("1","31"),("2","32"),("2","33"),("3","34"),("3","35"),("4","36"),("4","36"),("4","37"),("5","38"),("5","39"),("6","40"),("6","41"),("7","42"),("7","43");

insert into genero_livro (cod_livro,cod_genero) values ("30","26"),("31","21"),("32","26"),("33","26"),("34","26"),("35","21"),("36","22"),("37","26"),("38","22"),("39","28"),("40","39"),("41","39"),("42","39");

insert into comp_liv (cod_livro,cod_compra) values ("30","200"),("31","201"),("32","202"),("33","203");


explain autor;
explain editora;
explain genero;
explain livro;
explain forma_pagamento;
explain usuario;
explain admin;
explain autor_livro;
explain genero_livro;
explain comp_liv;

select * from autor;
select * from editora;
select * from genero;
select * from livro;
select * from forma_pagamento;
select * from usuario;
select * from admin;
select * from autor_livro;
select * from genero_livro;
select * from comp_liv;



select nome, preco from livro;