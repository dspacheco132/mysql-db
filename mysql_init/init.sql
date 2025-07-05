-- Criação da base de dados
CREATE DATABASE IF NOT EXISTS latomais_db;
USE latomais_db;

-- Tabela Lavrador
CREATE TABLE IF NOT EXISTS Lavrador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL UNIQUE,
    morada VARCHAR(255) NOT NULL
);

-- Tabela PostoLeite
CREATE TABLE IF NOT EXISTS PostoLeite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(255) NOT NULL
);

-- Tabela Bonus (bónus por classificação)
CREATE TABLE IF NOT EXISTS Bonus (
    classificacao CHAR(1) PRIMARY KEY, -- A, B ou C
    percentagem_bonus DECIMAL(5,2) NOT NULL -- em percentagem, ex: 10.00 para 10%
);

-- Tabela PrecoLeite
CREATE TABLE IF NOT EXISTS PrecoLeite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria CHAR(1) NOT NULL, -- A, B, C
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    preco_base DECIMAL(5,2) NOT NULL
);

-- Tabela DepositoLeite (movimentos de depósito)
CREATE TABLE IF NOT EXISTS DepositoLeite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lavrador_id INT NOT NULL,
    posto_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    quantidade_litros DECIMAL(10,2) NOT NULL,
    classificacao CHAR(1) NOT NULL,
    FOREIGN KEY (lavrador_id) REFERENCES Lavrador(id),
    FOREIGN KEY (posto_id) REFERENCES PostoLeite(id)
);

-- Dados fictícios

INSERT INTO Lavrador (nome, nif, morada) VALUES
('João Silva', '123456789', 'Ribeira Grande'),
('Maria Costa', '987654321', 'Ponta Delgada'),
('Carlos Melo', '456789123', 'Vila Franca do Campo');

INSERT INTO PostoLeite (nome, localizacao) VALUES
('Posto Norte', 'Ribeira Grande'),
('Posto Centro', 'Ponta Delgada'),
('Posto Sul', 'Lagoa');

INSERT INTO Bonus (classificacao, percentagem_bonus) VALUES
('A', 10.00),
('B', 5.00),
('C', 0.00),
('D', 0.00);

INSERT INTO PrecoLeite (categoria, data_inicio, data_fim, preco_base) VALUES
('A', '2025-01-01', '2025-12-31', 1.00),
('B', '2025-01-01', '2025-12-31', 1.00),
('C', '2025-01-01', '2025-12-31', 1.00),
('D', '2025-01-01', '2025-12-31', 1.00);