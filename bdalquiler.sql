-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3305
-- Tiempo de generación: 08-05-2023 a las 02:12:44
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdalquiler`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `ID_ALQUILER` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_USUARIO` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_AUTO` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ESTADO_ALQ` int NOT NULL,
  `FECHA_PRES` date NOT NULL,
  `FECHA_DEVO` date NOT NULL,
  `NUM_DIAS` int NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `MONTO` decimal(10,2) NOT NULL,
  `ENCARGADO` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`ID_ALQUILER`, `ID_USUARIO`, `ID_AUTO`, `ID_ESTADO_ALQ`, `FECHA_PRES`, `FECHA_DEVO`, `NUM_DIAS`, `PRECIO`, `MONTO`, `ENCARGADO`) VALUES
('A1872', 'USPRU', 'FCH62', 1, '2023-05-07', '2023-05-09', 2, '390.50', '781.00', 'USADM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

CREATE TABLE `autos` (
  `ID_AUTO` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_MARCA` int NOT NULL,
  `ID_TIPO` int NOT NULL,
  `ID_ESTADO` int NOT NULL,
  `MODELO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `ANIO` int NOT NULL,
  `CAPACIDAD` int NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `FOTO` longblob NOT NULL,
  `PLACA` char(7) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autos`
--

INSERT INTO `autos` (`ID_AUTO`, `ID_MARCA`, `ID_TIPO`, `ID_ESTADO`, `MODELO`, `ANIO`, `CAPACIDAD`, `PRECIO`, `FOTO`, `PLACA`) VALUES
('FCH62', 2, 6, 1, 'FIESTA', 2018, 4, '390.50', 0x464f544f4155544f, '2X1_H62');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_alquiler`
--

CREATE TABLE `estado_alquiler` (
  `ID_ESTADO_ALQUILER` int NOT NULL,
  `ESTADO` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_alquiler`
--

INSERT INTO `estado_alquiler` (`ID_ESTADO_ALQUILER`, `ESTADO`) VALUES
(2, 'ACEPTADO'),
(1, 'PENDIENTE'),
(3, 'RECHAZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_auto`
--

CREATE TABLE `estado_auto` (
  `ID_ESTADO` int NOT NULL,
  `ESTADO` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_auto`
--

INSERT INTO `estado_auto` (`ID_ESTADO`, `ESTADO`) VALUES
(1, 'DISPONIBLE'),
(3, 'OCUPADO'),
(2, 'PENDIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_auto`
--

CREATE TABLE `marca_auto` (
  `ID_MARCA` int NOT NULL,
  `NOMBRE_MARCA` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca_auto`
--

INSERT INTO `marca_auto` (`ID_MARCA`, `NOMBRE_MARCA`) VALUES
(7, 'BMW'),
(4, 'CHEVROLET'),
(2, 'FORD'),
(3, 'HONDA'),
(8, 'MERCEDES-BENZ'),
(5, 'NISSAN'),
(1, 'TOYOTA'),
(6, 'VOLKSWAGEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_auto`
--

CREATE TABLE `tipo_auto` (
  `ID_TIPO` int NOT NULL,
  `NOMBRE_TIPO` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_auto`
--

INSERT INTO `tipo_auto` (`ID_TIPO`, `NOMBRE_TIPO`) VALUES
(6, 'CAMIONETA'),
(2, 'COUPE'),
(7, 'DEPORTIVO'),
(8, 'FAMILIAR'),
(3, 'HATCHBACK'),
(5, 'PICKUP'),
(1, 'SEDÁN'),
(4, 'SUV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `ID_TIPO_USUARIO` int NOT NULL,
  `NOMBRE_TIPO_USUARIO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`ID_TIPO_USUARIO`, `NOMBRE_TIPO_USUARIO`) VALUES
(2, 'ADMINISTRADOR'),
(1, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `DNI` char(8) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMBRES` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `APELLIDO_PAT` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `APELLIDO_MAT` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `TELEFONO` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `DIRECCION` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `ID_TIPO_USUARIO` int NOT NULL,
  `USUARIO` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `CLAVE` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `DNI`, `NOMBRES`, `APELLIDO_PAT`, `APELLIDO_MAT`, `TELEFONO`, `DIRECCION`, `ID_TIPO_USUARIO`, `USUARIO`, `CLAVE`) VALUES
('USADM', '98765432', 'PRUEBAS ADMIN', 'ADMIN', 'ADMIN', '298765432', 'PRUEBA ADMINISTRADOR NR 2', 2, 'PRUEBAADMI', 'PRUEBAADMI'),
('USPRU', '12345678', 'PRUEBAS PRUEBAS', 'PRUEBA', 'PRUEBA', '123456789', 'PRUEBA NUEMERO 1', 1, 'PRUEBACLIENTE', 'PRUEBACLIENTE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`ID_ALQUILER`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_AUTO` (`ID_AUTO`),
  ADD KEY `ID_ESTADO_ALQ` (`ID_ESTADO_ALQ`),
  ADD KEY `ENCARGADO` (`ENCARGADO`);

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`ID_AUTO`),
  ADD UNIQUE KEY `PLACA` (`PLACA`),
  ADD KEY `ID_MARCA` (`ID_MARCA`),
  ADD KEY `ID_TIPO` (`ID_TIPO`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `estado_alquiler`
--
ALTER TABLE `estado_alquiler`
  ADD PRIMARY KEY (`ID_ESTADO_ALQUILER`),
  ADD UNIQUE KEY `UNIQUE_ESTALQ` (`ID_ESTADO_ALQUILER`),
  ADD UNIQUE KEY `UNIQUE_NOMESTALQ` (`ESTADO`);

--
-- Indices de la tabla `estado_auto`
--
ALTER TABLE `estado_auto`
  ADD PRIMARY KEY (`ID_ESTADO`),
  ADD UNIQUE KEY `UNIQUE_IDESTADO` (`ID_ESTADO`),
  ADD UNIQUE KEY `UNIQUE_ESTADO` (`ESTADO`);

--
-- Indices de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  ADD PRIMARY KEY (`ID_MARCA`),
  ADD UNIQUE KEY `UNIQUE_IDMARCA` (`ID_MARCA`),
  ADD UNIQUE KEY `UNIQUE_NOMMARCA` (`NOMBRE_MARCA`);

--
-- Indices de la tabla `tipo_auto`
--
ALTER TABLE `tipo_auto`
  ADD PRIMARY KEY (`ID_TIPO`),
  ADD UNIQUE KEY `UNIQUE_IDTIPO` (`ID_TIPO`),
  ADD UNIQUE KEY `UNIQUE_NOMTIP` (`NOMBRE_TIPO`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`ID_TIPO_USUARIO`),
  ADD UNIQUE KEY `UNIQUE_TIPOUSU` (`ID_TIPO_USUARIO`),
  ADD UNIQUE KEY `UNIQUE_NOMTIP` (`NOMBRE_TIPO_USUARIO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `ID_TIPO_USUARIO` (`ID_TIPO_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_alquiler`
--
ALTER TABLE `estado_alquiler`
  MODIFY `ID_ESTADO_ALQUILER` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_auto`
--
ALTER TABLE `estado_auto`
  MODIFY `ID_ESTADO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  MODIFY `ID_MARCA` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_auto`
--
ALTER TABLE `tipo_auto`
  MODIFY `ID_TIPO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `ID_TIPO_USUARIO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`),
  ADD CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`ID_AUTO`) REFERENCES `autos` (`ID_AUTO`),
  ADD CONSTRAINT `alquiler_ibfk_3` FOREIGN KEY (`ID_ESTADO_ALQ`) REFERENCES `estado_alquiler` (`ID_ESTADO_ALQUILER`),
  ADD CONSTRAINT `alquiler_ibfk_4` FOREIGN KEY (`ENCARGADO`) REFERENCES `usuarios` (`ID_USUARIO`);

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`ID_MARCA`) REFERENCES `marca_auto` (`ID_MARCA`),
  ADD CONSTRAINT `autos_ibfk_2` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipo_auto` (`ID_TIPO`),
  ADD CONSTRAINT `autos_ibfk_3` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado_auto` (`ID_ESTADO`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_TIPO_USUARIO`) REFERENCES `tipo_usuario` (`ID_TIPO_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
