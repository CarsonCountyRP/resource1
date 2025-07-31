-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table vorpv2.player_ranch
CREATE TABLE IF NOT EXISTS `player_ranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `price` float DEFAULT NULL,
  `coords` longtext DEFAULT '[]',
  `owned` int(11) DEFAULT 0,
  `herdtrail` longtext DEFAULT '[]',
  `cattle` longtext DEFAULT '[]',
  `q_cattle` longtext DEFAULT '[]',
  `dist` int(11) DEFAULT NULL,
  `chores` longtext DEFAULT '[]',
  `cows` longtext DEFAULT '[]',
  `chickens` longtext DEFAULT '[]',
  `milk` int(11) DEFAULT 0,
  `eggs` int(11) DEFAULT 0,
  `ledger` float DEFAULT 0,
  `dog` varchar(50) DEFAULT '0',
  `q_ranch` int(11) DEFAULT 0,
  `repoed` int(11) DEFAULT 0,
  `herding` int(11) DEFAULT 0,
  `selling` int(11) DEFAULT 0,
  `milking` int(11) DEFAULT 0,
  `checking` int(11) DEFAULT 0,
  `tax` int(11) DEFAULT 0,
  `hired` longtext DEFAULT '[]',
  `webhook` longtext DEFAULT NULL COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('milk', 'Milk', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('egg', 'Egg', 20, 1, 'item_standard', 1);

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
