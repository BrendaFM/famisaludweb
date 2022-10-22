/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.24-MariaDB : Database - famisalud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`famisalud` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `famisalud`;

/*Table structure for table `blogs` */

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `idblog` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `tituloblog` varchar(70) NOT NULL,
  `infoblog` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  PRIMARY KEY (`idblog`),
  KEY `fk_idsede_bl` (`idsede`),
  CONSTRAINT `fk_idsede_bl` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `blogs` */

/*Table structure for table `campanas` */

DROP TABLE IF EXISTS `campanas`;

CREATE TABLE `campanas` (
  `idcampana` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `titulocampana` varchar(70) NOT NULL,
  `infocampana` text NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  PRIMARY KEY (`idcampana`),
  KEY `fk_idsede_cmp` (`idsede`),
  CONSTRAINT `fk_idsede_cmp` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `campanas` */

/*Table structure for table `carousel` */

DROP TABLE IF EXISTS `carousel`;

CREATE TABLE `carousel` (
  `idcarousel` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `fecharegistro` date NOT NULL,
  PRIMARY KEY (`idcarousel`),
  KEY `fk_idusuario_car` (`idusuario`),
  CONSTRAINT `fk_idusuario_car` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carousel` */

insert  into `carousel`(`idcarousel`,`idusuario`,`foto`,`fecharegistro`) values 
(18,7,'2022102207729.jpg','2022-10-22'),
(19,7,'2022102207750.jpg','2022-10-22');

/*Table structure for table `carouseldet` */

DROP TABLE IF EXISTS `carouseldet`;

CREATE TABLE `carouseldet` (
  `idcarouseldet` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `tipo` char(1) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idcarouseldet`),
  KEY `fk_idsede_card` (`idsede`),
  CONSTRAINT `fk_idsede_card` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carouseldet` */

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `categoria` varchar(70) NOT NULL,
  `fecha` date NOT NULL,
  `estado` char(1) NOT NULL,
  `estadoh` char(1) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `uk_categoria_cat` (`categoria`,`idsede`),
  KEY `fk_idsede_cat` (`idsede`),
  CONSTRAINT `fk_idsede_cat` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`idsede`,`categoria`,`fecha`,`estado`,`estadoh`) values 
(8,7,'Servicios','2022-10-22','A','A');

/*Table structure for table `especialidades` */

DROP TABLE IF EXISTS `especialidades`;

CREATE TABLE `especialidades` (
  `idespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `especialidad` varchar(30) NOT NULL,
  `informacion` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `fotografia2` varchar(100) DEFAULT NULL,
  `horario` varchar(30) DEFAULT NULL,
  `horario2` varchar(30) DEFAULT NULL,
  `estadoespecialidad` char(1) NOT NULL,
  PRIMARY KEY (`idespecialidad`),
  UNIQUE KEY `uk_especialidad_esp` (`especialidad`,`idsede`),
  KEY `fk_idsede_esp` (`idsede`),
  CONSTRAINT `fk_idsede_esp` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialidades` */

insert  into `especialidades`(`idespecialidad`,`idsede`,`especialidad`,`informacion`,`fotografia`,`fotografia2`,`horario`,`horario2`,`estadoespecialidad`) values 
(16,7,'MEDICINA INTERNA','Es una especialidad médica que atiende integralmente los problemas de salud en pacientes adultos, ingresados en un centro hospitalario o en consultas ambulatorias.','2022102207745.jpg',NULL,'Lunes a Viernes: 7am a 7pm','Sábado: 7am a 1pm','A'),
(17,7,'GINECOLOGÍA','Ocupa de la mujer en todo su periodo fértil, es la subespecialidad médica y quirúrgica que trata las enfermedades del sistema reproductor femenino.','2022102207700.jpg',NULL,'Lunes a Viernes: 7am a 7pm','','A'),
(18,7,'PEDIATRÍA','Especialidad médica y es la rama de la medicina que involucra la atención médica de bebés, niños y adolescentes, abarca desde el nacimiento hasta que el niño llegue a la adolescencia','2022102208846.jpg',NULL,'Martes: 4pm a 6pm','Miércoles: 3pm a 6pm','A'),
(19,7,'TRAUMATOLOGÍA','La traumatología es la rama de la medicina que se dedica al estudio de las lesiones del aparato locomotor. La especialidad es médico-quirúrgica, y los médicos que la practican se llaman traumatólogos.','2022102208806.jpg',NULL,'Jueves: 3pm a 4:30 pm','','A'),
(20,7,'GASTROENTEROLOGÍA','Es la especialidad médica que se ocupa de las enfermedades del aparato digestivo y órganos asociados, conformado por: esófago, estómago, hígado y vías biliares, páncreas, intestino delgado, colon y re','2022102208851.jpg',NULL,'Martes: 8:30am a 1:30pm','Miércoles y Jueves: 4pm a 7pm','A'),
(21,7,'NUTRICIÓN','Se encarga de crear y desarrollar planes de alimentación, orientar al usuario sobre cómo adoptar hábitos alimentarios saludables y recetar dietas destinadas a solventar unas necesidades.','2022102208857.jpg',NULL,'Lunes a Viernes:  7am a 7pm','Sábados:  7am a 1pm','A'),
(22,7,'CIRUGÍA GENERAL','Aborda todas aquellas patologías del aparato digestivo, sistema endocrino, órganos intraabdominales y pared abdominal que requieren de una intervención quirúrgica.','2022102208846.jpg',NULL,'Martes a Jueves: 7am a 7pm','','A'),
(23,7,'PSIQUIATRÍA','Se dedica al estudio y promoción de la salud mental, así como al diagnóstico y tratamiento de los trastornos mentales.','2022102208815.jpg',NULL,'Lunes a Viernes: 7am a 7pm','Sábado de 7am a 1pm','A'),
(24,7,'OFTAMOLOGÍA','La Oftalmología ​​ es la especialidad médica que estudia las enfermedades de ojo y su tratamiento, incluyendo el globo ocular, su musculatura, el sistema lagrimal y los párpados. Las personas dedicada','2022102208823.jpg',NULL,'Jueves: 4:30pm a 8:30pm','','A'),
(25,7,'NEUROLOGÍA','Especialidad médica que estudia la estructura, función y desarrollo del sistema nervioso y muscular en estado normal y patológico,.','2022102208828.jpg',NULL,'Jueves: 4pm a 7pm','','A'),
(26,7,'NEUMOLOGÍA','Es la especialidad médica encargada del estudio de las enfermedades del aparato respiratorio y centra su campo de actuación en el diagnóstico, tratamiento y prevención de las enfermedades del pulmón, ','2022102208805.jpg',NULL,'Jueves: 8:30 am a 12:30 m','','A'),
(27,7,'OBSTETRICIA','Se especializa en la atención de las mujeres durante el embarazo y el parto, y en el diagnóstico y tratamiento de enfermedades de los órganos reproductivos femeninos.','2022102208857.jpg',NULL,'Lunes: 7am a 7pm','Miércoles y Viernes: 7am a 7pm','A'),
(28,7,'MEDICINA GENERAL','La medicina general constituye el primer nivel de atención médica y es imprescindible para la prevención, detección, tratamiento y seguimiento de las enfermedades crónicas estabilizadas, responsabiliz','2022102208820.jpg',NULL,'Lunes a Domingo: 24 HORAS','','A');

/*Table structure for table `horariocategoria` */

DROP TABLE IF EXISTS `horariocategoria`;

CREATE TABLE `horariocategoria` (
  `idhorarioc` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `titulohorario` varchar(70) NOT NULL,
  `horario1` varchar(70) NOT NULL,
  `horario2` varchar(70) NOT NULL,
  PRIMARY KEY (`idhorarioc`),
  KEY `fk_idcategoria_hor` (`idcategoria`),
  CONSTRAINT `fk_idcategoria_hor` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `horariocategoria` */

insert  into `horariocategoria`(`idhorarioc`,`idcategoria`,`titulohorario`,`horario1`,`horario2`) values 
(14,8,'Horarios de Servicios','Todos los días de la semana','24 HORAS');

/*Table structure for table `horarioespecialidad` */

DROP TABLE IF EXISTS `horarioespecialidad`;

CREATE TABLE `horarioespecialidad` (
  `idhorarioe` int(11) NOT NULL AUTO_INCREMENT,
  `idespecialidad` int(11) NOT NULL,
  `dia` varchar(15) NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `emergencia` char(2) NOT NULL,
  PRIMARY KEY (`idhorarioe`),
  UNIQUE KEY `uk_dia_horae` (`dia`,`idespecialidad`),
  KEY `fk_idespecialidad_horae` (`idespecialidad`),
  CONSTRAINT `fk_idespecialidad_horae` FOREIGN KEY (`idespecialidad`) REFERENCES `especialidades` (`idespecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `horarioespecialidad` */

/*Table structure for table `horarioservicio` */

DROP TABLE IF EXISTS `horarioservicio`;

CREATE TABLE `horarioservicio` (
  `idhorarios` int(11) NOT NULL AUTO_INCREMENT,
  `idservicio` int(11) NOT NULL,
  `dia` varchar(15) NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `emergencia` char(2) NOT NULL,
  PRIMARY KEY (`idhorarios`),
  UNIQUE KEY `uk_dia_horas` (`dia`,`idservicio`),
  KEY `fk_idservicio_horas` (`idservicio`),
  CONSTRAINT `fk_idservicio_horas` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `horarioservicio` */

insert  into `horarioservicio`(`idhorarios`,`idservicio`,`dia`,`horainicio`,`horafin`,`emergencia`) values 
(34,32,'Todos los días','00:00:00','23:59:00','S'),
(35,33,'Todos los días','00:00:00','23:59:00','S'),
(36,34,'Todos los días','00:00:00','23:59:00','S'),
(37,35,'Todos los días','00:00:00','23:59:00','S'),
(38,37,'Todos los días','00:00:00','23:59:00','S'),
(39,39,'Todos los días','00:00:00','23:59:00','S'),
(40,38,'Todos los días','07:00:00','19:00:00','S'),
(41,36,'Todos los días','00:00:00','23:59:00','S');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `tipodoc` char(1) NOT NULL,
  `numdoc` char(8) NOT NULL,
  `telefono` char(9) NOT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `logeado` char(1) NOT NULL,
  `especialidad` char(1) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_numdoc_per` (`numdoc`,`tipodoc`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`tipodoc`,`numdoc`,`telefono`,`correo`,`logeado`,`especialidad`) values 
(15,'Famisalud','Chincha','D','45785869','956365856','manuel@gmail.com','N','N'),
(16,'Famisalud ','Editor','D','79879878','911221114','famisaludeditor@gmail.com','S','N');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `detalle` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE KEY `uk_producto_pro` (`producto`,`idsede`),
  KEY `fk_idsede_pro` (`idsede`),
  CONSTRAINT `fk_idsede_pro` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `productos` */

/*Table structure for table `saludocupacional` */

DROP TABLE IF EXISTS `saludocupacional`;

CREATE TABLE `saludocupacional` (
  `idsaludocupacional` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idsaludocupacional`),
  KEY `fk_idsede_so` (`idsede`),
  CONSTRAINT `fk_idsede_so` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `saludocupacional` */

/*Table structure for table `saludocupacional` */

DROP TABLE IF EXISTS `saludocupacional`;

CREATE TABLE `saludocupacional` (
  `idsaludocupacional` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idsaludocupacional`),
  KEY `fk_idsede_so` (`idsede`),
  CONSTRAINT `fk_idsede_so` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `saludocupacional` */

insert  into `saludocupacional`(`idsaludocupacional`,`idsede`,`foto`,`titulo`,`descripcion`) values 
(2,2,'20221005111109.jpg','Examen Básicos','La Ley N° 29783 es ​​obligatoria y se aplica a todas las actividades económicas. Esto incluye a los empleadores y empleados de la práctica privada, trabajadores del sector público, trabajadores de las fuerzas armadas y la policía nacional, e incluso trabajadores independientes en todo el territorio, ya que un gran porcentaje de las personas que trabajan en Perú están desprotegidas. .'),
(3,1,'20221005111109.jpg','Salud Ocupacional','Ciencia multidisciplinaria, que tiene como finalidad promover\r\ny mantener el más alto grado posible de bienestar físico,\r\nmental y social de los trabajadores en sus puestos de\r\ntrabajo; prevenir todo'),
(4,4,'20221007061849.jpg','Beneficios de la salud ocupacional','Antiguamente, el enfoque en la salud ocupacional se centraba, sobre todo, en aquellos que realizaban trabajos manuales, como por ejemplo los obreros. Después de la Guerra Civil, muchas fábricas abrier');

/*Table structure for table `sedes` */

DROP TABLE IF EXISTS `sedes`;

CREATE TABLE `sedes` (
  `idsede` int(11) NOT NULL AUTO_INCREMENT,
  `sede` varchar(25) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idsede`),
  UNIQUE KEY `uk_direccion_sede` (`direccion`),
  UNIQUE KEY `uk_ubicacion_sede` (`ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sedes` */

insert  into `sedes`(`idsede`,`sede`,`direccion`,`ubicacion`,`telefono`,`correo`,`fotografia`,`estado`,`fecharegistro`) values 
(5,'Sede Demo','Av. Callao N° 256','link','999888777','sede@gmail.com','sede_lima.jpeg','I','2022-10-12 15:29:22'),
(6,'eliminar','none','nose','959595959','nose@gmail.com','20221012031555.jpg','I','2022-10-12 15:55:55'),
(7,'Chincha','Calle N°, 28 de Julio 397, Chincha Alta','https://goo.gl/maps/659wafkfMBx4iN8H6','919191919','famisaludc@hotmail.com','2022102007716.jpg','A','2022-10-20 07:48:16'),
(8,'Pisco','C. 28 de Julio 220, Pisco 11601','https://goo.gl/maps/arYNHuhuvkRLJZvs9','191919191','famisaludp@hotmaill.com','sede_pisco.jpg','A','2022-10-20 07:49:28'),
(9,'Lima','Av. Arequipa 4067, Miraflores 15046','https://goo.gl/maps/nh4mz1K64Zzx2nFT8','313131313','famisaludl@hotmail.com','2022102007746.jpg','A','2022-10-20 07:52:46');

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `servicio` varchar(70) NOT NULL,
  `infoservicio` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `fotografia2` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idservicio`),
  UNIQUE KEY `uk_servicio_serv` (`servicio`,`idcategoria`),
  KEY `fk_idcategoria_serv` (`idcategoria`),
  CONSTRAINT `fk_idcategoria_serv` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios` */

insert  into `servicios`(`idservicio`,`idcategoria`,`servicio`,`infoservicio`,`fotografia`,`fotografia2`,`estado`) values 
(32,8,'AMBULANCIA','Atendemos emergencias médicas y accidentales las 24 horas y 365 días del año, a través de ambulancias de tipo II  equipadas para atender emergencias.','20221022031526.jpg','2022102203.jpg','A'),
(33,8,'HOSPITALIZACIÓN','El el servicio de hospitalizacion ofrecemos y buscamos el bienestar/comodidad del paciente en todo momento','20221022041645.jpg','2022102204.jpg','A'),
(34,8,'PLANTA DE OXÍGENO','Una planta de oxígeno medicinal está diseñado para generar oxígeno apto para fines médicos.','20221022041623.jpg','2022102205.jpg','A'),
(35,8,'FARMACIA','En nuestra farmacia ofrecemos una buena calidad de atencion y los mejores productos a las personas','20221022041641.jpg','2022102206.jpg','A'),
(36,8,'LABORATORIO','Ofrecemos la prevención, diagnóstico y tratamiento de enfermedades humanas a través de diferentes análisis .','20221022041617.jpg','2022102207.jpg','A'),
(37,8,'RAYOS X','Ofrecemos el servicio de rayos X donde se podrán prevenir y/o detectar enfermedades, para poder realizar una buena atención.','20221022041600.jpg','2022102208.jpg','A'),
(38,8,'ECOGRAFÍA','Ofrecemos rayos X para obtener información sobre partes internas del cuerpo y poder conocer el estado de la persona.','20221022041617.jpg','2022102209.jpg','A'),
(39,8,'SALA DE CIRUGÍA','Disponemos de una sala de cirugía para poder realizar las intervenciones o procedimientos quirúrgicos correspondientes con la mejor seguridad y atención.','20221022041659.jpg','2022102210.jpg','A');

/*Table structure for table `staffmedico` */

DROP TABLE IF EXISTS `staffmedico`;

CREATE TABLE `staffmedico` (
  `idstaffmedico` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idespecialidad` int(11) NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `infostaff` text NOT NULL,
  `cmp` int(11) NOT NULL,
  `rne` int(11) NOT NULL,
  `fechacreacion` date NOT NULL,
  PRIMARY KEY (`idstaffmedico`),
  UNIQUE KEY `uk_cmp_staff` (`cmp`),
  UNIQUE KEY `uk_rne_staff` (`rne`),
  UNIQUE KEY `uk_persona_staff` (`idpersona`,`idespecialidad`),
  KEY `fk_idespecialidad_staff` (`idespecialidad`),
  CONSTRAINT `fk_idespecialidad_staff` FOREIGN KEY (`idespecialidad`) REFERENCES `especialidades` (`idespecialidad`),
  CONSTRAINT `fk_idpersona_staff` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staffmedico` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `nombreusuario` varchar(15) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `nivelacceso` char(1) NOT NULL,
  `fechaalta` date NOT NULL,
  `fechabaja` date DEFAULT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_idpersona_user` (`idpersona`),
  UNIQUE KEY `uk_nombreusuario_user` (`nombreusuario`),
  CONSTRAINT `fk_idpersona_user` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idsede`,`nombreusuario`,`clave`,`nivelacceso`,`fechaalta`,`fechabaja`,`estado`) values 
(7,15,5,'famisalud','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','G','2022-10-12',NULL,'A'),
(8,16,7,'editorfamisalud','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','E','2022-10-20',NULL,'A');

/* Procedure structure for procedure `spu_blogs_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_eliminar`(
	IN _idblog		INT
)
BEGIN
	DELETE FROM blogs
	WHERE idblog = _idblog;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_listar`()
BEGIN
	SELECT * FROM blogs
	inner join sedes on sedes.idsede = blogs.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_listarCronologicamente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_listarCronologicamente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_listarCronologicamente`()
BEGIN
	SELECT * FROM blogs ORDER BY idblog DESC LIMIT 6;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_listar_todo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_listar_todo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_listar_todo`()
BEGIN
	select * from blogs;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_registro`(
	IN _idsede		INT,
	IN _tituloblog		VARCHAR(70),
	IN _infoblog		TEXT,
	IN _fotografia		VARCHAR(100)
)
BEGIN
	INSERT INTO blogs(idsede, tituloblog, infoblog, fotografia) VALUES
			(_idsede, _tituloblog, _infoblog, _fotografia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_sedes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_sedes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_sedes`(in _idsede int)
BEGIN
	select * from blogs where idsede = _idsede;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blogs_sedes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blogs_sedes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blogs_sedes_listar`(
IN _idsede INT
)
BEGIN
	SELECT * FROM blogs WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_blog_detalle_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_blog_detalle_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_blog_detalle_listar`(in _idblog int)
BEGIN
	select * from blogs where idblog = _idblog;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_detalle_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_detalle_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_detalle_listar`(in _idcampana int)
begin
	select * from campanas where idcampana = _idcampana;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_eliminar`(
	IN _idcampana		INT
)
BEGIN
	DELETE FROM campanas
	WHERE idcampana = _idcampana;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_listar`()
BEGIN
	SELECT * FROM campanas
	inner join sedes on sedes.idsede = campanas.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_listarPorSede` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_listarPorSede` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_listarPorSede`(
	in _idsede	int
)
BEGIN
	SELECT * FROM campanas where idsede = _idsede ORDER BY idcampana DESC LIMIT 4;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_listar_random` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_listar_random` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_listar_random`()
BEGIN
	SELECT * FROM campanas
   ORDER BY RAND() LIMIT 2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_listar_todo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_listar_todo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_listar_todo`()
begin
	select * from campanas ;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_registro`(
	IN _idsede		INT,
	IN _titulocampana	VARCHAR(70),
	IN _infocampana		TEXT,
	IN _fechainicio		DATE,
	IN _fechafin		DATE,
	IN _fotografia		VARCHAR(100)
)
BEGIN
	INSERT INTO campanas(idsede, titulocampana, infocampana, fechainicio, fechafin, fotografia) VALUES
			(_idsede, _titulocampana, _infocampana, _fechainicio, _fechafin, _fotografia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_campanas_sedes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_campanas_sedes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_campanas_sedes_listar`(
IN _idsede INT
)
BEGIN 
	SELECT * FROM campanas WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cargar_carrusel_detalleprincipal` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cargar_carrusel_detalleprincipal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cargar_carrusel_detalleprincipal`(
IN _idsede INT
)
BEGIN
	SELECT * FROM carouseldet WHERE idsede = _idsede AND tipo="P"
	ORDER BY imagen DESC LIMIT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_cargar_carrusel_detallesecundaria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cargar_carrusel_detallesecundaria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cargar_carrusel_detallesecundaria`(
IN _idsede INT
)
BEGIN
	SELECT * FROM carouseldet WHERE idsede = _idsede AND tipo="S";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carouseldet_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carouseldet_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carouseldet_eliminar`(
	IN _idcarouseldet	INT
)
BEGIN
	DELETE FROM carouseldet
	WHERE idcarouseldet = _idcarouseldet;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carouseldet_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carouseldet_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carouseldet_listar`()
BEGIN
	SELECT idcarouseldet, sedes.sede, imagen, 
	CASE
		WHEN tipo = 'P' THEN 'Principal'
		WHEN tipo = 'S' THEN 'Secundario'
	END 'tipo'
	FROM carouseldet
	INNER JOIN sedes ON sedes.idsede = carouseldet.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carouseldet_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carouseldet_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carouseldet_registro`(
	IN _idsede		INT,
	IN _imagen		VARCHAR(100),
	IN _tipo		CHAR(1)
)
BEGIN
	INSERT INTO carouseldet(idsede, imagen, tipo, fecha) VALUES
			(_idsede, _imagen, _tipo, curdate());
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carousel_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carousel_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carousel_eliminar`(
	IN _idcarousel	INT
)
BEGIN
	DELETE FROM carousel
	WHERE idcarousel = _idcarousel;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carousel_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carousel_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carousel_listar`()
BEGIN
	SELECT * FROM carousel
	INNER JOIN usuarios ON usuarios.idusuario = carousel.idusuario
	inner join personas on personas.idpersona = usuarios.idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carousel_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carousel_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carousel_registro`(
	IN _idusuario		INT,
	IN _foto		VARCHAR(100)
)
BEGIN
	INSERT INTO carousel(idusuario, foto, fecharegistro) VALUES
			(_idusuario, _foto, curdate());
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categoriasinactivas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categoriasinactivas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categoriasinactivas_listar`()
BEGIN
	SELECT * FROM categorias
	INNER JOIN sedes ON sedes.idsede = categorias.idsede WHERE categorias.estado = "I";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categorias_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_eliminar`(
	IN _idcategoria		INT
)
BEGIN
	UPDATE categorias SET
		estado = "I"
	WHERE idcategoria = _idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categorias_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_listar`()
BEGIN
	SELECT * FROM categorias
	inner join sedes on sedes.idsede = categorias.idsede where categorias.estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categorias_listarPorSede` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_listarPorSede` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_listarPorSede`(
	IN _idsede	INT
)
BEGIN
	SELECT * FROM categorias WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categorias_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_registro`(
	IN _idsede		INT,
	IN _categoria		VARCHAR(70)
)
BEGIN
	INSERT INTO categorias(idsede, categoria, fecha, estado, estadoh) VALUES
			(_idsede, _categoria, CURDATE(), "A", "I");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categorias_restaurar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categorias_restaurar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categorias_restaurar`(
	IN _idcategoria		INT
)
BEGIN
	UPDATE categorias SET
		estado = "A"
	WHERE idcategoria = _idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_categoria_cargarParaHorario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_categoria_cargarParaHorario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categoria_cargarParaHorario`(IN _idsede	INT)
BEGIN
	SELECT * FROM categorias
	WHERE estadoh = "I" and idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_detalleespecialidad_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_detalleespecialidad_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_detalleespecialidad_detalle`(IN _idespecialidad INT)
BEGIN 
	SELECT * FROM especialidades WHERE idespecialidad = _idespecialidad AND estadoespecialidad = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_detalleproducto_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_detalleproducto_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_detalleproducto_detalle`(IN _idproducto INT)
BEGIN 
	SELECT * FROM productos WHERE idproducto = _idproducto ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_cargar`(IN _idsede INT)
BEGIN
	SELECT * FROM especialidades WHERE idsede = _idsede AND estadoespecialidad = 'A';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_eliminar`(
	IN _idespecialidad		INT
)
BEGIN
	UPDATE especialidades SET
		estadoespecialidad = "I"
	WHERE idespecialidad = _idespecialidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_listarActivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_listarActivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_listarActivo`()
BEGIN
	SELECT * FROM especialidades
	INNER JOIN sedes ON sedes.idsede = especialidades.idsede WHERE estadoespecialidad = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_listarInactivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_listarInactivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_listarInactivo`()
BEGIN
	SELECT * FROM especialidades
	INNER JOIN sedes ON sedes.idsede = especialidades.idsede WHERE estadoespecialidad = "I";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_listarPorSede` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_listarPorSede` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_listarPorSede`(
	IN _idsede	INT
)
BEGIN
	SELECT * FROM especialidades WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_listar_aleatorio` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_listar_aleatorio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_listar_aleatorio`()
BEGIN
	SELECT * FROM especialidades order by rand() limit 21;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_listaunica` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_listaunica` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_listaunica`()
BEGIN
	SELECT * FROM especialidades WHERE idsede = 1 AND estadoespecialidad = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_reactivar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_reactivar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_reactivar`(
	IN _idespecialidad		INT
)
BEGIN
	UPDATE especialidades SET
		estadoespecialidad = "A"
	WHERE idespecialidad = _idespecialidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_especialidades_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_especialidades_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_especialidades_registro`(
	IN _idsede		INT,
	IN _especialidad	VARCHAR(30),
	IN _informacion		TEXT,
	IN _fotografia  	VARCHAR(100),
	IN _horario		VARCHAR(30),
	IN _horario2		VARCHAR(30)
)
BEGIN
	INSERT INTO especialidades(idsede, especialidad, informacion, fotografia, fotografia2, horario, horario2, estadoespecialidad) VALUES
			(_idsede, _especialidad, _informacion, _fotografia, NULL, _horario, _horario2, "A");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_getData_especialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_getData_especialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_getData_especialidad`(IN _idespecialidad INT)
BEGIN 
	SELECT * FROM especialidades WHERE idespecialidad = _idespecialidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horariocategoria_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horariocategoria_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horariocategoria_eliminar`(
	IN _idhorarioc		INT,
	IN _idcategoria		int
)
BEGIN
	DELETE FROM horariocategoria
	WHERE idhorarioc = _idhorarioc;
	UPDATE categorias SET
	estadoh = "I"
	WHERE idcategoria = _idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horariocategoria_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horariocategoria_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horariocategoria_listar`()
BEGIN
	SELECT * FROM horariocategoria
	INNER JOIN categorias ON categorias.idcategoria = horariocategoria.idcategoria
	INNER JOIN sedes ON sedes.idsede = categorias.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horariocategoria_listar_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horariocategoria_listar_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horariocategoria_listar_detalle`(
IN _idsede INT
)
BEGIN
	SELECT titulohorario, horario1, horario2 FROM horariocategoria
	INNER JOIN categorias ON categorias.idcategoria = horariocategoria.idcategoria
	INNER JOIN sedes ON sedes.idsede = categorias.idsede
	WHERE sedes.idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horariocategoria_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horariocategoria_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horariocategoria_registro`(
	IN _idcategoria		INT,
	IN _titulohorario	VARCHAR(70),
	IN _horario1		Varchar(70),
	IN _horario2		VARCHAR(70)
)
BEGIN
	INSERT INTO horariocategoria(idcategoria, titulohorario, horario1, horario2) VALUES
			(_idcategoria, _titulohorario, _horario1, _horario2);
	UPDATE categorias SET
	estadoh = "A"
	WHERE idcategoria = _idcategoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horarioserviciodetalle_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horarioserviciodetalle_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarioserviciodetalle_listar`(IN _idservicio INT)
BEGIN
		SELECT HSR.idhorarios, HSR.dia, TIME_FORMAT(HSR.horainicio, "%h:%i %p") AS horainicio, TIME_FORMAT(HSR.horafin, "%h:%i %p") AS horafin,
					HSR.`emergencia`, SRV.idservicio, SRV.idcategoria, SRV.servicio, SRV.infoservicio, SRV.fotografia, SRV.fotografia2, SRV.estado 
				 FROM horarioservicio HSR
		INNER JOIN servicios SRV ON HSR.idservicio = SRV.idservicio
		WHERE SRV.idservicio  = _idservicio;		
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horarioservicio_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horarioservicio_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarioservicio_eliminar`(
	IN _idhorarios		INT
)
BEGIN
	DELETE FROM horarioservicio
	WHERE idhorarios = _idhorarios;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horarioservicio_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horarioservicio_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarioservicio_listar`()
BEGIN
	SELECT * FROM horarioservicio
	INNER JOIN servicios ON servicios.idservicio = horarioservicio.idservicio
	inner join categorias on categorias.idcategoria = servicios.idcategoria
	inner join sedes on sedes.idsede = categorias.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horarioservicio_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horarioservicio_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarioservicio_registro`(
	IN _idservicio		INT,
	IN _dia			VARCHAR(15),
	IN _horainicio		TIME,
	IN _horafin		TIME,
	IN _emergencia		CHAR(1)
)
BEGIN
	INSERT INTO horarioservicio(idservicio, dia, horainicio, horafin, emergencia) VALUES
			(_idservicio, _dia, _horainicio, _horafin, _emergencia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_horarios_categorias_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_horarios_categorias_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarios_categorias_detalle`(
IN _idsede INT
)
BEGIN
	SELECT horariocategoria.titulohorario, horariocategoria.horario1, horariocategoria.horario2, categorias.categoria FROM horariocategoria
	INNER JOIN categorias ON categorias.idcategoria = horariocategoria.idcategoria
	WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_carousel` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_carousel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_carousel`()
BEGIN
	SELECT * FROM carousel order by idcarousel desc limit 5;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_servicio_categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_servicio_categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_servicio_categoria`(IN _idcategoria INT)
BEGIN
    SELECT * FROM servicios
    inner join categorias on categorias.idcategoria = servicios.idcategoria
    inner join sedes on sedes.idsede = categorias.idsede
    WHERE categorias.idcategoria = _idcategoria and sedes.estado = "A" and categorias.estado = "A" and servicios.estado = "A"
    ORDER BY idservicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_modificar_especialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_modificar_especialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modificar_especialidad`(
	IN _idespecialidad INT,
	IN _especialidad VARCHAR(30),
	IN _informacion TEXT,
	IN _horario VARCHAR(30),
	IN _horario2 VARCHAR(30)
)
BEGIN
	UPDATE especialidades SET
		especialidad = _especialidad,
		informacion = _informacion,
		horario = _horario,
		horario2 = _horario2
	WHERE idespecialidad = _idespecialidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_aptasEliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_aptasEliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_aptasEliminar`()
BEGIN
	SELECT * FROM personas
	WHERE especialidad = "N" and logeado = "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_eliminar`(
	IN _idpersona			INT
)
BEGIN
	DELETE FROM personas
	WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_listarEspecialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_listarEspecialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_listarEspecialidad`()
BEGIN
	SELECT * FROM personas
	WHERE especialidad = "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_listarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_listarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_listarUsuario`()
BEGIN
	SELECT * FROM personas
	where logeado = "N";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_personas_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_personas_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_registro`(
	IN _apellidos 	VARCHAR(30),
	IN _nombres	VARCHAR(30),
	IN _tipodoc	CHAR(1),
	IN _numdoc	CHAR(8),
	IN _telefono	CHAR(9),
	in _correo	varchar(80)
)
BEGIN
	INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, telefono, correo, logeado, especialidad) VALUES
			(_apellidos, _nombres, _tipodoc, _numdoc, _telefono, _correo, "N", "N");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_eliminar`(
	IN _idproducto		INT
)
BEGIN
	DELETE FROM productos
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_listar`()
BEGIN
	SELECT * FROM productos 
	inner join sedes on sedes.idsede = productos.idsede ORDER BY producto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_listarPorSede` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_listarPorSede` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_listarPorSede`(
	in _idsede	int
)
BEGIN
	SELECT * FROM productos where idsede = _idsede order by producto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_modificar`(
	IN _idproducto INT,
	IN _producto VARCHAR(50),
	IN _precio DECIMAL(7,2)
)
BEGIN
	UPDATE productos SET
		producto = _producto,
		precio = _precio
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_precio_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_precio_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_precio_modificar`(
	IN _idproducto		INT,
	IN _precio		DECIMAL(7,2)
)
BEGIN
	UPDATE productos SET
		precio = _precio
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_productos_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_productos_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_productos_registro`(
	IN _idsede		INT,
	IN _producto		VARCHAR(50),
	IN _precio		DECIMAL(7,2),
	IN _detalle		TEXT,
	IN _fotografia		VARCHAR(100)
)
BEGIN
	INSERT INTO productos(idsede, producto, precio, detalle, fotografia) VALUES
			(_idsede, _producto, _precio, _detalle, _fotografia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_producto_getdata` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_producto_getdata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_producto_getdata`(IN _idproducto INT)
BEGIN
	SELECT * FROM productos 
	WHERE idproducto = _idproducto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reactivar_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reactivar_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reactivar_eliminar`(
	IN _idsede		INT
)
BEGIN
	UPDATE sedes SET
		estado = "A"
	WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_cargar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_cargar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_cargar`(
	IN _idsede INT 
)
BEGIN
	SELECT * FROM saludocupacional WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_cargardetalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_cargardetalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_cargardetalle`(IN _idsaludocupacional INT)
BEGIN
	SELECT * FROM saludocupacional WHERE idsaludocupacional = _idsaludocupacional;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_eliminar`(
	IN _idsaludocupacional		INT
)
BEGIN
	DELETE FROM saludocupacional
	WHERE idsaludocupacional = _idsaludocupacional;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_listar`()
BEGIN
	SELECT * FROM saludocupacional
	INNER JOIN sedes ON sedes.idsede = saludocupacional.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_listar_todos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_listar_todos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_listar_todos`()
BEGIN
	SELECT * FROM saludocupacional;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_saludocupacional_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_saludocupacional_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_saludocupacional_registro`(
	IN _idsede				INT,
	IN _foto					VARCHAR(100),
	IN _titulo				VARCHAR(50),
	IN _descripcion		TEXT
)
BEGIN
	INSERT INTO saludocupacional(idsede, foto, titulo, descripcion) VALUES
			(_idsede, _foto, _titulo, _descripcion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedesfiltrar_especialidades` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedesfiltrar_especialidades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedesfiltrar_especialidades`()
BEGIN 
	SELECT DISTINCT sedes.idsede, sedes.sede  FROM especialidades
	INNER JOIN sedes ON sedes.idsede = especialidades.idsede where estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedesProductos_productos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedesProductos_productos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedesProductos_productos`()
BEGIN
	SELECT DISTINCT sedes.idsede, sedes.sede  FROM productos 
	INNER JOIN sedes ON sedes.idsede = 1 AND estado = 'A' ORDER BY producto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_eliminar`(
	IN _idsede		INT
)
BEGIN
	UPDATE sedes SET
		estado = "I"
	WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_especialidades` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_especialidades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_especialidades`(
IN _especialidad VARCHAR(30)
)
BEGIN
    SELECT sede, sedes.fotografia, sedes.direccion FROM especialidades
    INNER JOIN sedes ON sedes.idsede = especialidades.idsede
    WHERE especialidad = _especialidad AND estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_listar`(
	IN _idsede	INT
)
BEGIN
	SELECT * FROM sedes WHERE idsede =_idsede and estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_listarActivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_listarActivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_listarActivo`()
BEGIN
	SELECT * FROM sedes WHERE estado = "A" ORDER BY fecharegistro ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_listarInactivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_listarInactivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_listarInactivo`()
BEGIN
	SELECT * FROM sedes WHERE estado = "I";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_registro`(
	IN _sede	VARCHAR(25),
	IN _direccion	VARCHAR(100),
	IN _ubicacion	VARCHAR(100),
	IN _telefono	CHAR(9),
	IN _correo	VARCHAR(50),
	IN _fotografia	VARCHAR(100)
)
BEGIN
	INSERT INTO sedes(sede, direccion, ubicacion, telefono, correo, fotografia, estado) VALUES
			(_sede, _direccion, _ubicacion, _telefono, _correo, _fotografia, "A");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_buscador_nombre` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_buscador_nombre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_buscador_nombre`(in _servicio varchar(70))
begin
	select * from servicios where servicio like concat('%', _servicio, '%');
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_buscar_nombreservicio` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_buscar_nombreservicio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_buscar_nombreservicio`(IN _servicio VARCHAR(50))
BEGIN
    SELECT * FROM servicios
    INNER JOIN categorias ON categorias.idcategoria = servicios.idcategoria
    INNER JOIN sedes ON sedes.idsede = categorias.idsede 
    WHERE servicio = _servicio AND sedes.estado = "A" AND categorias.estado = "A" AND servicios.estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_eliminar`(
	IN _idservicio		INT
)
BEGIN
	UPDATE servicios SET
		estado = "I"
	WHERE idservicio = _idservicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_listar`()
BEGIN
	SELECT * FROM servicios
	INNER JOIN categorias ON categorias.idcategoria = servicios.idcategoria 
	INNER JOIN sedes ON sedes.idsede = categorias.idsede
	WHERE categorias.estado = "A" AND servicios.estado = "A" AND sedes.estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_listarInactivo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_listarInactivo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_listarInactivo`()
BEGIN
	SELECT * FROM servicios
	INNER JOIN categorias ON categorias.idcategoria = servicios.idcategoria 
	INNER JOIN sedes ON sedes.idsede = categorias.idsede 
	WHERE categorias.estado = "I" OR servicios.estado = "I" or sedes.estado = "I";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_listarPorSede` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_listarPorSede` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_listarPorSede`(
	IN _idsede	INT
)
BEGIN
	SELECT * FROM servicios
	INNER JOIN categorias ON categorias.idcategoria = servicios.idcategoria WHERE categorias.estado = "A" AND servicios.estado = "A" AND idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_registrar`(
	IN _idcategoria		INT,
	IN _servicio		VARCHAR(70),
	IN _infoservicio	TEXT,
	IN _fotografia		VARCHAR(100),
	IN _fotografia2		VARCHAR(100)	
)
BEGIN
	INSERT INTO servicios(idcategoria, servicio, infoservicio, fotografia, fotografia2, estado) VALUES
			(_idcategoria, _servicio, _infoservicio, _fotografia, _fotografia2, "A");
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_restaurar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_restaurar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_restaurar`(
	IN _idservicio		INT
)
BEGIN
	UPDATE servicios SET
		estado = "A"
	WHERE idservicio = _idservicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_servicios_sede_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_sede_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_sede_detalle`(
IN _idsede INT
)
BEGIN
	SELECT servicios.servicio, dia, TIME_FORMAT(horainicio, "%h:%i %p") AS horainicio, TIME_FORMAT(horafin, "%h:%i %p") AS horafin, fotografia2 FROM horarioservicio
	INNER JOIN servicios ON servicios.idservicio = horarioservicio.idservicio
	INNER JOIN categorias ON categorias.idcategoria = servicios.idcategoria
	WHERE idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_buscar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_buscar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_buscar`(
	IN _especialidad VARCHAR(30),
	IN _sede INT
 )
BEGIN
	SELECT personas.apellidos, personas.nombres, staffmedico.fotografia, especialidades.especialidad, infostaff, cmp, rne , sedes.idsede
		FROM staffmedico 
	INNER JOIN especialidades ON especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN sedes ON sedes.idsede = especialidades.idsede
	INNER JOIN personas ON personas.idpersona = staffmedico.idpersona
	WHERE especialidades.especialidad = _especialidad AND sedes.idsede = _sede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_eliminar`(
	IN _idstaffmedico		INT,
	in _idpersona			int
)
BEGIN
	DELETE FROM staffmedico
	WHERE idstaffmedico = _idstaffmedico;
	update personas set
		especialidad = "N"
		WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_listar`()
BEGIN
	SELECT * FROM staffmedico
	inner join personas on personas.idpersona = staffmedico.idpersona
	inner join especialidades on especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN sedes on sedes.idsede = especialidades.idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_listar_sedes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_listar_sedes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_listar_sedes`(
	IN _idsede INT
 )
BEGIN
	SELECT personas.apellidos, personas.nombres, staffmedico.fotografia, especialidades.especialidad, infostaff, cmp, rne 
			FROM staffmedico
	INNER JOIN especialidades ON especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN personas ON personas.idpersona = staffmedico.idpersona
	WHERE especialidades.idsede = _idsede;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_listar_todos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_listar_todos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_listar_todos`()
BEGIN
	SELECT personas.apellidos, personas.nombres, staffmedico.fotografia, especialidades.especialidad, infostaff, cmp, rne 
			FROM staffmedico
	INNER JOIN especialidades ON especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN personas ON personas.idpersona = staffmedico.idpersona
	ORDER BY personas.apellidos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_staffmedico_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_staffmedico_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_staffmedico_registro`(
	IN _idpersona		INT,
	IN _idespecialidad	INT,
	IN _fotografia		VARCHAR(100),
	IN _infostaff		TEXT,
	IN _cmp			int,
	in _rne			int
)
BEGIN
	INSERT INTO staffmedico(idpersona, idespecialidad, fotografia, infostaff, cmp, rne, fechacreacion) VALUES
			(_idpersona, _idespecialidad, _fotografia, _infostaff, _cmp, _rne, CURDATE());
			
	UPDATE personas SET
		especialidad = 'S'
		WHERE idpersona = _idpersona;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_todosservicios_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_todosservicios_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_todosservicios_listar`()
BEGIN
	SELECT * FROM servicios where estado = 'A';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_actualizarclave` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_actualizarclave` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_actualizarclave`(
	IN _idusuario INT,
	IN _clave	VARCHAR(100)
)
BEGIN
	UPDATE usuarios SET clave = _clave WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_eliminar`(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechabaja = CURDATE(),
		estado = "I"
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_getdata` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_getdata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_getdata`(IN _idusuario INT)
BEGIN
	SELECT idusuario, idpersona, idsede, nombreusuario, clave,
	CASE
		WHEN nivelacceso = 'G' THEN 'Gerente'
		WHEN nivelacceso = 'E' THEN 'Editor'
		WHEN nivelacceso = 'F' THEN 'Farmacia'
	END 'nivelacceso', fechaalta, fechabaja, estado
	FROM usuarios 
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_listarActivos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_listarActivos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_listarActivos`()
BEGIN
	SELECT idusuario, personas.apellidos, personas.nombres, nombreusuario, sedes.sede,
	CASE
			WHEN nivelacceso = 'E' THEN 'Editor'
			WHEN nivelacceso = 'F' THEN 'Farmacia'
			when nivelacceso = 'G' THEN 'Gerente'            
		END 'nivelacceso'
	FROM usuarios 
	inner join personas on personas.idpersona = usuarios.idpersona
	inner join sedes on sedes.idsede = usuarios.idsede 
	WHERE usuarios.estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_listarInactivos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_listarInactivos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_listarInactivos`()
BEGIN
	SELECT idusuario, personas.apellidos, personas.nombres, nombreusuario, sedes.sede,
	CASE
			WHEN nivelacceso = 'E' THEN 'Editor'
			WHEN nivelacceso = 'F' THEN 'Farmacia'
			WHEN nivelacceso = 'G' THEN 'Gerente'            
		END 'nivelacceso'
	FROM usuarios 
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona 
	INNER JOIN sedes ON sedes.idsede = usuarios.idsede 
	WHERE usuarios.estado = "I";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(
	IN _nombreusuario 	VARCHAR(15)
)
BEGIN
	SELECT * 
		FROM usuarios
		INNER JOIN personas ON personas.idpersona = usuarios.idpersona
		INNER JOIN sedes ON sedes.idsede = usuarios.idsede
	WHERE nombreusuario = _nombreusuario AND usuarios.estado = "A";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_modificar`(
	IN _idusuario INT,
	in _nombreusuario varchar(15),
	in _nivelacceso char(1)
)
BEGIN
	UPDATE usuarios SET
		nombreusuario = _nombreusuario,
		nivelacceso = _nivelacceso
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_reactivar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_reactivar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_reactivar`(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechaalta = CURDATE(),
		fechabaja = NULL,
		estado = "A"
	WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuario_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuario_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_registro`(
	IN _idpersona		INT,
	IN _idsede		INT,
	IN _nombreusuario	VARCHAR(15),
	IN _nivelacceso		CHAR(1)
)
BEGIN
	INSERT INTO usuarios(idpersona, idsede, nombreusuario, clave, nivelacceso, fechaalta, fechabaja, estado) VALUES
			(_idpersona, _idsede, _nombreusuario,"$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi", _nivelacceso, CURDATE(), NULL, "A");
			
	update personas set
		logeado = "S"
	where idpersona = _idpersona;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
