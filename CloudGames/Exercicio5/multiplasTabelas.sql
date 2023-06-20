CREATE TABLE "public.Pais" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"continente" varchar(100) NOT NULL,
	CONSTRAINT "Pais_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Estado" (
	"id" serial NOT NULL,
	"id_pais" int NOT NULL,
	"nome" varchar(100) NOT NULL,
	CONSTRAINT "Estado_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


select Pais.nome_pais, Estado.nome_estado, Cidade.nome_cidade
from Cidade
join Estado on Cidade.id_estado = Estado.id_estado
join Pais on Estado.id_pais = Pais.id_pais
where Cidade.capital = 'true'
    and Cidade.qtd_habitantes > 500000
    and (Estado.nome_estado like '%São%' or Estado.nome_estado like '%Santo%' or Estado.nome_estado like '%San%')
    and Pais.continente in ('America do Norte', 'America do Sul', 'America Central')
order by Pais.nome_pais, Estado.nome_estado, Cidade.nome_cidade;
