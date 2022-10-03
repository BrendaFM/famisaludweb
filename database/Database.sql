CREATE DATABASE Servicios
USE Servicios

CREATE TABLE SEDES
(
idsede 		INT AUTO_INCREMENT PRIMARY KEY,
sede		VARCHAR(50) NOT NULL,
direccion 	VARCHAR(70) NOT NULL,
ubicacion 	VARCHAR(70) 	NULL,
telefono 	VARCHAR(70) 	NULL,
correo 		VARCHAR(70) 	NULL,
imgsede		VARCHAR(100)	NULL,
CONSTRAINT uk_sede_sedes UNIQUE (sede)
)ENGINE = INNODB;

CREATE TABLE CATEGORIAS
(
idcategoria INT AUTO_INCREMENT PRIMARY KEY,
categoria VARCHAR(70) NOT NULL,
fechahora DATETIME NOT NULL DEFAULT NOW(),
CONSTRAINT uk_categoria_categorias UNIQUE (categoria)
)ENGINE = INNODB;

CREATE TABLE SERVICIOS
(
idservicio 	INT AUTO_INCREMENT PRIMARY KEY,
idsede 		INT 		NOT NULL,
idcategoria 	INT 		    NULL,
servicio 	VARCHAR(100) 	NOT NULL,
infoservicio 	TEXT 		    NULL,
imgservicio     VARCHAR(100) 	    NULL,
CONSTRAINT uk_servicioidsede_servicios UNIQUE (servicio, idsede),
CONSTRAINT pk_idsede_servicios FOREIGN KEY (idsede) REFERENCES SEDES (idsede),
CONSTRAINT pk_idcategoria_servicios FOREIGN KEY (idcategoria) REFERENCES CATEGORIAS (idcategoria)
)ENGINE = INNODB;	


-- --------------------------------------------------------------------------------------
-- 			PROCEDIMIENTOS ALMACENADOS
-- ---------------------------------------------------------------------------------------

-- Listar sedes
-- -------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_sedes_listar()
BEGIN
	SELECT * FROM SEDES ORDER BY idsede;
END $$

-- Listar categorias
-- -----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_categorias_listar()
BEGIN
	SELECT * FROM CATEGORIAS ORDER BY idcategoria;
END $$
		
-- Listar servicios
-- -----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_servicios_listar()
BEGIN
	SELECT * FROM servicios ORDER BY idservicio;
END $$

-- Listar servicios por categoria
-- -----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_listar_servicio_categoria(IN _idcategoria INT)
BEGIN
	SELECT * FROM servicios 
		WHERE idcategoria = _idcategoria 
		ORDER BY idservicio;
END $$

-- Listar servicios por sedes
-- -----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_listar_servicio_sedes(IN _idsede INT)
BEGIN
	SELECT * FROM servicios 
		WHERE idsede = _idsede
		ORDER BY idservicio;
END $$

-- Buscar servicios por nombre de servicio
-- -----------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_servicios_buscar_nombreservicio(IN _servicio VARCHAR(50))
BEGIN
	SELECT * FROM servicios WHERE servicio = _servicio;
END $$