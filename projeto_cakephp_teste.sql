-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 16-Jan-2020 às 15:53
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_cakephp_teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

DROP TABLE IF EXISTS `contrato`;
CREATE TABLE IF NOT EXISTS `contrato` (
  `n_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `n_cliente` int(11) DEFAULT NULL,
  `data_inicio_contrato` date DEFAULT NULL,
  `vigencia_alternativa` int(11) DEFAULT NULL,
  `condicoes_comerciais` varchar(50) DEFAULT NULL,
  `observacoes` varchar(50) DEFAULT NULL,
  `primeiro_outorgante` blob,
  `segundo_outorgante` blob,
  PRIMARY KEY (`n_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`n_contrato`, `n_cliente`, `data_inicio_contrato`, `vigencia_alternativa`, `condicoes_comerciais`, `observacoes`, `primeiro_outorgante`, `segundo_outorgante`) VALUES
(1, 1, '2020-01-09', 5, '', '', NULL, NULL),
(2, 2, '2020-01-09', NULL, '', '', NULL, NULL),
(3, NULL, NULL, NULL, '', '', NULL, NULL),
(4, 2, NULL, NULL, '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `n_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `modo_pagamento` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`n_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`n_pagamento`, `modo_pagamento`) VALUES
(1, 'Paypal'),
(2, 'MBWAY');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentocontrato`
--

DROP TABLE IF EXISTS `pagamentocontrato`;
CREATE TABLE IF NOT EXISTS `pagamentocontrato` (
  `n_pagamento_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `n_pagamento` int(11) DEFAULT NULL,
  `n_contrato` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`n_pagamento_contrato`),
  KEY `n_pagamento` (`n_pagamento`),
  KEY `n_contrato` (`n_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=5455 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pagamentocontrato`
--

INSERT INTO `pagamentocontrato` (`n_pagamento_contrato`, `n_pagamento`, `n_contrato`, `valor`) VALUES
(1, 1, 1, 250),
(2, 1, 2, 200),
(3, 2, 2, 10000),
(5, 1, 1, 300);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentocontratoextern`
--

DROP TABLE IF EXISTS `pagamentocontratoextern`;
CREATE TABLE IF NOT EXISTS `pagamentocontratoextern` (
  `n_pagamento_contrato` int(11) NOT NULL,
  `n_pagamento` int(11) DEFAULT NULL,
  `n_contrato` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`n_pagamento_contrato`),
  KEY `n_pagamento` (`n_pagamento`),
  KEY `n_contrato` (`n_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pagamentocontratoextern`
--

INSERT INTO `pagamentocontratoextern` (`n_pagamento_contrato`, `n_pagamento`, `n_contrato`, `valor`) VALUES
(1, 2, 1, 200);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pagamentocontrato`
--
ALTER TABLE `pagamentocontrato`
  ADD CONSTRAINT `pagamentocontrato_ibfk_1` FOREIGN KEY (`n_pagamento`) REFERENCES `pagamento` (`n_pagamento`),
  ADD CONSTRAINT `pagamentocontrato_ibfk_2` FOREIGN KEY (`n_contrato`) REFERENCES `contrato` (`n_contrato`);

--
-- Limitadores para a tabela `pagamentocontratoextern`
--
ALTER TABLE `pagamentocontratoextern`
  ADD CONSTRAINT `pagamentocontratoextern_ibfk_1` FOREIGN KEY (`n_pagamento`) REFERENCES `pagamento` (`n_pagamento`),
  ADD CONSTRAINT `pagamentocontratoextern_ibfk_2` FOREIGN KEY (`n_contrato`) REFERENCES `contrato` (`n_contrato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
