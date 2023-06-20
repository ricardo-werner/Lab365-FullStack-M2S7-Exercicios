create table Cidade(
	id_cidade SERIAL primary key,
	nome_cidade varchar (50),
	id_estado int,
	capital boolean,
	qtd_populacao int,
	
	foreign key (id_estado) references Estado(id_estado)
);

create table Estado(
	id_estado SERIAL primary key,
	id_pais int,
	nome_estado varchar (50),
	
	foreign key (id_pais) references Pais(id_pais)
);

create table Pais(
	id_pais SERIAL primary key,
	nome_pais varchar (50),
	continente varchar (80)
);


/**
 * O operar LIKE usamos para comparar string em SQL e
 * o % é usado para representar  qualquer número de caracteres.
 */

/**Crie um script em SQL, informando nome do país, nome do estado e nome da cidade, de todas as capitais que 
 * possuam população acima de 500 mil habitantes, cujos estados tenham nome de santo (ou seja, iniciem com São, Santo, San ou Saint)
 * em países da América (América do Norte, América Central e América do Sul). Os resultados devem ser ordenados
 *  por nome do país, nome do estado e nome da cidade.
 */ 
 
select Pais.nome_pais as "Nome do pais", Estado.nome_estado as "Nome do estado"
from Pais
join Estado on Pais.id_pais = Estado.id_pais 
join Cidade on Estado.id_estado = Cidade.id_estado 
where Cidade.capital = true  and Cidade.qtd_populacao > 500000
and (Estado.nome_estado like 'São%'
or Estado.nome_estado like 'Santo%'
or Estado.nome_estado like 'San%'
or Estado.nome_estado like 'Saint%')
and Pais.continente in ('América do Norte', 'América Central', 'América do Sul')
order by Pais.nome_pais, Estado.nome_estado, Cidade.nome_cidade;

/**
 * crie um script que busque, ao invés dos 10 países que tenham mais 
 * habitantes, os países que contenham população maior que a população total da Espanha 
 * (calculada como a soma da população de todas as cidades).
 */

SELECT p.nome_pais, SUM(c.qtd_populacao) AS total_population
-- Seleciona o nome do país e a soma da população de todas as cidades desse país como "total_population"
FROM Pais p
-- Tabela "Pais" é referenciada como "p"
JOIN Estado e ON p.id_pais = e.id_pais
-- Une a tabela "Estado" utilizando a chave estrangeira "id_pais"
JOIN Cidade c ON e.id_estado = c.id_estado
-- Une a tabela "Cidade" utilizando a chave estrangeira "id_estado"
GROUP BY p.nome_pais
-- Agrupa os resultados pelo nome do país
HAVING SUM(c.qtd_populacao) > (
    SELECT SUM(c2.qtd_populacao)
    -- Subconsulta para calcular a soma da população de todas as cidades da Espanha
    FROM Pais p2
    JOIN Estado e2 ON p2.id_pais = e2.id_pais
    JOIN Cidade c2 ON e2.id_estado = c2.id_estado
    WHERE p2.nome_pais = 'Espanha'
)

/**
select Pais.nome_pais, sum(Cidade.qtd_populacao) as populacao_total
from Pais
join Estado ON Pais.id_pais = Estado.id_pais
join Cidade ON Estado.id_estado = Cidade.id_estado
WHERE Pais.nome_pais <> 'Espanha'
group by Pais.nome_pais
HAVING sum(Cidade.qtd_populacao) > (select sum(qtd_populacao) from Cidade where id_estado IN (select id_pais from Pais where nome_pais = 'Espanha'))
order by populacao_total desc;**/


