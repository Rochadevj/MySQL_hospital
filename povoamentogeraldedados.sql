
-- script para o povoamento geral de dados  
-- Inserir Médicos
INSERT INTO Médico (Nome, DadosPessoais) VALUES
('Dr. Carlos Silva', 'CRM 12345'),
('Dra. Ana Santos', 'CRM 67890'),
('Dr. Fernanda Lima', 'CRM 54321'),
('Dra. Ricardo Oliveira', 'CRM 98765'),
('Dr. Camila Martins', 'CRM 87654'),
('Dra. Lucas Pereira', 'CRM 34567'),
('Dr. Mariana Costa', 'CRM 23456'),
('Dra. André Almeida', 'CRM 87654'),
('Dr. Juliana Rocha', 'CRM 34567'),
('Dra. Guilherme Santos', 'CRM 23456');


-- Inserir Pacientes
INSERT INTO Paciente (Nome, DataNascimento, Endereço, Telefone, Email, CPF, RG) VALUES
('João Oliveira', '1985-08-20', 'Rua C, 456', '987654321', 'joao@email.com', '123.456.789-02', '1234568'),
('Julia Souza', '1990-03-10', 'Rua D, 789', '123456789', 'julia@email.com', '987.654.321-02', '7654322'),
('Lucas Pereira', '1982-11-25', 'Avenida X, 123', '987654321', 'lucas@email.com', '234.567.890-01', '9876543'),
('Fernanda Lima', '1995-06-15', 'Rua Y, 567', '123456789', 'fernanda@email.com', '345.678.901-02', '8765432'),
('Pedro Santos', '1988-09-30', 'Rua Z, 789', '987654321', 'pedro@email.com', '456.789.012-03', '7654321'),
('Mariana Costa', '1992-04-05', 'Avenida W, 456', '123456789', 'mariana@email.com', '567.890.123-04', '6543210'),
('Roberto Almeida', '1980-01-15', 'Rua V, 789', '987654321', 'roberto@email.com', '678.901.234-05', '5432109'),
('Camila Martins', '1987-07-20', 'Avenida U, 123', '123456789', 'camila@email.com', '789.012.345-06', '4321098'),
('Carlos Silva', '1993-02-10', 'Rua Q, 567', '987654321', 'carlos@email.com', '890.123.456-07', '3210987'),
('Gustavo Oliveira', '1986-05-25', 'Avenida P, 789', '123456789', 'gustavo@email.com', '901.234.567-08', '2109876');

-- Inserir Consultas
-- Inserir Consultas
INSERT INTO Consulta (DataHora, MédicoID, PacienteID, Valor, ConvênioID, NúmeroCarteira) VALUES
('2020-03-10 09:00:00', 6, 1, 150.00, 1, 'C34567'),   -- Usando o MédicoID 6, PacienteID 1 e ConvênioID 1
('2018-05-25 14:30:00', 7, 2, 100.00, 2, 'C89012'),   -- Usando o MédicoID 7, PacienteID 2 e ConvênioID 2
('2019-07-15 11:45:00', 8, 3, 120.00, 3, 'C23456'),   -- Usando o MédicoID 8, PacienteID 3 e ConvênioID 3
('2021-09-20 13:15:00', 9, 4, 180.00, 4, 'C78901'),   -- Usando o MédicoID 9, PacienteID 4 e ConvênioID 4
('2018-11-30 10:00:00', 10, 5, 160.00, 1, 'C12346'),  -- Usando o MédicoID 10, PacienteID 5 e ConvênioID 1
('2022-02-05 16:30:00', 11, 6, 130.00, 2, 'C67891'),  -- Usando o MédicoID 11, PacienteID 6 e ConvênioID 2
('2017-04-12 08:45:00', 12, 7, 140.00, 3, 'C34567'),  -- Usando o MédicoID 12, PacienteID 7 e ConvênioID 3
('2020-08-22 12:30:00', 1, 8, 200.00, 4, 'C89012'),   -- Usando o MédicoID 1, PacienteID 8 e ConvênioID 4
('2019-01-18 15:20:00', 2, 9, 110.00, 1, 'C23456'),   -- Usando o MédicoID 2, PacienteID 9 e ConvênioID 1
('2021-06-08 14:00:00', 3, 10, 170.00, 2, 'C78901');  -- Usando o MédicoID 3, PacienteID 10 e ConvênioID 2


INSERT INTO Receita (ConsultaID, Medicamentos, Quantidade, InstruçõesUso) VALUES
(1, 'Paracetamol, Ibuprofeno', '1 comprimido cada', 'Tomar com água após as refeições'),
(2, 'Amoxicilina, Dipirona', '1 comprimido, 1 colher de sopa', 'Tomar conforme orientação médica'),
(3, 'Medicamento1, Medicamento2', 'Quantidade1, Quantidade2', 'Instruções de uso para os medicamentos'),
(4, 'Medicamento3, Medicamento4', 'Quantidade3, Quantidade4', 'Outras instruções de uso'),
(5, 'Medicamento5, Medicamento6', 'Quantidade5, Quantidade6', 'Instruções adicionais');

INSERT INTO Quarto (Numero) VALUES
(102),
(202),
(302);

-- Inserir Enfermeiros
INSERT INTO Enfermeiro (Nome, CPF, CRE) VALUES
('Enf. Maria Oliveira', '11122233344', 'CRE12345'),
('Enf. João Santos', '22233344455', 'CRE23456'),
('Enf. Ana Silva', '33344455566', 'CRE34567'),
('Enf. Pedro Costa', '44455566677', 'CRE45678'),
('Enf. Laura Pereira', '55566677788', 'CRE56789'),
('Enf. Marcos Souza', '66677788899', 'CRE67890');

INSERT INTO InternacaoEnfermeiro (InternacaoID, EnfermeiroID) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 3), (3, 4),
(4, 4), (4, 5),
(5, 5), (5, 6),
(6, 1), (6, 3);

