-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Author: PhysComp
-- Project: QR-Konsum
-- https://github.com/Phys-Comp/HackTheSummer
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Product_Database`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Intolerance_Icons`
--

CREATE TABLE `Intolerance_Icons` (
  `id` text NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Intolerance_Icons`
--

INSERT INTO `Intolerance_Icons` (`id`, `name`, `url`) VALUES
('apple', 'Apfel', 'https://visualpharm.com/assets/221/No%20Apple-595b40b85ba036ed117da6e7.svg'),
('celery', 'Selerie', 'https://visualpharm.com/assets/857/No%20Celery-595b40b85ba036ed117da6ef.svg'),
('crustaceans', 'Krustentiere', 'https://visualpharm.com/assets/322/No%20Crustaceans-595b40b85ba036ed117da6f3.svg'),
('eggs', 'Ei', 'https://visualpharm.com/assets/745/No%20Eggs-595b40b85ba036ed117da6f7.svg'),
('fish', 'Fisch', 'https://visualpharm.com/assets/225/No%20Fish-595b40b85ba036ed117da6fa.svg'),
('fructose', 'Fruchtzucker', 'https://visualpharm.com/assets/642/No%20Fructose-595b40b85ba036ed117da6fc.svg'),
('gluten', 'Gluten', 'https://visualpharm.com/assets/386/No%20Gluten-595b40b85ba036ed117da6fd.svg'),
('lupines', 'Lupinen', 'https://visualpharm.com/assets/622/No%20Lupines-595b40b85ba036ed117da702.svg'),
('lactose', 'Laktose', 'https://visualpharm.com/assets/265/No%20Milk-595b40b85ba036ed117da704.svg'),
('mustard', 'Senf', 'https://visualpharm.com/assets/538/No%20Mustard-595b40b85ba036ed117da706.svg'),
('hazelnuts', 'Haselnüsse', 'https://visualpharm.com/assets/739/No%20Nuts-595b40b85ba036ed117da707.svg'),
('peanuts', 'Erdnüsse', 'https://visualpharm.com/assets/471/No%20Peanut-595b40b85ba036ed117da70b.svg'),
('sesame', 'Sesam', 'https://visualpharm.com/assets/243/No%20Sesame-595b40b85ba036ed117da712.svg'),
('shellfish', 'Schalentiere', 'https://visualpharm.com/assets/71/No%20Shellfish-595b40b85ba036ed117da713.svg'),
('soi', 'Soja', 'https://visualpharm.com/assets/115/No%20Soy-595b40b85ba036ed117da716.svg'),
('sugar', 'Zucker', 'https://visualpharm.com/assets/35/No%20Sugar-595b40b85ba036ed117da717.svg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Products`
--

CREATE TABLE `Products` (
  `id` text NOT NULL,
  `class` text NOT NULL,
  `name` text NOT NULL,
  `company` text NOT NULL,
  `description` text NOT NULL,
  `category` text NOT NULL,
  `url` text NOT NULL,
  `image_url` text NOT NULL,
  `rating` double NOT NULL,
  `main_origin` text NOT NULL,
  `sub_origins` text NOT NULL,
  `path` text NOT NULL,
  `country` text NOT NULL,
  `transport_distance` double NOT NULL,
  `fuel_consumption` double NOT NULL,
  `seals` text NOT NULL,
  `electric_consumption` double NOT NULL,
  `water_consumption` double NOT NULL,
  `co2_footprint` double NOT NULL,
  `poverty_rate` double NOT NULL,
  `worker_satisfaction` double NOT NULL,
  `salary` double NOT NULL,
  `ingredients` text NOT NULL,
  `intolerances` text NOT NULL,
  `nutrition_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Products`
--

INSERT INTO `Products` (`id`, `class`, `name`, `company`, `description`, `category`, `url`, `image_url`, `rating`, `main_origin`, `sub_origins`, `path`, `country`, `transport_distance`, `fuel_consumption`, `seals`, `electric_consumption`, `water_consumption`, `co2_footprint`, `poverty_rate`, `worker_satisfaction`, `salary`, `ingredients`, `intolerances`, `nutrition_info`) VALUES
('D4tuI70lMr77u3Fl', 'food', 'Nocciola', 'Federico', 'Nocciola ist eine Haselnuss-Nougat-Creme für den Brotaufstrich.', 'Lebensmittel', 'https://www.federico.com', '/images/products/Nocciola.jpg', 2.47, '{\"name\": \"Produktion\", \"lat\": -21.782343, \"lon\": -46.446303}', '[\r\n	{\"name\": \"Kakao\", \"lat\": -0.229455, \"lon\": -78.420349},\r\n	{\"name\": \"Kakao\", \"lat\": -16.4144447, \"lon\": -71.524563},\r\n	{\"name\": \"Haselnüsse\", \"lat\": 44.437661, \"lon\": 8.934697},\r\n	{\"name\": \"Zucker\", \"lat\": -25.975093, \"lon\": 27.722016},\r\n	{\"name\": \"Verpackung\", \"lat\": 49.548957, \"lon\": 0.966183},\r\n	{\"name\": \"Vertrieb\", \"lat\": 50.121843, \"lon\": 8.675541}\r\n]', '[\r\n	{\"lat\": 44.437661, \"lon\": 8.934697},\r\n	{\"lat\": -21.782343, \"lon\": -46.446303},\r\n	{\"lat\": 49.548957, \"lon\": 0.966183},\r\n	{\"lat\": 50.121843, \"lon\": 8.675541}\r\n]', 'Brasilien', 28982, 8694, '[\r\n	{\"name\": \"EU Bio\", \"url\": \"https://upload.wikimedia.org/wikipedia/commons/2/25/Organic-Logo.svg\"},\r\n	{\"name\": \"Bioland\", \"url\": \"https://upload.wikimedia.org/wikipedia/commons/9/99/Bioland_Logo_2012.svg\"},\r\n	{\"name\": \"Fairtrade\", \"url\": \"https://upload.wikimedia.org/wikipedia/commons/8/8e/FairTrade-Logo.svg\"},\r\n	{\"name\": \"UTZ Certified\", \"url\": \"https://upload.wikimedia.org/wikipedia/commons/3/3b/Utz_certified_logo.svg\"}\r\n]', 9543, 3496, 335.57, 4.8, 38.4, 5.79, 'Zucker, Palmöl, HASELNÜSSE, MAGERMILCHPULVER, fettarmes Kakaopulver, Emulgator Lecithine (SOJA), Vanillin', '[\"no_apple\", \"no_celery\", \"no_crustaceans\", \"no_eggs\", \"no_fish\", \"fructose\", \"no_gluten\", \"no_lupines\", \"lactose\", \"no_mustard\", \"hazelnuts\", \"no_sesame\", \"no_shellfish\", \"soi\", \"sugar\"]', '[{\"name\": \"Energie\", \"value\": 2302}, {\"name\": \"Fett\", \"value\": 32.1}, {\"name\": \"gesättigte Fettsäuren\", \"value\": 11.2}, {\"name\": \"Kohlenhydrate\", \"value\": 58.5}, {\"name\": \"Zucker\", \"value\": 57.7}, {\"name\": \"Eiweiß\", \"value\": 5.8}, {\"name\": \"Salz\", \"value\": 0.093}]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
