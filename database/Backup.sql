/*
SQLyog Ultimate v12.5.1 (64 bit)
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

insert  into `blogs`(`idblog`,`idsede`,`tituloblog`,`infoblog`,`fotografia`) values 
(8,1,'Fiestas Patrias','Las Festividades patrióticas por la independencia de la República del Perú —de forma simple llamadas Fiestas Patrias de Perú— son las celebraciones nacionales anuales que se llevan a cabo en todo el territorio de Perú para conmemorar la emancipación peruana2​ del Imperio español y el inicio de la formación del país sudamericano como un Estado soberano.','2022092908808.jpg');

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

insert  into `campanas`(`idcampana`,`idsede`,`titulocampana`,`infocampana`,`fechainicio`,`fechafin`,`fotografia`) values 
(3,1,'DIA DE LA BANDERA','El Día de la Bandera se conmemora cada año en el Perú el 7 de junio, en el aniversario de la batalla de Arica. Este homenaje a la Bandera del Perú fue establecido por Decreto Supremo del 30 de abril de 1924.','2022-09-15','2022-09-30','2022092809946.jpg'),
(4,1,'DIA DEL PADRE','El Día del Padre es una celebración u homenaje dedicada a los padres. En general, la tradición católica europea lo conmemora el 19 de marzo, día de San José, padre adoptivo de Jesús. Sin embargo, varios países europeos.','2022-09-23','2022-10-07','2022092809945.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carousel` */

insert  into `carousel`(`idcarousel`,`idusuario`,`foto`,`fecharegistro`) values 
(5,1,'2022092812032.jpg','2022-09-28'),
(6,1,'2022092812019.jpg','2022-09-28'),
(10,1,'20220929031530.jpg','2022-09-29');

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

insert  into `carouseldet`(`idcarouseldet`,`idsede`,`imagen`,`tipo`,`fecha`) values 
(6,1,'imagencaru11.jpg','P','2022-09-26'),
(7,1,'imagencaru12.jpg','P','2022-09-26'),
(8,1,'imagencaru13.jpg','P','2022-09-26'),
(12,2,'imagencaru21.jpg','P','2022-09-26'),
(18,2,'20220930092111.jpg','P','2022-09-30'),
(19,2,'20220930092133.jpg','P','2022-09-30'),
(20,4,'20220930092116.jpg','P','2022-09-30');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`idsede`,`categoria`,`fecha`,`estado`,`estadoh`) values 
(1,1,'Laboratorio','2022-09-21','A','I'),
(2,1,'Quirófano ','2022-09-21','A','I'),
(3,1,'Diagnóstico por imágenes','2022-09-22','A','I'),
(4,1,'Emergencia','2022-09-22','A','I'),
(5,2,'Salud Ocupacional','2022-09-22','A','A'),
(6,2,'Médicos','2022-09-29','A','I'),
(7,1,'Médicos','2022-09-29','A','I');

/*Table structure for table `especialidades` */

DROP TABLE IF EXISTS `especialidades`;

CREATE TABLE `especialidades` (
  `idespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `idsede` int(11) NOT NULL,
  `especialidad` varchar(30) NOT NULL,
  `informacion` text NOT NULL,
  `fotografia` varchar(100) NOT NULL,
  `fotografia2` varchar(100) NOT NULL,
  `horario` varchar(30) DEFAULT NULL,
  `horario2` varchar(30) DEFAULT NULL,
  `estadoespecialidad` char(1) NOT NULL,
  PRIMARY KEY (`idespecialidad`),
  UNIQUE KEY `uk_especialidad_esp` (`especialidad`,`idsede`),
  KEY `fk_idsede_esp` (`idsede`),
  CONSTRAINT `fk_idsede_esp` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialidades` */

insert  into `especialidades`(`idespecialidad`,`idsede`,`especialidad`,`informacion`,`fotografia`,`fotografia2`,`horario`,`horario2`,`estadoespecialidad`) values 
(1,1,'Cardiología','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121207.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','Sábado de 8 am a 12pm','A'),
(2,4,'Cardiología','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121200.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','Sábado de 8am a 10pm','A'),
(3,1,'Psicología','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121222.jpg','2022092612.jpg','Lunes a Viernes de 8 am a 2pm','','A'),
(4,2,'Psicología','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121258.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','Sábado de 8am a 10pm','A'),
(5,1,'Obstetricia','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121223.jpg','2022092612.jpg','Lunes a Viernes de 11 am a 4pm','Sábado de 8am a 12pm','A'),
(6,2,'Obstetricia','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121213.jpg','2022092612.jpg','Lunes a Viernes de 9am a 5pm','Sábado de 8am a 10pm','A'),
(7,4,'Obstetricia','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121250.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','','A'),
(8,1,'Medicina General','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121208.jpg','2022092612.jpg','Lunes a Viernes de 7 am a 7pm','Sábado de 7am a 12pm','A'),
(9,2,'Medicina General','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121252.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','Sábado de 8am a 10pm','A'),
(10,4,'Medicina General','del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los procesos mentales de','20220926121225.jpg','2022092612.jpg','Lunes a Viernes de 10 am a 5pm','Sábado de 8am a 10pm','A'),
(14,1,'cardiologo','	del griego clásico ψυχή, translitα, logía, «tratado» o «estudio») es, a la vez, una profesión, una disciplina académica3​ y una ciencia que trata el estudio y el análisis de la conducta y los proceso','20220929031531.jpg','2022092903.jpg','','','A');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `horariocategoria` */

insert  into `horariocategoria`(`idhorarioc`,`idcategoria`,`titulohorario`,`horario1`,`horario2`) values 
(11,1,'Atención por Especialidades','Lunes a Viernes 7:00am a 7:00pm.','Lunes a Viernes 7:00am a 7:00pm.'),
(12,2,'Emergencia','24 Horas del Día','Todos los días de la semana'),
(13,5,'Atención de Salud Ocupacional','Lunes a Viernes 7:00am a 7:00pm','Sábados 7:00am a 1:00pm');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

/*Data for the table `horarioservicio` */

insert  into `horarioservicio`(`idhorarios`,`idservicio`,`dia`,`horainicio`,`horafin`,`emergencia`) values 
(20,25,'Lunes a Viernes','07:00:00','19:00:00','N'),
(22,23,'Lunes a Domingo','00:01:00','23:59:00','S'),
(24,30,'Lunes a Viernes','10:00:00','18:30:00','N'),
(28,21,'Lunes a Viernes','10:00:00','19:00:00','N'),
(29,22,'Lunes a Viernes','07:00:00','18:00:00','N'),
(30,31,'Lunes a Viernes','09:00:00','17:00:00','N'),
(31,28,'Lunes a Viernes','07:00:00','19:00:00','N'),
(32,27,'Lunes a Viernes','07:30:00','19:30:00','N'),
(33,24,'Lunes a Viernes','07:00:00','18:00:00','N');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`tipodoc`,`numdoc`,`telefono`,`correo`,`logeado`,`especialidad`) values 
(1,'Francia Minaya','Brenda Andrea','D','74720939','969808768','brenda@gmail.com','S','S'),
(2,'Belleza Torres','Anderson David','D','74125896','999888777','anderson@gmail.com','S','S'),
(3,'Boada Ramos','Luis Anderson','D','11111111','123456789','correo1@gmail.com','S','S'),
(4,'Guerra Quispe','Jose Miguel','D','22222222','234567890','corre2o@gmail.com','N','S'),
(5,'Diaz Perez','Carlos Armando','D','12121212','456789012','correo4@gmail.com','N','S'),
(6,'Flores Torres','Roberto Jimmy','D','33445566','678901234','correo6@gmail.com','S','S'),
(7,'Luyo Guerrero','Ana Maria','C','44556677','789012345','correo7@gmail.com','S','S'),
(8,'Segarra Maroto','Cristina Noemi','D','55667788','890123456','correo8@gmail.com','N','N'),
(9,'De Luque','Samuel Jesus','D','66778899','901234567','correo9@gmail.com','N','S'),
(10,'Quispe Arteaga ','Guillermo Alberto','C','77889900','112345678','correo10@gmail.com','N','N'),
(11,'Conde Valles','Daniel Nestor','D','88990011','198765432','correo11@gmail.com','N','N'),
(12,'Roldan Uriarte','Luz Morgana','D','99001122','987654321','correo12@gmail.com','N','S');

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

insert  into `productos`(`idproducto`,`idsede`,`producto`,`precio`,`detalle`,`fotografia`) values 
(1,1,'Mascarilla KN95',2.00,'Mascarilla para mantenernos protegidos ante el covid','mascarilla.jpg'),
(3,1,'Mascarilla simple',1.00,'cuida tu salud','2022092108856.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sedes` */

insert  into `sedes`(`idsede`,`sede`,`direccion`,`ubicacion`,`telefono`,`correo`,`fotografia`,`estado`,`fecharegistro`) values 
(1,'Chincha','Calle N°, 28 de Julio 397','Chincha Alta','056504443','famisaludc@gmail.com','sede_chincha.jpg','A','2022-10-02 12:21:55'),
(2,'Lima','Av. Arequipa 4067, Miraflores 15046','https://goo.gl/maps/j5oD31RsBQE73TxR7','012223394','famisaludl@gmail.com','sede_lima.jpeg','A','2022-10-02 12:20:55'),
(4,'Pisco','C. San Juan de Dios, Pisco 11601','https://goo.gl/maps/tHYBs4jwYNLQru4u8','954992886','famisaludp@gmail.com','sede_pisco.jpg','A','2022-10-02 12:22:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios` */

insert  into `servicios`(`idservicio`,`idcategoria`,`servicio`,`infoservicio`,`fotografia`,`fotografia2`,`estado`) values 
(21,3,'Densitometría','La densitometría es una prueba diagnóstica que mide el grado de mineralización del hueso y que se aplica tanto en el diagnóstico precoz de la osteoporosis como en el control de su evolución y valor.','20220929102246.jpg','2022092203.jpg','A'),
(22,3,'Ecografípa','Procedimiento en el que se usan ondas de sonido de alta energía (ultrasonidos) para observar los tejidos y órganos del interior del cuerpo. Las ondas de sonido crean ecos que forman imágenes.','20220929102228.jpg','2022092204.jpg','A'),
(23,4,'Ambulancia 24 horas','Te brindamos el servicio de atención de emergencias médicas y/o accidentales en el lugar que más lo necesites, con una flota de ambulancias Tipo II, Tipo III y unidades COVID-19 certificadas por MSD.','20220929102243.jpg','2022092207.jpg','A'),
(24,4,'Sala de Observación','Un lugar para garantizar los máximos cuidados post-quirúrgicos durante el ingreso ambulatorio. Transcurridas unas horas y una vez que el profesional lo valore, el paciente recibe el alta médica.','20220929112346.jpg','2022092209.jpg','A'),
(25,1,'Prueba Rápida Covid -19','El virus puede propagarse desde la boca o la nariz de una persona infectada en forma de pequeñas partículas líquidas que expulsa cuando tose, estornuda, habla, canta o respira.','20220929112311.jpg','2022092212.jpg','A'),
(27,6,'Neurología','La Neurología es la especialidad médica que estudia la estructura, función y desarrollo del sistema nervioso (central, periférico y autónomo) y muscular en estado normal y patológico utilizando todas.','20220929112333.jpg','2022092911.jpg','A'),
(28,6,'Oftalmología','Esta especialidad esta encargada del tratamiento de las enfermedades de los ojos, incluyendo el globo ocular, su musculatura, el sistema lagrimal y los párpados.','20220929112340.jpg','2022092210.jpg','A'),
(29,1,'Laboratorio Clínico','El laboratorio clínico es el lugar donde un equipo multidisciplinario formado por el químico clínico, el analista clínico, el médico, el patólogo clínico, los técnicos de laboratorio y los técnicos.','20220929112324.jpg','2022092211.jpg','I'),
(30,7,'Cardiología','La cardiología es la especialidad de la medicina que estudia el funcionamiento del aparato cardiovascular, es decir, el corazón y los vasos sanguíneos. Esta especialidad médica no suele abarcar.','20220929112355.jpg','2022092205.jpg','A'),
(31,5,'Radiología','La radiología es una rama de la medicina que utiliza la tecnología imagenológica para diagnosticar y tratar una enfermedad. Se puede dividir áreas diferentes: radiología diagnóstica y radiología.','20220929112324.jpg','2022092206.jpg','A');

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

insert  into `staffmedico`(`idstaffmedico`,`idpersona`,`idespecialidad`,`fotografia`,`infostaff`,`cmp`,`rne`,`fechacreacion`) values 
(1,1,1,'20220926011351.jpg','muchos años de experiencia',123123,321213,'2022-09-26'),
(2,2,9,'20220926011348.jpg','muchos años de experiencia',231231,321231,'2022-09-26'),
(3,4,6,'20220926011309.jpg','muchos años de experiencia',124124,142142,'2022-09-26'),
(4,3,8,'20220926011305.jpg','muchos años de experiencia',102365,354312,'2022-09-26'),
(5,6,2,'20220926011309.jpg','muchos años de experiencia',354678,12547,'2022-09-26'),
(6,5,3,'20220926011305.jpg','muchos años de experiencia',745632,125986,'2022-09-26'),
(7,7,5,'20220926011351.jpg','muchos años de experiencia',968574,125478,'2022-09-26'),
(8,9,9,'20220926011309.jpg','muchos años de experiencia',654546,546546,'2022-09-26'),
(9,12,4,'20220926011339.jpg','muchos años de experiencia',777666,666777,'2022-09-26');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`idsede`,`nombreusuario`,`clave`,`nivelacceso`,`fechaalta`,`fechabaja`,`estado`) values 
(1,1,1,'Brenda','$2y$10$uofCvGwHuCPEZZoKpTcZses6YOS.FPmofplXmK7imIY1.AB4f/rRO','G','2022-09-18',NULL,'A'),
(3,3,2,'Luis','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','F','2022-09-26',NULL,'A'),
(4,2,4,'Anderson','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','E','2022-09-25',NULL,'A'),
(5,6,1,'Roberto','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','F','2022-09-27',NULL,'A'),
(6,7,1,'Ana','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi','E','2022-09-26',NULL,'A');

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
	SELECT * FROM carouseldet WHERE idsede = _idsede AND tipo="P";
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
	in _fotografia2		varchar(100),
	in _horario		varchar(30),
	in _horario2		varchar(30)
)
BEGIN
	INSERT INTO especialidades(idsede, especialidad, informacion, fotografia, fotografia2, horario, horario2, estadoespecialidad) VALUES
			(_idsede, _especialidad, _informacion, _fotografia, _fotografia2, _horario, _horario2, "A");
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_horarioserviciodetalle_listar`(in _idservicio int)
BEGIN
	SELECT * FROM horarioservicio 
		INNER JOIN servicios ON horarioservicio.idservicio = servicios.idservicio
		WHERE horarioservicio.idservicio  = _idservicio;		
	
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
	SELECT servicios.servicio, dia, DATE_FORMAT(horainicio, "%H:%i") AS horainicio, DATE_FORMAT(horafin, "%H:%i") AS horafin, fotografia2 FROM horarioservicio
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
