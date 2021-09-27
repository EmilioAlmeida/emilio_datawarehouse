-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2021 a las 14:46:36
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `emilio_datawarehouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `channels`
--

CREATE TABLE `channels` (
  `channel_id` int(3) NOT NULL,
  `channel_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `channels`
--

INSERT INTO `channels` (`channel_id`, `channel_name`) VALUES
(1, 'Teléfono'),
(2, 'Whatsapp'),
(3, 'Instagram'),
(4, 'Facebook'),
(5, 'Linkedin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `city_id` int(5) NOT NULL,
  `country_id` int(3) NOT NULL,
  `city_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`city_id`, `country_id`, `city_name`) VALUES
(16, 6, 'New Orleans'),
(17, 7, 'Bruselas'),
(18, 7, 'Leuven'),
(21, 8, 'Barcelona'),
(22, 8, 'Madrid'),
(24, 8, 'Girona'),
(28, 11, 'México DF'),
(30, 11, 'Cancún'),
(31, 11, 'Acapulco'),
(32, 9, 'Toronto'),
(34, 9, 'Montreal'),
(35, 12, 'Córdoba'),
(36, 12, 'Corrientes'),
(37, 12, 'Junín'),
(39, 13, 'Cochabamba'),
(40, 13, 'La Paz'),
(41, 14, 'Bogotá'),
(43, 14, 'Medellín'),
(44, 15, 'Panamá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `company_id` int(3) NOT NULL,
  `company_name` varchar(64) NOT NULL,
  `city_id` int(3) NOT NULL,
  `address` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `city_id`, `address`, `email`, `telephone`) VALUES
(1, 'Juan Toselli', 35, 'Rivadeo 1263', 'info@juantoselli.com', '543514149600'),
(2, 'Riu Hotels', 24, 'Baleares 7810', 'recepcion@riuhoteles.com', '465224875'),
(3, 'AM Resorts', 17, 'Bv. Central 560', 'amresorts@amresorts.com', '452685572'),
(4, 'Hoteles Ocean', 24, 'Tramontana 740', 'hoteles@oceanhotels.com', '15268875'),
(5, 'Copa Airlines', 44, 'Av. Constitución 2545', 'copaescucha@copaairlines.com', '1542556857'),
(6, 'Masecor', 30, 'Concejal Cabiche 1216', 'info@masecor.com', '54351452687');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(3) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `city_id` int(5) NOT NULL,
  `company_id` int(3) NOT NULL,
  `position` varchar(32) NOT NULL,
  `interest` int(3) NOT NULL,
  `address` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`contact_id`, `firstname`, `lastname`, `email`, `city_id`, `company_id`, `position`, `interest`, `address`) VALUES
(1, 'Jose Luis', 'Marino', 'joseluis@masecor.com', 35, 4, 'Director', 80, 'Concejal Cabiche 1235'),
(2, 'Juan Bautista', 'Marioli', 'juanbmarioli@yahoo.com', 35, 6, 'Coordinador Ed. Fisica', 100, 'Humahuaca 1255'),
(3, 'Marcelo', 'Khans', 'importacioneskhans@gmail.com', 18, 1, 'Director', 75, 'Bv Los Alemanes 2540'),
(4, 'Lucio', 'Grinspan', 'luchog@gmail.com', 24, 3, 'CEO', 100, 'Av. Libertador 1260'),
(5, 'Pablo', 'Nasif', 'herreriaprofesional@gmail.com', 32, 2, 'Director / Titular', 85, 'Av Antartida Argentina 2463'),
(6, 'Daniel', 'Ulla', 'danielulla@gmail.com', 41, 5, 'Comercial', 70, 'Bv. Chacabuco 1864');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts_channels`
--

CREATE TABLE `contacts_channels` (
  `contact_id` int(3) NOT NULL,
  `channel_id` int(3) NOT NULL,
  `user_account` varchar(64) NOT NULL,
  `preference` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contacts_channels`
--

INSERT INTO `contacts_channels` (`contact_id`, `channel_id`, `user_account`, `preference`) VALUES
(0, 0, '', NULL),
(2, 1, '543514149617', 'Canal favorito'),
(3, 3, '@comercialcordoba', 'Sin Preferencia'),
(3, 5, 'https://www.linkedin.com/in/robertoramaciotti', 'Canal favorito'),
(4, 1, '54261526455', 'Canal favorito'),
(4, 4, 'https://www.facebook.com/herreromario', 'No molestar'),
(5, 1, '52465875542', 'Sin preferencia'),
(6, 2, '46255785422', 'Canal favorito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `country_id` int(3) NOT NULL,
  `region_id` int(3) NOT NULL,
  `country_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`country_id`, `region_id`, `country_name`) VALUES
(7, 3, 'Bélgica'),
(8, 3, 'España'),
(9, 6, 'Canadá'),
(10, 6, 'Estados Unidos'),
(11, 6, 'México'),
(12, 7, 'Argentina'),
(13, 7, 'Bolivia'),
(14, 7, 'Colombia'),
(15, 8, 'Panamá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE `regions` (
  `region_id` int(3) NOT NULL,
  `region_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO `regions` (`region_id`, `region_name`) VALUES
(3, 'Europa'),
(6, 'Norteamérica'),
(7, 'Sudamérica'),
(8, 'Centroamérica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(65) NOT NULL,
  `perfil` enum('Admin','Básico') NOT NULL DEFAULT 'Básico',
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `perfil`, `password`) VALUES
(1, 'Emilio', 'Almeida', 'almeida.emiliooscar@gmail.com', 'Admin', 'Password777'),
(2, 'Maitena', 'Palacio', 'maitenapalacio@hotmail.com', 'Básico', '810420'),
(4, 'Eduardo', 'Laguzzi', 'eduardolaguzzi@hotmail.com', 'Básico', 'pescafly'),
(5, 'Chiara', 'Lubich', 'chiara@focolare.org', 'Básico', 'somos1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`channel_id`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `cities_ibfk_1` (`country_id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indices de la tabla `contacts_channels`
--
ALTER TABLE `contacts_channels`
  ADD PRIMARY KEY (`contact_id`,`channel_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `countries_ibfk_1` (`region_id`);

--
-- Indices de la tabla `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`region_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `channels`
--
ALTER TABLE `channels`
  MODIFY `channel_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `regions`
--
ALTER TABLE `regions`
  MODIFY `region_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
