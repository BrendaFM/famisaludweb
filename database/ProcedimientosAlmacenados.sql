USE Servicios;

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

-- Registrar un servicio
-- ----------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_servicios_registrar
(
	IN _idsede 		INT, -- FK
	IN _idcategoria 	INT, -- FK
	IN _servicio    	VARCHAR(100),
	IN _infoservicio	TEXT,
	IN _imgservicio 	VARCHAR(100)
)
BEGIN
	IF _idcategoria = '' THEN SET _idcategoria = NULL; END IF;
	
	INSERT INTO servicios (idsede, idcategoria, servicio, infoservicio, imgservicio, estado, fecharegistro, fechabaja)
		VALUES (_idsede, _idcategoria, _servicio, _infoservicio, _imgservicio, '1', NOW(), NULL);
END


