-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Nov-2020 às 17:45
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_pizzaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `idcardapio` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  `pizza_idpizza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `telefone`, `endereco`) VALUES
(1, 'dfgdfg', 'dfgdfgdff', 'gdfgdfg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL,
  `n_contrato` varchar(45) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idfuncionario`, `n_contrato`, `nome`, `funcao`, `telefone`) VALUES
(1, '000AP0000', 'Admim Master', 'admin', '000000000'),
(2, 'fgdfgdfgdf', 'fgdfg', 'dfgdfgdf', 'gdfgdfgd6');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `data_emissao` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `cardapio_idcardapio` int(11) NOT NULL,
  `cardapio_pizza_idpizza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza`
--

CREATE TABLE `pizza` (
  `idpizza` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `ingredientes` varchar(45) DEFAULT NULL,
  `tipo_pizza_idtipo_pizza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pizza`
--

INSERT INTO `pizza` (`idpizza`, `nome`, `ingredientes`, `tipo_pizza_idtipo_pizza`) VALUES
(3, 'Test', 'erwertw', 4),
(4, 'fgdfgdfgdfg', 'dfgdfgdfg', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pizza`
--

CREATE TABLE `tipo_pizza` (
  `idtipo_pizza` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `preco` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_pizza`
--

INSERT INTO `tipo_pizza` (`idtipo_pizza`, `tipo`, `preco`) VALUES
(4, 'Grande', '456.45,645'),
(5, 'Media', '4534,576');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `idutilizador` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `funcionario_idfuncionario` int(11) NOT NULL,
  `tp_user` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`idutilizador`, `email`, `senha`, `funcionario_idfuncionario`, `tp_user`) VALUES
(1, 'admin@master.com', 'admin', 1, 'admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`idcardapio`,`pizza_idpizza`),
  ADD UNIQUE KEY `idcardapio_UNIQUE` (`idcardapio`),
  ADD KEY `fk_cardapio_pizza1_idx` (`pizza_idpizza`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `idcliente_UNIQUE` (`idcliente`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfuncionario`),
  ADD UNIQUE KEY `idfuncionario_UNIQUE` (`idfuncionario`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`,`funcionario_idfuncionario`,`cliente_idcliente`,`cardapio_idcardapio`,`cardapio_pizza_idpizza`),
  ADD UNIQUE KEY `idpedido_UNIQUE` (`idpedido`),
  ADD KEY `fk_pedido_funcionario_idx` (`funcionario_idfuncionario`),
  ADD KEY `fk_pedido_cliente1_idx` (`cliente_idcliente`),
  ADD KEY `fk_pedido_cardapio1_idx` (`cardapio_idcardapio`,`cardapio_pizza_idpizza`);

--
-- Índices para tabela `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`idpizza`),
  ADD UNIQUE KEY `idpizza_UNIQUE` (`idpizza`),
  ADD KEY `fk_pizza_tipo_pizza1_idx` (`tipo_pizza_idtipo_pizza`);

--
-- Índices para tabela `tipo_pizza`
--
ALTER TABLE `tipo_pizza`
  ADD PRIMARY KEY (`idtipo_pizza`),
  ADD UNIQUE KEY `idtipo_pizza_UNIQUE` (`idtipo_pizza`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`idutilizador`,`funcionario_idfuncionario`),
  ADD UNIQUE KEY `idutilizador_UNIQUE` (`idutilizador`),
  ADD KEY `fk_utilizador_funcionario1_idx` (`funcionario_idfuncionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `idcardapio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pizza`
--
ALTER TABLE `pizza`
  MODIFY `idpizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_pizza`
--
ALTER TABLE `tipo_pizza`
  MODIFY `idtipo_pizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `idutilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD CONSTRAINT `fk_cardapio_pizza1` FOREIGN KEY (`pizza_idpizza`) REFERENCES `pizza` (`idpizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cardapio1` FOREIGN KEY (`cardapio_idcardapio`,`cardapio_pizza_idpizza`) REFERENCES `cardapio` (`idcardapio`, `pizza_idpizza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_funcionario` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `fk_pizza_tipo_pizza1` FOREIGN KEY (`tipo_pizza_idtipo_pizza`) REFERENCES `tipo_pizza` (`idtipo_pizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `fk_utilizador_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
