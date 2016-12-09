-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 09 Décembre 2016 à 23:30
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `todolist`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id_category` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id_category`, `name`) VALUES
(1, 'Jeux Vidéos'),
(2, 'Dawin'),
(3, 'Taches ménagères');

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `id_task` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `beginningDate` date NOT NULL,
  `endingDate` date DEFAULT NULL,
  `plannedEndingDate` date NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `task`
--

INSERT INTO `task` (`id_task`, `label`, `beginningDate`, `endingDate`, `plannedEndingDate`, `id_category`, `id_user`) VALUES
(11, 'Faire le JEE (very complicated)', '2016-11-01', NULL, '2016-12-09', 2, 1),
(12, 'Passer lvl 80 sur Battlefield 1 (jeu de qualité supérieur)', '2016-12-01', NULL, '2016-12-31', 1, 1),
(14, 'Vivre (longtemps si possible)', '1996-08-26', NULL, '2242-12-23', 3, 1),
(16, 'Ne pas rappeler mon ex', '2016-12-01', NULL, '2948-01-18', 1, 3),
(18, 'Faire un MLG edit de la video du cours de com', '2016-12-01', NULL, '2016-12-24', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `surname` varchar(250) COLLATE utf8_bin NOT NULL,
  `USER_TYPE` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `name`, `surname`, `USER_TYPE`) VALUES
(1, 'Théau Goncalves', 'Antiheros du JEE', 'USER_FREE'),
(3, 'Meidi Airouche', 'Le chef à nous', 'USER_FREE');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
