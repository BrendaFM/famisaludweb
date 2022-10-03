CREATE DATABASE FAMISALUD;

USE FAMISALUD;

CREATE TABLE personas
(
	idpersona		INT 		AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(30)	NOT NULL,
	nombres 		VARCHAR(30)	NOT NULL,
	tipodoc			CHAR(1)	covid19	NOT NULL,
	numdoc			CHAR(8)		NOT NULL,
	telefono		CHAR(9)		NOT NULL,
	correo			VARCHAR(80)	NULL,
	logeado			CHAR(1)		NOT NULL,
	especialidad 		CHAR(1)		NOT NULL,
	CONSTRAINT uk_numdoc_per UNIQUE (numdoc, tipodoc)
)ENGINE = INNODB;


INSERT INTO personas(apellidos, nombres, tipodoc, numdoc, telefono, correo, logeado, especialidad)
VALUES ('Boada Ramos','Luis Anderson','D',111111111,123456789,'correo1@gmail.com','N','N'),
	('Guerra Quispe','Jose Miguel','D',222222222,234567890,'corre2o@gmail.com','N','N'),
	('Belleza Torres','Anderson David','D',333333333,345678901,'correo3@gmail.com','N','N'),
	('Diaz Perez','Carlos Armando','D',12121212,456789012,'correo4@gmail.com','N','N'),
	('Francia Minaya','Brenda Andrea','C',22334455,567890123,'correo5@gmail.com','N','N'),
	('Flores Torres','Roberto Jimmy','D',33445566,678901234,'correo6@gmail.com','N','N'),
	('Luyo Guerrero','Ana Maria','C',44556677,789012345,'correo7@gmail.com','N','N'),
	('Segarra Maroto','Cristina Noemi','D',55667788,890123456,'correo8@gmail.com','N','N'),
	('De Luque','Samuel Jesus','D',66778899,901234567,'correo9@gmail.com','N','N'),
	('Quispe Arteaga ','Guillermo Alberto','C',77889900,112345678,'correo10@gmail.com','N','N'),
	('Conde Valles','Daniel Nestor','D',88990011,198765432,'correo11@gmail.com','N','N'),
	('Roldan Uriarte','Luz Morgana','D',99001122,987654321,'correo12@gmail.com','N','N');
		
SELECT * FROM personas;

CREATE TABLE sedes
(
	idsede			INT 		AUTO_INCREMENT PRIMARY KEY,
	sede			VARCHAR(25)	NOT NULL,
	direccion 		VARCHAR(100)	NOT NULL,
	ubicacion 		VARCHAR(100)	NOT NULL,
	telefono		VARCHAR(9)	NOT NULL,
	correo			VARCHAR(50)	NOT NULL,
	imgsede			VARCHAR(100)	NOT NULL,
	CONSTRAINT uk_direccion_sede UNIQUE (direccion),
	CONSTRAINT uk_ubicacion_sede UNIQUE (ubicacion)
)ENGINE = INNODB;

INSERT INTO sedes(sede, direccion, ubicacion, telefono, correo, imgsede)
VALUES ("Lima", "Av. Arequipa 4067, Miraflores 15046", "LINK","111111111","correo@gmai1.com", "img1"),
		("Chincha", "Calle N°28 de Julio 397, Chincha Alta", "LINK2","222222222","correo2@gmai2.com", "img2"),
		("Pisco", "C. 28 de Julio 220, Pisco 11601", "LINK3","333333333","correo3@gmail3.com", "img3");
SELECT * FROM sedes;


CREATE TABLE usuarios
(
	idusuario		INT 			AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 			NOT NULL,
	idsede			INT 			NOT NULL,
	nombreusuario		VARCHAR(15)		NOT NULL,
	clave			VARCHAR(100)		NOT NULL,
	nivelacceso		CHAR(1)		    	NOT NULL,
	fechaalta 		DATE   			NOT NULL,	
	fechabaja 		DATE			NULL,		
	estado 			CHAR(1)			NOT NULL,		
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT uk_idpersona_user UNIQUE (idpersona), 
	CONSTRAINT uk_nombreusuario_user UNIQUE (nombreusuario)
) ENGINE = INNODB;

INSERT INTO usuarios(persona, sede, nombreusuario, contraseña, nivel, fecha, estado)
VALUES ("Vasquez","Manuel Guillermo","chincha","12345","4","19/09/22","Activo"),
VALUES ("Pepe","Jaime Sanchez","chincha","12345","2","18/09/22","Activo"),
VALUES ("Peter","Huaman Espinosa","Lima","12345","2","19/09/22","Activo"),
VALUES ("Ramirez","Adriana Yataco","Pisco","12345","1","19/09/22","Activo"),
VALUES ("Oscar","Miguel Angel","Lima","12345","3","18/09/22","Activo"),
VALUES ("Ysabel","Fuentes Cavero","pisco","12345","2","19/09/22","Activo"),
VALUES ("Sayra","Borjas Mendoza","chincha","12345","3","19/09/22","Activo"),
VALUES ("Lucho","Melendez smith","pisco","12345","4","18/09/22","Activo"),
VALUES ("Aldair","Cavero Barreras","pisco","12345","2","19/09/22","Activo");

SELECT * FROM usuarios;

CREATE TABLE especialidades
(
	idespecialidad		INT			AUTO_INCREMENT PRIMARY KEY,
	idsede			INT 			NOT NULL,
	especialidad		VARCHAR(30)		NOT NULL,	
	titulo			VARCHAR(120)		NOT NULL,
	informacion		TEXT			NOT NULL,
	imgespecialidad		VARCHAR(100)		NOT NULL,
	CONSTRAINT fk_idsede_esp FOREIGN KEY (idsede) REFERENCES sedes(idsede),
	CONSTRAINT uk_especialidad_esp UNIQUE (especialidad, idsede)
) ENGINE = INNODB;

INSERT INTO especialidades(idsede, especialidad, titulo, informacion, imgespecialidad)
VALUES ("1", "Medicia General", "titulolima","infolima","img1"),
		("2", "Medicia General", "titulo1chincha","info1chincha","img2"),
		("3", "Medicia General", "titulopisco","info1pisco","img3"),
		("1", "Reumatologia", "titulolima","infolima","img4"),
		("2", "Reumatologia", "titulo1chincha","info1chincha","img5"),
		("3", "Reumatologia", "titulopisco","info1pisco","img6"),
		("1", "Traumatologia", "titulolima","infolima","img7"),
		("2", "Traumatologia", "titulo1chincha","info1chincha","img8"),
		("2", "Oftamologia", "titulo1chincha","info1chincha","img9"),
		("3", "Oftamologia", "titulopisco","info1pisco","img10"),
		("1", "Pediatria", "titulolima","infolima","img11"),
		("3", "Pediatria", "titulopisco","info1pisco","img12"),
		("2", "Medicia Interna", "titulo1chincha","info1chincha","img13"),
		("3", "Medicia Interna", "titulopisco","info1pisco","img14");

SELECT * FROM especialidades;


CREATE TABLE staffmedico
(
	idstaffmedico		INT 			AUTO_INCREMENT PRIMARY KEY,
	idpersona 		INT			NOT NULL,
	idespecialidad		INT			NOT NULL,
	imgstaff		VARCHAR(100)		NOT NULL,
	infostaff		TEXT			NOT NULL,
	cmp			INT			NOT NULL,
	rne			INT			NULL,
	fechacreacion		DATE 			NOT NULL,
	CONSTRAINT fk_idpersona_staff FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT fk_idespecialidad_staff FOREIGN KEY (idespecialidad) REFERENCES especialidades(idespecialidad),
	CONSTRAINT uk_cmp_staff UNIQUE (cmp),
	CONSTRAINT uk_rne_staff UNIQUE (rne),
	CONSTRAINT uk_persona_staff UNIQUE (idpersona, idespecialidad)
) ENGINE = INNODB;

INSERT INTO staffmedico(idpersona, idespecialidad, imgstaff, infostaff, cmp, rne, fechacreacion)
VALUES (1, 1, 'imagen1.jpg','infotaff 1',1234567,1234567,'2022-09-17'),
		(2, 2, 'imagen2.jpg','infotaff 2',2345678,2345678,'2022-09-17'),
		(3, 3, 'imagen3.jpg','infotaff 3',3456789,3456789,'2022-09-17'),
		(4, 4, 'imagen4.jpg','infotaff 4',4567890,4567890,'2022-09-17'),
		(5, 5, 'imagen5.jpg','infotaff 5',5678901,5678901,'2022-09-17'),
		(6, 6, 'imagen6.jpg','infotaff 6',6789012,6789012,'2022-09-17'),
		(7, 7, 'imagen7.jpg','infotaff 7',7890123,7890123,'2022-09-17'),
		(8, 8, 'imagen8.jpg','infotaff 8',8901234,8901234,'2022-09-17'),
		(9, 9, 'imagen9.jpg','infotaff 9',9012345,9012345,'2022-09-17'),
		(10, 10, 'imagen10.jpg','infotaff 10',1212121,1212121,'2022-09-17'),
		(11, 11, 'imagen11.jpg','infotaff 11',1313131,1313131,'2022-09-17'),
		(12, 12, 'imagen12.jpg','infotaff 12',1414141,1414141,'2022-09-17');

SELECT * FROM staffmedico;

CREATE TABLE horarios
(
	idhorario 		INT 			AUTO_INCREMENT PRIMARY KEY,
	idsede			INT			NOT NULL,
	dia			VARCHAR(15)		NOT NULL,
	horainicio		TIME			NOT NULL,
	horafin			TIME			NOT NULL,
	emergencia		CHAR(1)			NOT NULL,
	CONSTRAINT fk_idsede_hor FOREIGN KEY (idsede) REFERENCES sedes (idsede),
	CONSTRAINT uk_dia_hor UNIQUE (dia, idsede)
) ENGINE = INNODB;

CREATE TABLE blogs
(
	idblog	 		INT 			AUTO_INCREMENT PRIMARY KEY,
	idusuario		INT 			NOT NULL,
	tituloblog		VARCHAR(70)		NOT NULL,
	infoblog		TEXT			NOT NULL,
	imgblog			VARCHAR(100)		NOT NULL,
	CONSTRAINT fk_idusuario_bl FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario)
) ENGINE = INNODB;

-- Registro Blogs
INSERT INTO blog (usuario, tituloblog, infoblog, imgblog) VALUES
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');
VALUES ('blog', 'Covid-19','Tiempos covid 2022','covid19.jpg');

SELECT * FROM blogs; 

CREATE TABLE servicios
(
	idservicio	 	INT 			AUTO_INCREMENT PRIMARY KEY,
	idsede			INT			NOT NULL,
	servicio		VARCHAR(70)		NOT NULL,
	infoservicio		TEXT			NOT NULL,
	imgservicio		VARCHAR(100)		NOT NULL,
	CONSTRAINT fk_idsede_serv FOREIGN KEY (idsede) REFERENCES sedes (idsede),
	CONSTRAINT uk_servicio_serv UNIQUE (servicio, idsede)
) ENGINE = INNODB;

CREATE TABLE campanas
(
	idcampana		INT			AUTO_INCREMENT PRIMARY KEY,
	idsede			INT 			NOT NULL,
	titulocampana		VARCHAR(70)		NOT NULL,
	infocampana		TEXT			NOT NULL,
	fechainicio		DATE			NOT NULL,
	fechafin		DATE			NOT NULL,
	imgcampana		VARCHAR(100)		NOT NULL,
	CONSTRAINT fk_idsede_cmp FOREIGN KEY (idsede) REFERENCES sedes (idsede)
) ENGINE = INNODB;

-- Registro Campanas

INSERT INTO especialidades(idsede, tcampana, infocampana, fechinicio, fechfin, imgcampana, estado)
VALUES ("1", "Campaña de prevención contra el dengue", "titulolima","infolima","img1"),
		("2", "psicologia", "titulo1chincha","info1chincha","img2"),
		("3", "Cancer pulmon", "titulopisco","info1pisco","img3"),
		("1", "Covid 19", "titulolima","infolima","img4"),
		("2", "Día de la Madre", "titulo1chincha","info1chincha","img5"),
		("3", "Covid 19", "titulopisco","info1pisco","img6"),
		("1", "Enfermera Peruana", "titulolima","infolima","img7"),
		("2", "Día Mundial de la Diabetes", "titulo1chincha","info1chincha","img8"),
		("2", "Campaña Medica", "titulo1chincha","info1chincha","img9"),
		("3", "Dia de la Salud", "titulopisco","info1pisco","img10"),
		("1", "Dia de la Ambulancia", "titulolima","infolima","img11"),
		("3", "Dia de la mujer", "titulopisco","info1pisco","img12"),
		("2", "Cancer de mama", "titulo1chincha","info1chincha","img13"),
		("3", "Conoce los EPS", "titulopisco","info1pisco","img14");

SELECT * FROM campanas;


CREATE TABLE productos
(
	idproducto		INT			AUTO_INCREMENT PRIMARY KEY,
	idsede			INT 			NOT NULL,
	producto 		VARCHAR(50)		NOT NULL,
	precio			DECIMAL(7,2)		NOT NULL,
	detalle			TEXT			NOT NULL,
	imgproducto		VARCHAR(100)		NOT NULL,
	CONSTRAINT fk_idsede_pro FOREIGN KEY (idsede) REFERENCES sedes (idsede),
	CONSTRAINT uk_producto_pro UNIQUE (producto, idsede)
) ENGINE = INNODB;

