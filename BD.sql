-- Tabela de pacientes
CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE
);

-- Tabela de agendamentos
CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES pacientes(id),
    data_agendamento DATE,
    hora_agendamento TIME
);

-- Tabela de comparecimento
CREATE TABLE comparecimento (
    id SERIAL PRIMARY KEY,
    agendamento_id INT REFERENCES agendamentos(id),
    compareceu BOOLEAN,
    data_comparecimento DATE
);

-- Inserção de dados na tabela de pacientes
INSERT INTO pacientes (nome, data_nascimento) VALUES
('João Silva', '1985-06-15'),
('Maria Oliveira', '1992-11-23'),
('Carlos Santos', '1978-01-10'),
('Ana Pereira', '1989-05-30');

-- Inserção de dados na tabela de agendamentos
INSERT INTO agendamentos (paciente_id, data_agendamento, hora_agendamento) VALUES
(1, '2024-10-15', '10:00:00'),
(2, '2024-10-16', '11:00:00'),
(3, '2024-10-17', '14:30:00'),
(4, '2024-10-18', '09:00:00');

-- Inserção de dados na tabela de comparecimento
INSERT INTO comparecimento (agendamento_id, compareceu, data_comparecimento) VALUES
(1, TRUE, '2024-10-15'),
(2, FALSE, NULL),
(3, TRUE, '2024-10-17'),
(4, FALSE, NULL);

