create database escola_atividade;

use escola_atividade;

create table professores (
    id int primary key,
    nome varchar(50),
    data_de_nascimento date,
    contato varchar(100),
    disciplina_exercida varchar(255)
);

insert into professores (id, nome, data_de_nascimento, contato, disciplina_exercida)
values (1, 'Marcel', '1980-04-05', 'marcel@email.com', 'Back End'),
       (2, 'Bruno', '1978-12-15', 'bruno@email.com', 'Banco de Dados'),
       (3, 'Leonid', '1985-07-20', 'leonid@email.com', 'Front End'),
       (4, 'Vitor', '1990-02-10', 'vitor@email.com', 'Java');


create table disciplinas (
    id int primary key,
    nome varchar(50),
    descricao varchar(255),
    carga_horaria int
);

insert into disciplinas (id, nome, descricao, carga_horaria)
values (1, 'Matemática', 'Fundamentos de matemática', 90),
       (2, 'Português', 'Língua Portuguesa', 80),
       (3, 'História', 'História Geral', 60),
       (4, 'Biologia', 'Biologia Celular', 70);


create table cursos (
    id int primary key,
    nome varchar(50),
    descricao varchar(255),
    duracao int,
    requisitos varchar(255)
);

insert into cursos (id, nome, descricao, duracao, requisitos)
values (1, 'Desenvolvimento de Sistemas', 'Curso de TI', 3, 'Conhecimentos em programação'),
       (2, 'Redes de Computadores', 'Curso de redes', 3, 'Conhecimentos básicos em TI'),
       (3, 'Eletroeletrônica', 'Curso de eletrônica', 3, 'Conhecimentos em eletrônica');


create table alunos (
    id int primary key,
    nome varchar(50),
    data_de_nascimento date,
    genero varchar(10),
    endereco varchar(100),
    contato varchar(100),
    serie_turma varchar(50),
    data_de_matricula date
);

insert into alunos (id, nome, data_de_nascimento, genero, endereco, contato, serie_turma, data_de_matricula)
values (1, 'Igor Araujo', '2006-11-17', 'Masculino', 'Cotia', 'igor@email.com', '1ª Série', '2023-09-01'),
       (2, 'Ruan Calsolari', '2006-07-25', 'Masculino', 'Barueri', 'ruan@email.com', '1ª Série', '2023-08-15'),
       (3, 'Pedro Barbosa', '2004-05-02', 'Masculino', 'Jandira', 'pedro@email.com', '1ª Série', '2023-09-05');


create table notas (
    id int primary key,
    id_aluno int,
    id_disciplina int,
    valor float,
    data_avaliacao date,
    foreign key (id_aluno) references alunos (id),
    foreign key (id_disciplina) references disciplinas (id)
);

insert into notas (id, id_aluno, id_disciplina, valor, data_avaliacao)
values (1, 1, 1, 8.5, '2023-10-10'),
       (2, 2, 2, 7.0, '2023-10-11'),
       (3, 3, 3, 9.0, '2023-10-12');


create table avaliacoes (
    id int primary key,
    nome varchar(50),
    id_disciplina int,
    data_avaliacao date,
    foreign key (id_disciplina) references disciplinas (id)
);


insert into avaliacoes (id, nome, id_disciplina, data_avaliacao)
values (1, 'Prova 1', 1, '2023-10-19'),
       (2, 'Prova 2', 2, '2023-10-23'),
       (3, 'Prova 3', 3, '2023-10-17');


create table presenca (
    id int primary key,
    id_aluno int,
    id_disciplina int,
    data_aula date,
    presenca varchar(10),
    foreign key (id_aluno) references alunos (id),
    foreign key (id_disciplina) references disciplinas (id)
);

insert into presenca (id, id_aluno, id_disciplina, data_aula, presenca)
values (1, 1, 1, '2023-10-10', 'Presente'),
       (2, 2, 2, '2023-10-11', 'Ausente'),
       (3, 3, 3, '2023-10-12', 'Presente');

create table funcionarios (
    id int primary key,
    nome varchar(50),
    cargo varchar(50),
    data_de_contratacao date,
    contato varchar(100)
);

insert into funcionarios (id, nome, cargo, data_de_contratacao, contato)
values (1, 'Ana Pereira', 'Secretária', '2022-05-15', 'ana@email.com'),
       (2, 'Pedro Santos', 'Zelador', '2021-08-20', 'pedro@email.com'),
       (3, 'Marta Oliveira', 'Bibliotecária', '2022-02-10', 'marta@email.com'),
       (4, 'Carlos Souza', 'Técnico de Informática', '2023-01-05', 'carlos@email.com');


create table salas (
    id int primary key,
    nome_sala varchar(50),
    capacidade int,
    recursos_disponiveis varchar(255)
);

select * from alunos where nome = 'Igor Araujo';

select disciplinas.nome as Nome_Disciplina, professores.nome as Nome_Professor
from disciplinas inner join professores ON disciplinas.id = professores.id;

select alunos.nome as Nome_Aluno, avg(notas.valor) as Media_Notas
from alunos inner join notas on alunos.id = notas.id_aluno
where alunos.nome = 'Ruan Calsolari' group by alunos.nome;

select * from alunos where serie_turma = '1ª Série';
