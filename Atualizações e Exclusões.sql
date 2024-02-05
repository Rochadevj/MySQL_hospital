-- Parte 2: Atualizações e Exclusões
ALTER TABLE Médico ADD COLUMN EmAtividade BIT;

UPDATE Médico SET EmAtividade = 1 WHERE ID <= 2; -- Definir condição

UPDATE Internacao
SET DataAlta = DATE_ADD(DataEntrada, INTERVAL 3 DAY)
WHERE QuartoID IN (SELECT ID FROM Quarto WHERE Numero IN (70, 71));

SET @ConvenioID = (SELECT MAX(ID) FROM Convênio);

DELETE FROM Consulta WHERE ConvênioID = @ConvenioID;

DELETE FROM Convênio WHERE ID = @ConvenioID;

SELECT * FROM Médico;
SELECT * FROM Internacao;







