create table Usuario (
	id_usuario serial primary key,
	nome varchar (80)
);

create table Viagem (
	id_viagem serial primary key,
	destino varchar (50),
	dt_viagem date,
	valor int
);

create table Reserva (
	id_reserva serial primary key,
	id_usuario int,
	id_viagem int,
	dt_reserva date,
	
	foreign key (id_usuario) references Usuario(id_usuario),
	foreign key (id_viagem) references Viagem(id_viagem)
);

select Usuario.nome, SUM(Viagem.valor) as valor_total
from Usuario
join Reserva on Usuario.id_usuario = Reserva.id_usuario
join Viagem on Reserva.id_viagem = Viagem.id_viagem
where extract(month from Viagem.dt_viagem) = 7
group by Usuario.nome order by valor_total desc;