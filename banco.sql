create table biblioteca (
	codlib int(6) not null primary key,
	nome varchar(100) not null,
	endereco varchar(200) not null
)

create table funcionario (
	codfunc int(6) not null primary key,
	nome varchar(100) not null,
	endereco varchar(200) not null,
	telefone varchar(20),
	salario decimal(15,2) not null,
	codbib int(6) not null,
	foreing key (codbib) references biblioteca (codlib)
)

create table