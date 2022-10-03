SELECT * FROM carousel;
SELECT * FROM servicios;
SELECT * FROM sedes;
SELECT * FROM campanas;

SELECT * FROM especialidades;


DELETE FROM servicios;
DELETE FROM horarioservicio;

DELIMITER $$
CREATE PROCEDURE spu_listar_carousel()
BEGIN
	SELECT * FROM carousel ORDER BY idcarousel DESC LIMIT 5;
END $$

DELIMITER $$
CREATE PROCEDURE spu_todosservicios_listar()
BEGIN
	SELECT * FROM servicios WHERE estado = 'A';
END $$



DELIMITER $$
CREATE PROCEDURE spu_campanas_listar_random()
BEGIN
	SELECT * FROM campanas
   ORDER BY RAND() LIMIT 2;
END $$


DELIMITER $$
CREATE PROCEDURE spu_getData_especialidad(IN _idespecialidad INT)
BEGIN 
	SELECT * FROM especialidades WHERE idespecialidad = _idespecialidad;
END $$

DELIMITER $$
CREATE PROCEDURE spu_modificar_especialidad
(
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
END $$