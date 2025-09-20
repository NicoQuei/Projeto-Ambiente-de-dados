# 📘 Trabalho de Banco de Dados – Sistema de Presentes  

Este projeto foi desenvolvido como **trabalho da faculdade** para a disciplina de Banco de Dados.  
O objetivo é criar um sistema capaz de registrar presentes dados a amigos/parente, controlando **quem recebeu, qual presente foi dado, em que data e o valor**.  

---

## 🎯 Contexto  
Cha Hae-In, uma caçadora de nível S, tem dificuldade em lembrar dos presentes que já deu para seus amigos e familiares. Para resolver esse problema, foi proposto o desenvolvimento de um sistema que:  

- Cadastre **tipos de amigos** (ex: família, colega, amigo do peito), com faixas de valores de presentes.  
- Registre **amigos** com informações pessoais (nome, endereço, telefone, e-mail e tipo).  
- Cadastre os **tipos de presentes** (ex: roupas, perfumes, eletrônicos).  
- Registre os **presentes** com nome, preço e tipo.  
- Armazene os **presentes dados**, vinculando um amigo, um presente e a data.  

Com isso, é possível consultar quais presentes já foram dados a cada pessoa e evitar repetições.  

---

## 🗂️ Estrutura do Projeto  

O banco de dados foi nomeado **`presentes`** e contém as seguintes tabelas:  

1. **tipoAmigo** – Define categorias de amigos e a faixa de valores de presente adequada.  
2. **amigo** – Armazena os dados pessoais dos amigos.  
3. **tipoPresente** – Classifica os tipos de presentes possíveis.  
4. **presente** – Registra os presentes, com nome, preço e categoria.  
5. **presenteado** – Relaciona qual amigo recebeu qual presente, e em qual data.  

---

## 🛠️ Scripts de Criação  

```sql
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
