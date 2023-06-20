create table Usuario(
	id_usuario SERIAL primary key,
	nome varchar (80)
);

create table Produto(
	id_produto serial primary key,
	nome varchar (80)
);

create table Venda(
	id_venda serial primary key,
	id_usuario int,
	id_produto int,
	valor int,
	qtd_produto int,
	dt_compra date,
	
	foreign key (id_usuario) references Usuario(id_usuario),
	foreign key (id_produto) references Produto(id_produto)
);

--Selecionando o nome do usuario e a soma dos valores gastos
select Usuario.nome, SUM(Venda.valor) as valor_total_gastos
from Usuario
join Venda on Usuario.id_usuario = Venda.id_usuario 
--Selecionando as comprar feitas no mês 11 da black friday
where extract (month from Venda.dt_compra) = 11
--agrupando os resultados pelo nome do usuario
group by Usuario.nome
--Ordenando em ordem desc com base no valor total
order by valor_total_gastos desc;