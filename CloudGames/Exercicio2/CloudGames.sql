CREATE TABLE Usuario (
    "id" serial NOT NULL,
    "nome" varchar(200) NOT NULL,
    "login" varchar(50) NOT NULL UNIQUE,
    "senha" varchar(20) NOT NULL,
    "email" varchar(100) NOT NULL,
    "dt_nascimento" DATE NOT NULL,
    "cpf" varchar(11) NOT NULL,
    "rg" varchar(12) NOT NULL,
    CONSTRAINT "Usuario_pk" PRIMARY KEY ("id")
) CREATE TABLE Jogos (
    "id" serial NOT NULL,
    "nome" varchar(100) NOT NULL,
    "data_lancamento" DATE NOT NULL,
    "plataforma" varchar(50) NOT NULL,
    "genero" varchar(50) NOT NULL,
    "foto" varchar(200) NOT NULL,
    "video" varchar(200) NOT NULL,
    CONSTRAINT "jogos_pk" PRIMARY KEY ("id")
) create table Plataforma (
    "id_plataforma" SERIAL primary key,
    "nome" VARCHAR (50)
);
create table Genero (
    "id_genero" SERIAL primary key,
    "genero" VARCHAR (50)
);
create table jogo_plataforma (
    id_jogo INT,
    id_plataforma INT,
    foreign key (id_jogo) references Jogo(id_jogo),
    foreign key (id_plataforma) references Plataforma(id_plataforma)
);
create table Foto (
    id_foto SERIAL primary key,
    id_jogo INT,
    url VARCHAR (50),
    foreign key (id_jogo) references Jogo(id_jogo)
);
create table Video(
    id_video SERIAL primary key,
    id_jogo INT,
    url VARCHAR (200),
    foreign key (id_jogo) references Jogo(id_jogo)
);