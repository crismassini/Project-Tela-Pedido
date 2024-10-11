-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.39 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para wktech
CREATE DATABASE IF NOT EXISTS `wktech` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wktech`;

-- Copiando estrutura para tabela wktech.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `CLIENTE_ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `CIDADE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `UF` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`CLIENTE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela wktech.cliente: ~20 rows (aproximadamente)
INSERT INTO `cliente` (`CLIENTE_ID`, `NOME`, `CIDADE`, `UF`) VALUES
	(1, 'CLIENTE1', 'GUARULHOS', 'SP'),
	(2, 'CLIENTE2', 'GUARULHOS', 'SP'),
	(3, 'CLIENTE3', 'GUARULHOS', 'SP'),
	(4, 'CLIENTE4', 'GUARULHOS', 'SP'),
	(5, 'CLIENTE5', 'GUARULHOS', 'SP'),
	(6, 'CLIENTE6', 'GUARULHOS', 'SP'),
	(7, 'CLIENTE7', 'GUARULHOS', 'SP'),
	(8, 'CLIENTE8', 'GUARULHOS', 'SP'),
	(9, 'CLIENTE9', 'GUARULHOS', 'SP'),
	(10, 'CLIENTE10', 'GUARULHOS', 'SP'),
	(11, 'CLIENTE11', 'GUARULHOS', 'SP'),
	(12, 'CLIENTE12', 'GUARULHOS', 'SP'),
	(13, 'CLIENTE13', 'GUARULHOS', 'SP'),
	(14, 'CLIENTE14', 'GUARULHOS', 'SP'),
	(15, 'CLIENTE15', 'GUARULHOS', 'SP'),
	(16, 'CLIENTE16', 'GUARULHOS', 'SP'),
	(17, 'CLIENTE17', 'GUARULHOS', 'SP'),
	(18, 'CLIENTE18', 'GUARULHOS', 'SP'),
	(19, 'CLIENTE19', 'GUARULHOS', 'SP'),
	(20, 'CLIENTE20', 'GUARULHOS', 'SP');

-- Copiando estrutura para tabela wktech.pedidovenda
CREATE TABLE IF NOT EXISTS `pedidovenda` (
  `NUMEROPEDIDO` int NOT NULL AUTO_INCREMENT,
  `DATAEMISSAO` datetime NOT NULL,
  `CLIENTE_ID` int NOT NULL DEFAULT (0),
  `VALORTOTAL` float NOT NULL DEFAULT (0),
  PRIMARY KEY (`NUMEROPEDIDO`),
  KEY `FK_pedidovenda_cliente` (`CLIENTE_ID`),
  CONSTRAINT `FK_pedidovenda_cliente` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `cliente` (`CLIENTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tabela que armazena os pedidos de venda';

-- Copiando dados para a tabela wktech.pedidovenda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela wktech.pedidovendaitem
CREATE TABLE IF NOT EXISTS `pedidovendaitem` (
  `PEDIDOVENDAITEM_ID` int NOT NULL AUTO_INCREMENT,
  `NUMEROPEDIDO` int NOT NULL DEFAULT '0',
  `PRODUTO_ID` int NOT NULL DEFAULT '0',
  `QUANTIDADE` int NOT NULL DEFAULT '0',
  `PRECOVENDA` float NOT NULL DEFAULT (0),
  `VALORTOTAL` float NOT NULL DEFAULT (0),
  PRIMARY KEY (`PEDIDOVENDAITEM_ID`),
  KEY `FK__pedidovenda` (`NUMEROPEDIDO`),
  KEY `FK__produto` (`PRODUTO_ID`),
  CONSTRAINT `FK__pedidovenda` FOREIGN KEY (`NUMEROPEDIDO`) REFERENCES `pedidovenda` (`NUMEROPEDIDO`),
  CONSTRAINT `FK__produto` FOREIGN KEY (`PRODUTO_ID`) REFERENCES `produto` (`PRODUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tabela que armazena os itens dos pedidos de venda';

-- Copiando dados para a tabela wktech.pedidovendaitem: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela wktech.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `PRODUTO_ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `VL_PRECOVENDA` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRODUTO_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Tabela que armazena os produtos';

-- Copiando dados para a tabela wktech.produto: ~20 rows (aproximadamente)
INSERT INTO `produto` (`PRODUTO_ID`, `DESCRICAO`, `VL_PRECOVENDA`) VALUES
	(1, 'PRODUTO1', 1),
	(2, 'PRODUTO2', 2),
	(3, 'PRODUTO3', 3),
	(4, 'PRODUTO4', 4),
	(5, 'PRODUTO5', 5),
	(6, 'PRODUTO6', 6),
	(7, 'PRODUTO7', 7),
	(8, 'PRODUTO8', 8),
	(9, 'PRODUTO9', 9),
	(10, 'PRODUTO10', 10),
	(11, 'PRODUTO11', 11),
	(12, 'PRODUTO12', 12),
	(13, 'PRODUTO13', 13),
	(14, 'PRODUTO14', 14),
	(15, 'PRODUTO15', 15),
	(16, 'PRODUTO16', 16),
	(17, 'PRODUTO17', 17),
	(18, 'PRODUTO18', 18),
	(19, 'PRODUTO19', 19),
	(20, 'PRODUTO20', 20);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
