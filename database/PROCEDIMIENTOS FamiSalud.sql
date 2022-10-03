-- procedimientos
USE FAMISALUD;

-- ---------------------------------------------------
-- PERSONAS
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_personas_registro
(
	IN _apellidos 	VARCHAR(30),
	IN _nombres	VARCHAR(30),
	IN _tipodoc	CHAR(1),
	IN _numdoc	CHAR(8),
	IN _telefono	CHAR(9)
)
BEGIN
	INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, telefono) VALUES
			(_apellidos, _nombres, _tipodoc, _numdoc, _telefono);
END $$

DELIMITER $$
CREATE PROCEDURE spu_personas_buscar( 
	IN _tipodoc CHAR(1), 
	IN _numdoc CHAR(8)
)
BEGIN
	SELECT * FROM personas
	WHERE tipodoc = _tipodoc AND numdoc = _numdoc;
END $$

DELIMITER $$
CREATE PROCEDURE spu_personas_listar()
BEGIN
	SELECT * FROM personas;
END $$

-- -------------------------------------------------
-- SEDES--
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_sedes_registro
(
	IN _iddistrito 	VARCHAR(6),
	IN _ubicacion	VARCHAR(100),
	IN _direccion	VARCHAR(50),
	IN _telefono	INT,
	IN _correo	VARCHAR(50),
	IN _imgsede	VARCHAR(100)
)
BEGIN
	INSERT INTO personas(iddistrito, ubicacion, direccion, telefono, correo, imgsede) VALUES
			(_iddistrito, _ubicacion, _direccion, _telefono, _correo, _imgsede);
END $$

DELIMITER $$
CREATE PROCEDURE spu_sedes_actualizar
(
	IN _idsede	INT,
	IN _iddistrito 	VARCHAR(6),
	IN _ubicacion	VARCHAR(100),
	IN _direccion	VARCHAR(50),
	IN _telefono	INT,
	IN _correo	VARCHAR(50),
	IN _imgsede	VARCHAR(100)
)
BEGIN
	UPDATE sedes SET 
		iddistrito = _iddistrito,
		ubicacion = _ubicacion,
		direccion = _direccion,
		telefono = _telefono,
		correo = _correo,
		imgsede = _imgsede
	WHERE idsede = _idsede;
END $$

DELIMITER $$
CREATE PROCEDURE spu_sedes_listar()
BEGIN
	SELECT * FROM sedes;
END $$

-- -------------------------------------------------
-- USUARIOS
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_usuario_registro
(
	IN _idpersona		INT,
	IN _idsede		INT,
	IN _nombreusuario	VARCHAR(15),
	IN _contrasena		VARCHAR(100),
	IN _nivelacceso		CHAR(1),
	IN _fechaalta		DATE,
	IN _fechabaja		DATE,
	IN _estado		CHAR(1)
)
BEGIN
	INSERT INTO usuarios(idpersona, idsede, nombreusuario, contrasena, nivelacceso, fechaalta, fechabaja, estado) VALUES
			(_idpersona, _idsede, _nombreusuario, _contrasena, _nivelacceso, CURDATE(), NULL, "S");
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuario_modificar
(
	IN _idusuario		INT,
	IN _idpersona		INT,
	IN _idsede		INT,
	IN _nombreusuario	VARCHAR(15),
	IN _contrasena		VARCHAR(100),
	IN _nivelacceso		CHAR(1),
	IN _estado		CHAR(1)
)
BEGIN
	UPDATE usuarios SET 
		idpersona = _idpersona,
		idsede = _idsede,
		nombreusuario = _nombreusuario,
		contrasena = _contrasena,
		nivelacceso = _nivelacceso,
		estado = _estado
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_eliminar
(
	IN _idusuario INT
)
BEGIN
	UPDATE usuarios SET
		fechabaja = CURDATE(),
		estado = "N"
	WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_usuarios_listar()
BEGIN
	SELECT * FROM usuarios;
END $$

-- -------------------------------------------------
-- ESPECIALIDADES
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_especialidades_registro
(
	IN _idsede		INT,
	IN _especialidad	VARCHAR(30),
	IN _titulo		VARCHAR(120),
	IN _informacion		TEXT,
	IN _imgespecialidad	VARCHAR(100)
)
BEGIN
	INSERT INTO especialidades(idsede, especialidad, titulo, informacion, imgespecialidad) VALUES
			(_idsede, _especialidad, _titulo, _informacion, _imgespecialidad);
END $$

DELIMITER $$
CREATE PROCEDURE spu_especialidades_listar()
BEGIN
	SELECT * FROM especialidades;
END $$

DELIMITER $$
CREATE PROCEDURE spu_especialidades_eliminar
(
	IN _idespecialidad		INT,
)
BEGIN
	DELETE FROM especialidades
	WHERE idespecialidad = _idespecialidad;
END $$

-- -------------------------------------------------
-- STAFF MEDICO
-- -------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_staffmedico_registro
(
	IN _idpersona		INT,
	IN _idespecialidad	INT,
	IN _imgstaff		VARCHAR(100),
	IN _infostaff		TEXT
)
BEGIN
	INSERT INTO staffmedico(idpersona, idespecialidad, imgstaff, infostaff) VALUES
			(_idpersona, _idespecialidad, _imgstaff, _infostaff);
END $$

DELIMITER $$
CREATE PROCEDURE spu_staffmedico_modificar
(
	IN _idstaffmedico	INT,
	IN _idpersona		INT,
	IN _idespecialidad	INT,
	IN _imgstaff		VARCHAR(100),
	IN _infostaff		TEXT
)
BEGIN
	UPDATE staffmedico SET
		idpersona = _idpersona,
		idespecialidad = _idespecialidad,
		imgstaff = _imgstaff,
		infostaff = _infostaff
	WHERE idstaffmedico = _idstaffmedico;
END $$

DELIMITER $$
CREATE PROCEDURE spu_staffmedico_eliminar
(
	IN _idstaffmedico		INT,
)
BEGIN
	DELETE FROM staffmedico
	WHERE idstaffmedico = _idstaffmedico;
END $$

DELIMITER $$
CREATE PROCEDURE spu_staffmedico_listar()
BEGIN
	SELECT personas.apellidos, personas.nombres, staffmedico.imgstaff, especialidades.especialidad, infostaff, codigo 
			FROM staffmedico
	INNER JOIN especialidades ON especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN personas ON personas.idpersona = staffmedico.idpersona
	ORDER BY personas.apellidos;
END $$


DELIMITER $$
CREATE PROCEDURE spu_staffmedico_listar_sedes(
	IN _idsede INT
 )
BEGIN
	SELECT personas.apellidos, personas.nombres, staffmedico.imgstaff, especialidades.especialidad, infostaff, codigo 
			FROM staffmedico
	INNER JOIN especialidades ON especialidades.idespecialidad = staffmedico.idespecialidad
	INNER JOIN personas ON personas.idpersona = staffmedico.idpersona
	WHERE especialidades.idsede = _idsede;
END $$

CALL spu_staffmedico_listar_sedes(3);

-- -------------------------------------------------
-- HORARIOS
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_horarios_registro
(
	IN _idsede		INT,
	IN _dia			VARCHAR(15),
	IN _horainicio		TIME,
	IN _horafin		TIME,
	IN _emergencia		CHAR(1)
)
BEGIN
	INSERT INTO horarios(idsede, dia, horainicio, horafin, emergencia) VALUES
			(_idsede, _dia, _horainicio, _horafin, _emergencia);
END $$

DELIMITER $$
CREATE PROCEDURE spu_horarios_modificar
(
	IN _idhorario		INT,
	IN _idsede		INT,
	IN _dia			VARCHAR(15),
	IN _horainicio		TIME,
	IN _horafin		TIME,
	IN _emergencia		CHAR(1)
)
BEGIN
	UPDATE horarios SET
		idsede = _idsede,
		dia = _dia,
		horainicio = _horainicio,
		horafin = _horafin,
		emergencia = _emergencia
	WHERE idhorario = _idhorario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_horarios_eliminar
(
	IN _idhorario		INT,
)
BEGIN
	DELETE FROM horarios
	WHERE idhorario = _idhorario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_horarios_listar()
BEGIN
	SELECT * FROM horarios;
END $$

-- -------------------------------------------------
-- BLOGS
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_blog_registro
(
	IN _idsede		INT,
	IN _tituloblog		VARCHAR(70),
	IN _infoblog		TEXT,
	IN _imgblog		VARCHAR(100)
)
BEGIN
	INSERT INTO blog(idsede, tituloblog, infoblog, imgblog) VALUES
			(_idsede, _tituloblog, _infoblog, _imgblog);
END $$

DELIMITER $$
CREATE PROCEDURE spu_blog_modificar
(
	IN _idblog		INT,	
	IN _idsede		INT,
	IN _tituloblog		VARCHAR(70),
	IN _infoblog		TEXT,
	IN _imgblog		VARCHAR(100)
)
BEGIN
	UPDATE blog SET
		idsede = _idsede,
		tituloblog = _tituloblog,
		infoblog = _infoblog,
		imgblog = _imgblog
	WHERE idblog = _idblog;
END $$

DELIMITER $$
CREATE PROCEDURE spu_blogs_eliminar
(
	IN _idblog		INT,
)
BEGIN
	DELETE FROM blogs
	WHERE idblog = _idblog;
END $$

DELIMITER $$
CREATE PROCEDURE spu_blogs_listar()
BEGIN
	SELECT * FROM blogs;
END $$

-- -------------------------------------------------
-- SERVICIOS 
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_servicios_registro
(
	IN _idsede		INT,
	IN _servicio		VARCHAR(70),
	IN _infoservicio	TEXT,
	IN _imgservicio		VARCHAR(100)
)
BEGIN
	INSERT INTO servicios(idsede, servicio, infoservicio, imgservicio) VALUES
			(_idsede, _servicio, _infoservicio, _imgservicio);
END $$

DELIMITER $$
CREATE PROCEDURE spu_servicios_modificar
(
	IN _idservicio		INT,	
	IN _idsede		INT,
	IN _servicio		VARCHAR(70),
	IN _infoservicio	TEXT,
	IN _imgservicio		VARCHAR(100)
)
BEGIN
	UPDATE servicios SET
		idsede = _idsede,
		servicio = _servicio,
		infoservicio = _infoservicio,
		imgservicio = _imgservicio
	WHERE idservicio = _idservicio;
END $$

DELIMITER $$
CREATE PROCEDURE spu_idservicios_eliminar
(
	IN _idservicio		INT,
)
BEGIN
	DELETE FROM servicios
	WHERE idservicio = _idservicio;
END $$

DELIMITER $$
CREATE PROCEDURE spu_idservicios_listar()
BEGIN
	SELECT * FROM servicios;
END $$

-- -------------------------------------------------
-- CAMPAÑAS 
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_campanas_registro
(
	IN _idsede		INT,
	IN _titulocampana	VARCHAR(70),
	IN _infocampana		TEXT,
	IN _fechainicio		DATE,
	IN _fechafin		DATE,
	IN _imgcampana		VARCHAR(100)
)
BEGIN
	INSERT INTO campanas(idsede, titulocampana, infocampana, fechainicio, fechafin, imgcampana) VALUES
			(_idsede, _titulocampana, _infocampana, CURDATE(), NULL, _imgcampana);
END $$

DELIMITER $$
CREATE PROCEDURE spu_campanas_modificar
(
	IN _idcampana		INT,
	IN _idsede		INT,
	IN _titulocampana	VARCHAR(70),
	IN _infocampana		TEXT,
	IN _imgcampana		VARCHAR(100)
)
BEGIN
	UPDATE campanas SET
		idsede = _idsede,
		titulocampana = _servicio,
		infoservicio = _infocampana,
		imgcampana = _imgcampana
	WHERE idcampana = _idcampana;
END $$

DELIMITER $$
CREATE PROCEDURE spu_campanas_eliminar
(
	IN _idcampana		INT,
)
BEGIN
	DELETE FROM campana
	WHERE idcampana = _idcampana;
END $$

DELIMITER $$
CREATE PROCEDURE spu_campanas_listar()
BEGIN
	SELECT * FROM campanas;
END $$

-- -------------------------------------------------
-- PRODUCTOS
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_productos_registro
(
	IN _idsede		INT,
	IN _producto		VARCHAR(50),
	IN _precio		DECIMAL(7,2),
	IN _detalle		TEXT,
	IN _imgproducto		VARCHAR(100),
)
BEGIN
	INSERT INTO campanas(idsede, producto, precio, detalle, imgproducto) VALUES
			(_idsede, _producto, _precio, _detalle, _imgproducto);
END $$

DELIMITER $$
CREATE PROCEDURE spu_productos_modificar
(
	IN _idproducto		INT,
	IN _idsede		INT,
	IN _producto		VARCHAR(50),
	IN _precio		DECIMAL(7,2),
	IN _detalle		TEXT,
	IN _imgproducto		VARCHAR(100)
)
BEGIN
	UPDATE campanas SET
		idsede = _idsede,
		producto = _producto,
		precio = _precio,
		detalle = _detalle,
		imgproducto = _imgproducto,
	WHERE idproducto = _idproducto;
END $$

DELIMITER $$
CREATE PROCEDURE spu_productos_eliminar
(
	IN _idproducto		INT,
)
BEGIN
	DELETE FROM productos
	WHERE idproducto = _idproducto;
END $$

DELIMITER $$
CREATE PROCEDURE spu_productos_listar()
BEGIN
	SELECT * FROM productos;
END $$

-- -------------------------------------------------
-- PROMOCIONES
-- -------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_promociones_registro
(
	IN _idproducto		INT,
	IN _promocion		VARCHAR(30),
	IN _imgpromocion	VARCHAR(100)
)
BEGIN
	INSERT INTO promociones(idproducto, promocion, imgproducto) VALUES
			(_idproducto, _promocion, _imgproducto);
END $$
	
DELIMITER $$
CREATE PROCEDURE spu_promociones_modificar
(
	IN _idpromocion		INT,
	IN _idproducto		INT,
	IN _promocion		VARCHAR(30),
	IN _imgpromocion	VARCHAR(100)
)
BEGIN
	UPDATE promociones SET
		idproducto = _idproducto,
		promocion = _promocion,
		imgpromocion = _imgpromocion
	WHERE idpromocion = _idpromocion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_promociones_eliminar
(
	IN _idpromocion		INT,
)
BEGIN
	DELETE FROM promociones
	WHERE idpromocion = _idpromocion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_promociones_listar()
BEGIN
	SELECT * FROM promociones;
END $$

