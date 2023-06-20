CREATE TABLE "public.Ator" (
    "id" serial NOT NULL,
    "none" varchar NOT NULL,
    "dt_nascimento" DATE NOT NULL,
    "altura" double NOT NULL,
    "peso" double NOT NULL,
    CONSTRAINT "Ator_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.Filme" (
    "id" serial NOT NULL,
    "nome" varchar(100) NOT NULL,
    "time_filme" TIME NOT NULL,
    CONSTRAINT "Filme_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.Genero" (
    "id" serial NOT NULL,
    "genero" varchar(100) NOT NULL,
    CONSTRAINT "Genero_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
ALTER TABLE "Genero"
ADD CONSTRAINT "Genero_fk0" FOREIGN KEY ("id") REFERENCES "Filme"("id");
ALTER TABLE "Genero"
ADD CONSTRAINT "Genero_fk1" FOREIGN KEY ("genero") REFERENCES "Filme"("id");

select filme.nome_do_filme,
    filme.duracao_do_filme_em_minutos
from filme
where filme.nome_do_filme like 'Ação'
order by filme.duracao_do_filme_em_minutos;