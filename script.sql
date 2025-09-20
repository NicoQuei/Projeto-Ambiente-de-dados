create database presentes;
use presentes;

create table tipoAmigo (
    idTipoAmigo int primary key AUTO_INCREMENT,

    nome varchar(20) not null,
    precoMin decimal(10,2) not null,
    precoMax decimal(10,2) not null
);

create table amigo (
    idAmigo int primary key AUTO_INCREMENT,
    nome varchar(50) not null,
    endereco varchar(100) not null,
    telefone varchar(15) not null,
    email varchar(100) not null,
    tipoAmigo int not null,

    foreign key (tipoAmigo) references tipoAmigo(idTipoAmigo)
);

create table tipoPresente (
    idTipoPresente int primary key AUTO_INCREMENT,
    nome varchar(15) not null
);

create table presente (
    idPresente int primary key AUTO_INCREMENT,
    nome varchar(30) not null,
    preco decimal(10,2) not null,
    tipoPresente int not null,

    foreign key (tipoPresente) references tipoPresente(idTipoPresente)
);

create table presenteado (
    idPresenteado int primary key AUTO_INCREMENT,
    idAmigo int not null,
    idPresente int not null,
    data date not null,
    CONSTRAINT uk_amigo_presente UNIQUE (idAmigo, idPresente, data),

    foreign key (idAmigo) references amigo(idAmigo),
    foreign key (idPresente) references presente(idPresente)
);

insert into tipoAmigo (nome, precoMin, precoMax)
values ("Familia", 600, 1000);

insert into tipoPresente (nome)
values ("Roupa");

insert into amigo (nome, endereco,telefone,email,tipoAmigo)
values (
    "Nicolas",
    "jose lourenço 2270",
    "85996941119",
    "nicolasqueirogapaix@gmail.com",
    1
);

insert into presente(nome, preco, tipoPresente)
values (
    "blusa",
    800,
    1
);

insert into presenteado (idAmigo,idPresente,data)
values (1,1,"2025-09-20");
