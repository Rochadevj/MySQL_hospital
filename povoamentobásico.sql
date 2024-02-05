-- script para o povoamento básico 
-- Inserir Especialidades
INSERT INTO Especialidade (Nome) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Ortopedia'),
('Cardiologia'),
('Neurologia');

-- Inserir Convênios
INSERT INTO Convênio (Nome, CNPJ, TempoCarência) VALUES
('Convênio A', '12345678901234', 30),
('Convênio B', '56789012345678', 45),
('Convênio C', '90123456789012', 60),
('Convênio D', '34567890123456', 30);

-- Inserir Tipos de Quarto
INSERT INTO TipoQuarto (ValorDiaria, Descricao) VALUES
(150.00, 'Apartamento'),
(100.00, 'Quarto Duplo'),
(70.00, 'Enfermaria');

-- ...