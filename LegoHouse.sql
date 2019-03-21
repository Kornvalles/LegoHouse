DROP SCHEMA IF EXISTS LegoHouse;

CREATE SCHEMA IF NOT EXISTS LegoHouse;
USE LegoHouse;

 CREATE TABLE IF NOT EXISTS `LegoHouse`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(90)  NOT NULL,
  `password` varchar(45)  NOT NULL,
  `role` varchar(20)  NOT NULL DEFAULT 'customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

CREATE TABLE IF NOT EXISTS `LegoHouse`.`orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idusers` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `isSent` boolean default false,
  PRIMARY KEY (`id`),
  KEY `id_users_FK_idx` (`idusers`),
  CONSTRAINT `id_users_FK` FOREIGN KEY (`idusers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `LegoHouse`.`users` (`email`, `password`, `role`)
VALUES ('admin@gmail.com', 'admin', 'employee');
