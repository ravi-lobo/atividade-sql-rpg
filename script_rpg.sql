-- ============================================================
-- PROJETO: Banco de Dados Jogo de RPG Online
-- ALUNO: Ravi Lobo Xavier Eugenio
-- ============================================================

-- 1. Criar o banco de dados
CREATE DATABASE RPG_Online;
GO

-- 2. Selecionar o banco de dados para uso
USE RPG_Online;
GO

-- 3. Criar a tabela USUARIOS
CREATE TABLE Usuarios (
    UsuarioId INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);
GO

-- 4. Criar a tabela CLASSES
CREATE TABLE Classes (
    ClasseId INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255)
);
GO

-- 5. Criar a tabela HABILIDADES
CREATE TABLE Habilidades (
    HabilidadeId INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL
);
GO

-- 6. Criar a tabela PERSONAGENS
-- Ela liga o Usuário ao Personagem (1:N) e a Classe ao Personagem (1:N)
CREATE TABLE Personagens (
    PersonagemId INT PRIMARY KEY IDENTITY(1,1),
    NomePersonagem VARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    
    -- Chaves Estrangeiras
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId)
);
GO

-- 7. Criar a tabela CLASSES_HABILIDADES (Tabela Associativa N:N)
-- Aqui a chave primária é composta por ClasseId + HabilidadeId
CREATE TABLE Classes_Habilidades (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    
    -- Chave Primária Composta
    PRIMARY KEY (ClasseId, HabilidadeId),
    
    -- Chaves Estrangeiras
    FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES Habilidades(HabilidadeId)
);
GO
