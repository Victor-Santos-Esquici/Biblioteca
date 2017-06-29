-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Jun-2017 às 05:56
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `codMatricula` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `situacao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`codMatricula`, `nome`, `sobrenome`, `email`, `endereco`, `situacao`) VALUES
(1, 'Maria', 'Paula', 'maria_paula@email.com', 'Assis Brasil, 110', 1),
(2, 'Mauro', 'Eduardo', 'mauro_eduardo@email.com', 'Carlos Gomes, 150', 1),
(3, 'Joao', 'Gilberto', 'joao_gilberto@email.com', 'Andradas, 1200', 0),
(4, 'Paulo', 'Gomes', 'paulo_gomes@email.com', 'Jose do Patrocinio, 500', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bibliotecas`
--

CREATE TABLE `bibliotecas` (
  `codBib` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bibliotecas`
--

INSERT INTO `bibliotecas` (`codBib`, `nome`, `endereco`) VALUES
(1, 'Biblioteca Municipal de Canoas', 'XV de Janeiro, 270');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `codCategoria` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`codCategoria`, `descricao`) VALUES
(1, 'Ficcao'),
(2, 'Romance'),
(3, 'Literatura'),
(4, 'Cientifico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresta`
--

CREATE TABLE `empresta` (
  `id` int(11) NOT NULL,
  `codMatricula` int(11) NOT NULL,
  `codLivro` int(11) NOT NULL,
  `dataRetirada` date NOT NULL,
  `dataPrevisao` date NOT NULL,
  `dataEntrega` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresta`
--

INSERT INTO `empresta` (`id`, `codMatricula`, `codLivro`, `dataRetirada`, `dataPrevisao`, `dataEntrega`) VALUES
(1, 3, 1, '2016-11-10', '2016-11-20', '2016-11-20'),
(2, 3, 2, '2016-11-10', '2016-11-20', '2016-11-18'),
(3, 3, 1, '2016-11-11', '2016-11-21', '2016-11-14'),
(4, 3, 5, '2016-11-21', '2016-02-01', '2016-12-24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `codFunc` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `salario` varchar(15) NOT NULL,
  `codBib` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`codFunc`, `nome`, `sobrenome`, `email`, `endereco`, `telefone`, `salario`, `codBib`) VALUES
(1, 'Marta', 'Soares', 'marta@marta.com', 'Silva So, 350', '123456', '150.00', 1),
(2, 'Paula', 'Silva', 'paula@paula.com', 'Dom Pedro II, 200', '890123', '450.00', 1),
(3, 'Carlos', 'Andrades', 'carlos@carlos.com', 'Ipiranga, 700', '456789', '300.00', 1),
(4, 'Jonas', 'Souza', 'jonas@jonas.com', 'Protasio Alves, 450', '1234567', '450.00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `codLivro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `editora` varchar(50) NOT NULL,
  `valor` varchar(15) NOT NULL,
  `codCategoria` int(11) NOT NULL,
  `codBib` int(11) NOT NULL,
  `situacao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`codLivro`, `titulo`, `editora`, `valor`, `codCategoria`, `codBib`, `situacao`) VALUES
(1, 'Senhor dos Aneis', 'XYZ', '75.00', 2, 1, 1),
(2, 'Harry Potter', 'XYZ', '35.00', 2, 1, 1),
(3, 'O Cortico', 'ABC', '50.00', 3, 1, 1),
(4, 'Aprenda Quimica', 'DEF', '70.00', 4, 1, 1),
(5, 'Outro Lado da Meia Noite', 'FGH', '80.00', 4, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`codMatricula`);

--
-- Indexes for table `bibliotecas`
--
ALTER TABLE `bibliotecas`
  ADD PRIMARY KEY (`codBib`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codCategoria`);

--
-- Indexes for table `empresta`
--
ALTER TABLE `empresta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codLivro` (`codLivro`),
  ADD KEY `codMatricula` (`codMatricula`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`codFunc`),
  ADD KEY `codBib` (`codBib`);

--
-- Indexes for table `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`codLivro`),
  ADD KEY `codCategoria` (`codCategoria`),
  ADD KEY `codBib` (`codBib`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `codMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bibliotecas`
--
ALTER TABLE `bibliotecas`
  MODIFY `codBib` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `empresta`
--
ALTER TABLE `empresta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
  MODIFY `codLivro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `empresta`
--
ALTER TABLE `empresta`
  ADD CONSTRAINT `empresta_ibfk_1` FOREIGN KEY (`codLivro`) REFERENCES `livros` (`codLivro`),
  ADD CONSTRAINT `empresta_ibfk_2` FOREIGN KEY (`codMatricula`) REFERENCES `alunos` (`codMatricula`);

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`codBib`) REFERENCES `bibliotecas` (`codBib`);

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`codCategoria`) REFERENCES `categorias` (`codCategoria`),
  ADD CONSTRAINT `livros_ibfk_2` FOREIGN KEY (`codBib`) REFERENCES `bibliotecas` (`codBib`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
