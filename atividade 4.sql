-- Consultas

-- 1. Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio
SELECT * FROM Consulta
WHERE YEAR(DataHora) = 2020 AND ConvênioID IS NULL;

SELECT AVG(Valor) AS ValorMédio FROM Consulta
WHERE YEAR(DataHora) = 2020 AND ConvênioID IS NULL;

-- 2. Todos os dados e o valor médio das consultas do ano de 2020 realizadas por convênio
SELECT * FROM Consulta
WHERE YEAR(DataHora) = 2020 AND ConvênioID IS NOT NULL;

SELECT AVG(Valor) AS ValorMédio FROM Consulta
WHERE YEAR(DataHora) = 2020 AND ConvênioID IS NOT NULL;

-- 3. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT * FROM Internacao
WHERE DataAlta > DataPrevAlta;

-- 4. Receituário completo da primeira consulta registrada com receituário associado
SELECT * FROM Receita
WHERE ConsultaID = (SELECT MIN(ID) FROM Consulta WHERE ConsultaID IS NOT NULL);

-- 5. Todos os dados da consulta de maior valor e também da de menor valor
--    (ambas as consultas não foram realizadas sob convênio)
SELECT * FROM Consulta
WHERE ConvênioID IS NULL
ORDER BY Valor DESC LIMIT 1; -- Consulta de maior valor

SELECT * FROM Consulta
WHERE ConvênioID IS NULL
ORDER BY Valor ASC LIMIT 1; -- Consulta de menor valor

-- 6. Todos os dados das internações em seus respectivos quartos, calculando o total da internação
--    a partir do valor de diária do quarto e o número de dias entre a entrada e a alta
SELECT Internacao.*, Quarto.Numero, TipoQuarto.ValorDiaria, DATEDIFF(DataAlta, DataEntrada) AS DiasInternados,
       TipoQuarto.ValorDiaria * DATEDIFF(DataAlta, DataEntrada) AS TotalInternacao
FROM Internacao
JOIN QuartoInternacao ON Internacao.ID = QuartoInternacao.InternacaoID
JOIN Quarto ON QuartoInternacao.QuartoID = Quarto.ID
JOIN TipoQuarto ON Quarto.ID = TipoQuarto.ID;

-- 7. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT DataEntrada, Procedimento, Quarto.Numero
FROM Internacao
JOIN QuartoInternacao ON Internacao.ID = QuartoInternacao.InternacaoID
JOIN Quarto ON QuartoInternacao.QuartoID = Quarto.ID
JOIN TipoQuarto ON Quarto.ID = TipoQuarto.ID
WHERE TipoQuarto.Descricao = 'Apartamento';

-- 8. Nome do paciente, data da consulta e especialidade de todas as consultas
--    em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”
SELECT Paciente.Nome AS NomePaciente, Consulta.DataHora, Especialidade.Nome AS NomeEspecialidade
FROM Consulta
JOIN Paciente ON Consulta.PacienteID = Paciente.ID
JOIN Médico ON Consulta.MédicoID = Médico.ID
JOIN Especialidade_Médico ON Médico.ID = Especialidade_Médico.MédicoID
JOIN Especialidade ON Especialidade_Médico.EspecialidadeID = Especialidade.ID
WHERE DATEDIFF(Consulta.DataHora, Paciente.DataNascimento) / 365 < 18
  AND Especialidade.Nome != 'Pediatria'
ORDER BY Consulta.DataHora;

-- 9. Nome do paciente, nome do médico, data da internação e procedimentos das internações
--    realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”
SELECT Paciente.Nome AS NomePaciente, Médico.Nome AS NomeMédico, Internacao.DataEntrada, Internacao.Procedimento
FROM Internacao
JOIN Paciente ON Internacao.PacienteID = Paciente.ID
JOIN Médico ON Internacao.MédicoID = Médico.ID
JOIN Especialidade_Médico ON Médico.ID = Especialidade_Médico.MédicoID
JOIN Especialidade ON Especialidade_Médico.EspecialidadeID = Especialidade.ID
JOIN Quarto ON Internacao.QuartoID = Quarto.ID
WHERE Especialidade.Nome = 'Gastroenterologia' AND Quarto.ID IN (SELECT ID FROM Quarto WHERE TipoQuarto.Descricao = 'Enfermaria');

-- 10. Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou
SELECT Médico.Nome, Médico.DadosPessoais, COUNT(Consulta.ID) AS QuantidadeConsultas
FROM Médico
LEFT JOIN Consulta ON Médico.ID = Consulta.MédicoID
GROUP BY Médico.ID;

-- 11. Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação
--     e os números de internações referentes a esses profissionais
SELECT Enfermeiro.Nome, Enfermeiro.CRE, COUNT(InternacaoEnfermeiro.InternacaoID) AS QuantidadeInternacoes
FROM Enfermeiro
JOIN InternacaoEnfermeiro ON Enfermeiro.ID = InternacaoEnfermeiro.EnfermeiroID
GROUP BY Enfermeiro.ID
HAVING COUNT(InternacaoEnfermeiro.InternacaoID) > 1;

-- Consulta Extra 

-- Inserir novo médico especializado em Ginecologia
INSERT INTO Médico (Nome, DadosPessoais) VALUES ('Dra. Carolina Oliveira', 'CRM 11223');
INSERT INTO Especialidade_Médico (MédicoID, EspecialidadeID) VALUES (13, (SELECT ID FROM Especialidade WHERE Nome = 'Ginecologia'));

-- Inserir nova internação em enfermaria com participação do novo médico
INSERT INTO Internacao (DataEntrada, DataPrevAlta, Procedimento, PacienteID, MédicoID, QuartoID) VALUES ('2023-03-01 10:00:00', '2023-03-05 12:00:00', 'Exame Ginecológico', 1, 13, (SELECT ID FROM Quarto WHERE Numero = 101));
INSERT INTO QuartoInternacao (QuartoID, InternacaoID) VALUES ((SELECT ID FROM Quarto WHERE Numero = 101), LAST_INSERT_ID());
INSERT INTO InternacaoEnfermeiro (InternacaoID, EnfermeiroID) VALUES (LAST_INSERT_ID(), 1); -- Associar enfermeiro à nova internação

-- Consulta Extra (Item Adicional)
SELECT Paciente.Nome AS NomePaciente, Internacao.DataEntrada, Internacao.DataPrevAlta, Internacao.DataAlta, Internacao.Procedimento, Quarto.Numero AS NumeroQuarto, Médico.Nome AS NomeMédico
FROM Internacao
JOIN Paciente ON Internacao.PacienteID = Paciente.ID
JOIN QuartoInternacao ON Internacao.ID = QuartoInternacao.InternacaoID
JOIN Quarto ON QuartoInternacao.QuartoID = Quarto.ID
JOIN Médico ON Internacao.MédicoID = Médico.ID
JOIN Especialidade_Médico ON Médico.ID = Especialidade_Médico.MédicoID
JOIN Especialidade ON Especialidade_Médico.EspecialidadeID = Especialidade.ID
WHERE Especialidade.Nome = 'Ginecologia' AND Quarto.ID IN (SELECT ID FROM Quarto WHERE TipoQuarto.Descricao = 'Enfermaria');

