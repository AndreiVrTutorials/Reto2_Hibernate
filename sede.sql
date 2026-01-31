-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2026 a las 12:34:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sede`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE `entidades` (
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`nombre`) VALUES
('CONSEJERÍA EDUCACIÓN'),
('INSPECCIÓN EDUCATIVA BACHILLERATO'),
('INSPECCIÓN EDUCATIVA FP'),
('INSPECCIÓN EDUCATIVA INFANTIL'),
('INSPECCIÓN EDUCATIVA PRIMARIA'),
('INSPECCIÓN EDUCATIVA SECUNDARIA'),
('MINISTERIO DE EDUCACIÓN Y CIENCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `numero_registro` varchar(20) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `tramite` varchar(150) NOT NULL,
  `entidad` varchar(100) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`numero_registro`, `dni`, `nombre`, `apellidos`, `tramite`, `entidad`, `fecha`) VALUES
('REG-ANVR78L', '12345678L', 'ANDREI', 'VROTE', 'PRUEBA', 'INSPECCIÓN EDUCATIVA FP', '2026-01-27'),
('REG-MARO87L', '12645687L', 'MARCO', 'RODRIGUEZ', 'PRUEBA2', 'INSPECCIÓN EDUCATIVA INFANTIL', '2026-01-27'),
('REG-RUFE00A', '00000000A', 'RUTH', 'FERNANDEZ FERNANDEZ', 'BECA MEC FP', 'MINISTERIO DE EDUCACIÓN Y CIENCIA', '2026-01-29'),
('REG-SACA00L', '12345600L', 'SAMUEL', 'CARNERO', 'CCC', 'CONSEJERÍA EDUCACIÓN', '2026-01-29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`numero_registro`),
  ADD KEY `fk_registros_entidad` (`entidad`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `fk_registros_entidad` FOREIGN KEY (`entidad`) REFERENCES `entidades` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
