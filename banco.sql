create table bibliotecas (
	codBib int not null primary key AUTO_INCREMENT,
	nome varchar(100) not null,
	endereco varchar(200) not null
);

create table funcionarios (
	codFunc int not null primary key AUTO_INCREMENT,
	nome varchar(100) not null,
	sobrenome varchar(100) not null,
	email varchar(100) not null,
	endereco varchar(200) not null,
	telefone varchar(20),
	salario decimal(15,2) not null,
	codBib int not null,
	foreign key (codBib) references bibliotecas (codBib)
);

create table categorias (
	codCategoria int not null primary key AUTO_INCREMENT,
	descricao varchar(100) not null
);

create table livros (
	codLivro int not null primary key AUTO_INCREMENT,
	titulo varchar(100) not null,
	editora varchar(50) not null,
	valor decimal(15,2) not null,
	codCategoria int not null,
	codBib int not null,
	situacao boolean not null,
	foreign key (codCategoria) references categorias (codCategoria),
	foreign key (codBib) references bibliotecas (codBib)
);

create table alunos (
	codMatricula int not null primary key AUTO_INCREMENT,
	nome varchar(100) not null,
	sobrenome varchar(100) not null,
	email varchar(100) not null,
	endereco varchar(100) not null,
	situacao boolean not null
);

create table empresta (
	id int not null primary key AUTO_INCREMENT,
	codMatricula int not null,
	codLivro int not null,
	dataRetirada date not null,
	dataPrevisao date not null,
	dataEntrega date not null,
	foreign key (codLivro) references livros (codLivro),
	foreign key (codMatricula) references alunos (codMatricula)
);

insert into bibliotecas values (1, 'Biblioteca Municipal de Canoas', 'XV de Janeiro, 270');

insert into funcionarios values (1, 'Marta', 'Soares', 'marta@marta.com', 'Silva So, 350', '123456', 150.00, 1);
insert into funcionarios values (2, 'Paula', 'Silva', 'paula@paula.com', 'Dom Pedro II, 200', '890123', 450.00, 1);
insert into funcionarios values (3, 'Carlos', 'Andrades', 'carlos@carlos.com', 'Ipiranga, 700', '456789', 300.00, 1);
insert into funcionarios values (4, 'Jonas', 'Souza', 'jonas@jonas.com', 'Protasio Alves, 450', '1234567', 450.00, 1);

insert into categorias values (1, 'Ficcao');
insert into categorias values (2, 'Romance');
insert into categorias values (3, 'Literatura');
insert into categorias values (4, 'Cientifico');

insert into livros values (1, 'Senhor dos Aneis', 'XYZ', 75.00, 2, 1, true);
insert into livros values (2, 'Harry Potter', 'XYZ', 35.00, 2, 1, true);
insert into livros values (3, 'O Cortico', 'ABC', 50.00, 3, 1, true);
insert into livros values (4, 'Aprenda Quimica', 'DEF', 70.00, 4, 1, true);
insert into livros values (5, 'Outro Lado da Meia Noite', 'FGH', 80.00, 4, 1, false);

insert into alunos values (1, 'Maria', 'Paula', 'maria_paula@email.com', 'Assis Brasil, 110', true);
insert into alunos values (2, 'Mauro', 'Eduardo', 'mauro_eduardo@email.com', 'Carlos Gomes, 150', true);
insert into alunos values (3, 'Joao', 'Gilberto', 'joao_gilberto@email.com', 'Andradas, 1200', false);
insert into alunos values (4, 'Paulo', 'Gomes', 'paulo_gomes@email.com', 'Jose do Patrocinio, 500', true);

insert into empresta values (1, 3, 1, '2016-11-10', '2016-11-20', '2016-11-20');
insert into empresta values (2, 3, 2, '2016-11-10', '2016-11-20', '2016-11-18');
insert into empresta values (3, 3, 1, '2016-11-11', '2016-11-21', '2016-11-14');
insert into empresta values (4, 3, 5, '2016-11-21', '2016-02-01', '2016-12-24');