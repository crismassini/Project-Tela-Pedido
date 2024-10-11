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

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela wktech.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `PRODUTO_ID` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `VL_PRECOVENDA` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRODUTO_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Tabela que armazena os produtos';

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
