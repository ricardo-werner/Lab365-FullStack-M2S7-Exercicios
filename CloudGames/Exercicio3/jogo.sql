// criacao tabela plataforma create table plataforma (
    id int not null auto_increment,
    nome varchar(50) not null,
    primary key (id)
);
// insercao das plataformas
insert into plataforma (nome)
values ('PC'),
    ('PlayStation1'),
    ('Playstation2'),
    ('Playstation3'),
    ('Playstation4'),
    ('Playstation5'),
    ('Xbox Series S'),
    ('Xbox Series X');
// insercao do jogo "The Sims 4 Base"
insert into jogo (nome, data de lancamento, plataforma, genero)
values (
        'The Sims 4 Base',
        '2020-12-01',
        'PC',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'PlayStation1',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'PlayStation2',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'PlayStation3',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'PlayStation4',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'PlayStation5',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'Xbox Series S',
        'Simulacao'
    ),
    (
        'The Sims 4 Base',
        '2020-12-01',
        'Xbox Series X',
        'Simulacao'
    );
// inserindo o usuário "derpino"
insert into usuario (
        nome,
        login,
        senha,
        email,
        dt_nascimento,
        cpf,
        rg
    )
values (
        'Derpson da Silva',
        'derínho',
        'derpinho91',
        'derpino@hotmail.com',
        '1991-01-01',
        '123.123.123-12',
        '4.123.123-1'
    );
// adiconar o jogo "The Sims 4 Base" à biblioteca do usuário "derpino"
insert into biblioteca_usuario (usuario_id, jogo_id)
select u.id,
    j.id
from Usuario u,
    Jogo j
where u.login = 'derínho'
    and j.nome = 'The Sims 4 Base';