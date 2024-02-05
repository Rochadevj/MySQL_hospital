-- Criar banco de dados
CREATE DATABASE hospital_db_henrique;
USE hospital_db_henrique;

-- Criar tabela Médico
CREATE TABLE Médico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DadosPessoais VARCHAR(50)
);

-- Criar tabela Especialidade
CREATE TABLE Especialidade (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Criar tabela de relacionamento Especialidade_Médico
CREATE TABLE Especialidade_Médico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MédicoID INT,
    EspecialidadeID INT,
    FOREIGN KEY (MédicoID) REFERENCES Médico(ID),
    FOREIGN KEY (EspecialidadeID) REFERENCES Especialidade(ID)
);

-- Criar tabela Paciente
CREATE TABLE Paciente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DataNascimento DATE,
    Endereço VARCHAR(100),
    Telefone VARCHAR(25),
    Email VARCHAR(50),
    CPF VARCHAR(14) UNIQUE,
    RG VARCHAR(20) UNIQUE
);

-- Criar tabela Convênio
CREATE TABLE Convênio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(14) UNIQUE,
    TempoCarência INT
);

-- Criar tabela Consulta
CREATE TABLE Consulta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    MédicoID VARCHAR(45),
    PacienteID VARCHAR(45),
    Valor DECIMAL(10, 2),
    ConvênioID VARCHAR(45),
    NúmeroCarteira VARCHAR(25),
    FOREIGN KEY (MédicoID) REFERENCES Médico(ID),
    FOREIGN KEY (PacienteID) REFERENCES Paciente(ID),
    FOREIGN KEY (ConvênioID) REFERENCES Convênio(ID)
);

-- Criar tabela Receita
CREATE TABLE Receita (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultaID INT,
    Medicamentos VARCHAR(45),
    Quantidade VARCHAR(45),
    InstruçõesUso VARCHAR(45),
    FOREIGN KEY (ConsultaID) REFERENCES Consulta(ID)
);

-- ...

-- Criar tabela Quarto
CREATE TABLE Quarto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Numero INT NOT NULL
);

-- Criar tabela Internação
CREATE TABLE Internacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DataEntrada DATETIME NOT NULL,
    DataPrevAlta DATETIME,
    DataAlta DATETIME,
    Procedimento VARCHAR(100),
    PacienteID INT,
    MédicoID INT,
    QuartoID INT,
    FOREIGN KEY (PacienteID) REFERENCES Paciente(ID),
    FOREIGN KEY (MédicoID) REFERENCES Médico(ID),
    FOREIGN KEY (QuartoID) REFERENCES Quarto(ID)
);

-- Criar tabela Enfermeiro
CREATE TABLE Enfermeiro (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    CRE VARCHAR(20) UNIQUE
);

-- Criar tabela TipoQuarto
CREATE TABLE TipoQuarto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ValorDiaria DECIMAL(10, 2) NOT NULL,
    Descricao VARCHAR(100)
);

-- Criar tabela Relacionamento entre Quarto e Internação (muitos-para-muitos)
CREATE TABLE QuartoInternacao (
    QuartoID INT,
    InternacaoID INT,
    PRIMARY KEY (QuartoID, InternacaoID),
    FOREIGN KEY (QuartoID) REFERENCES Quarto(ID),
    FOREIGN KEY (InternacaoID) REFERENCES Internacao(ID)
);

-- Criar tabela Relacionamento entre Internação e Enfermeiro (muitos-para-muitos)
CREATE TABLE InternacaoEnfermeiro (
    InternacaoID INT,
    EnfermeiroID INT,
    PRIMARY KEY (InternacaoID, EnfermeiroID),
    FOREIGN KEY (InternacaoID) REFERENCES Internacao(ID),
    FOREIGN KEY (EnfermeiroID) REFERENCES Enfermeiro(ID)
);

-- Nota: Cada internação está associada a um paciente e a um médico através das chaves estrangeiras em Internação.

