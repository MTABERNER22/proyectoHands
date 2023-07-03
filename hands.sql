-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-06-2023 a las 19:23:01
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hands`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `subtitulo`, `cuerpo`) VALUES
(9, 'Productos no testeados en animales', 'Productos libres de sufrimiento animal', 'Los productos de Hands no están testeados en animales, ya que entendemos el impacto negativo que provocan al medio ambiente, además de que estamos en contra de todo tipo de violencia.'),
(10, 'Productos sin tacc', 'Productos sin tacc', 'La celiaquía se está volviendo en una de las enfermedades mas comúnes en nuetra sociedad. Y entendemos el daño que puede generarle a una persona que padece esta enfermedad, síntomas que van desde una inlafamación, vómitos y demás, al aplicar un producto con gluten en su piel. Por lo que tomamos la desición de que nuestros productos sean libres de toda contaminación de cruzada.'),
(11, 'Próximamente Nueva Socursal', 'Próximamente Nueva Socursal', 'Estamos contruyendo una nueva socursal en Av. Rivadavia al 57648.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tituloProducto` varchar(250) NOT NULL,
  `precioProducto` varchar(250) NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `tituloProducto`, `precioProducto`, `img_id`, `descripcion`) VALUES
(6, 'Agua Micelar', '$1850', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(5, 'Crema Humectante', '$1550', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(7, 'Kit Skin-Care', '$7850', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(8, 'Crema Anticelulitis', '$2450', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(9, 'Crema Anti-Edad', '$2350', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(10, 'Crema Hidratante', '$1250', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(11, 'Protector Solar', '$2650', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(20, 'Aerosol Solar', '$2150', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.'),
(35, 'Crema para quemaduras', '$1750', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas veritatis facere quidem explicabo nemo qui soluta iure illum! Perferendis dolorum obcaecati porro adipisci doloribus repellat quisquam modi et nesciunt odit. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo et, eos laborum porro quod aliquid laboriosam debitis molestias, aperiam quis totam doloremque, vero delectus mollitia minima a enim in provident.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'flavia', '81dc9bdb52d04dc20036dbd8313ed055'),
(6, 'matias', '827ccb0eea8a706c4c34a16891f84e7b'),
(7, 'matias22@hotmail.com', 'Abc123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
