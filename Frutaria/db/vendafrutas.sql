-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/03/2026 às 21:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendafrutas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `IDaluno` int(5) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `IDcursos` int(5) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `IDdisciplina` int(5) NOT NULL,
  `IDcursos` int(5) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemaluno`
--

CREATE TABLE `itemaluno` (
  `IDitemaluno` int(5) NOT NULL,
  `IDaluno` int(5) DEFAULT NULL,
  `IDturma` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `IDprofessor` int(5) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `IDturma` int(5) NOT NULL,
  `IDdisciplina` int(5) DEFAULT NULL,
  `IDprofessor` int(5) DEFAULT NULL,
  `Ano` int(4) DEFAULT NULL,
  `Semestre` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`IDaluno`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`IDcursos`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`IDdisciplina`),
  ADD KEY `IDcursos` (`IDcursos`);

--
-- Índices de tabela `itemaluno`
--
ALTER TABLE `itemaluno`
  ADD PRIMARY KEY (`IDitemaluno`),
  ADD KEY `IDaluno` (`IDaluno`),
  ADD KEY `IDturma` (`IDturma`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`IDprofessor`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`IDturma`),
  ADD KEY `IDdisciplina` (`IDdisciplina`),
  ADD KEY `IDprofessor` (`IDprofessor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `IDaluno` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `IDcursos` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `IDdisciplina` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itemaluno`
--
ALTER TABLE `itemaluno`
  MODIFY `IDitemaluno` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `IDprofessor` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `IDturma` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`IDcursos`) REFERENCES `cursos` (`IDcursos`);

--
-- Restrições para tabelas `itemaluno`
--
ALTER TABLE `itemaluno`
  ADD CONSTRAINT `itemaluno_ibfk_1` FOREIGN KEY (`IDaluno`) REFERENCES `alunos` (`IDaluno`),
  ADD CONSTRAINT `itemaluno_ibfk_2` FOREIGN KEY (`IDturma`) REFERENCES `turma` (`IDturma`);

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`IDdisciplina`) REFERENCES `disciplina` (`IDdisciplina`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`IDprofessor`) REFERENCES `professor` (`IDprofessor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
