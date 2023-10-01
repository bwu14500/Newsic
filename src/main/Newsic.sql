DROP DATABASE IF EXISTS Newsic; CREATE DATABASE Newsic;
USE Newsic;
CREATE TABLE `newsic_Users` (
  `email` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `newsic_Posts` (
  `time` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `track` varchar(500) NOT NULL,
  `collection` varchar(500) NOT NULL,
   `url` varchar(500) NOT NULL,
`artUrl` varchar(500) NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`time`),
  UNIQUE KEY `time_UNIQUE` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `newsic_Playlists` (
  `time` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `track` varchar(500) NOT NULL,
  `collection` varchar(500) NOT NULL,
   `url` varchar(500) NOT NULL,
`artUrl` varchar(500) NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`time`),
  UNIQUE KEY `time_UNIQUE` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;