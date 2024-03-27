USE master
GO

DROP DATABASE IF EXISTS db_flecha
GO

CREATE DATABASE db_flecha
GO

Use db_flecha 
GO

CREATE TABLE  Central(
	cve_central					INT PRIMARY KEY NOT NULL,
	nombre_central				NVARCHAR(128) NOT NULL,
	municipio					NVARCHAR(128) NOT NULL,
	estado						NVARCHAR(128) NOT NULL
)
--Clases: ejecutivo, SEMI_DIRECTA, Economico, Primer Select
--Semidirecta y primer select ofrecen servicios, los otros dos no.
CREATE TABLE Clase(
	cve_clase					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_clase			NVARCHAR(128) NOT NULL
)

CREATE TABLE Servicio(
	cve_servicio				INT PRIMARY KEY IDENTITY (1,1),
	descripcion_servicio		NVARCHAR(128) NOT NULL
)

CREATE TABLE Clase_Servicio(
	cve_clase					INT FOREIGN KEY (cve_clase) REFERENCES Clase (cve_clase) NOT NULL,
	cve_servicio				INT FOREIGN KEY (cve_servicio) REFERENCES Servicio (cve_servicio) NOT NULL
)

CREATE TABLE Linea(
	cve_linea					INT PRIMARY KEY NOT NULL,
	nombre_linea				NVARCHAR(128) NOT NULL,
	cve_clase					INT FOREIGN KEY (cve_clase) REFERENCES Clase(cve_clase) NOT NULL
)

CREATE TABLE Camion(
	id_camion					INT PRIMARY KEY NOT NULL,
	cve_linea					INT FOREIGN KEY (cve_linea) REFERENCES Linea(cve_linea) NOT NULL,
	no_camion					INT NOT NULL,
	cant_asientos				INT NOT NULL
)

CREATE TABLE Estado_Asiento(
	cve_estado					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_edo_asiento		NVARCHAR (128) NOT NULL
)

CREATE TABLE Asiento(
	cve_asiento					INT PRIMARY KEY NOT NULL,
	no_asiento					INT NOT NULL,
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Asiento(cve_estado) NOT NULL,
	id_camion					INT FOREIGN KEY (id_camion) REFERENCES Camion(id_camion) NOT NULL
)

--Paso: La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.
--Local:  La ruta de este autobús comienza en esta terminal y/o central.
CREATE TABLE Tipo_Viaje(
	cve_tipo					INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	tipo						NVARCHAR(128) NOT NULL,
	descripcion_viaje			NVARCHAR(128)
)

CREATE TABLE Ruta(	
	no_servicio					INT PRIMARY KEY IDENTITY (1,1),
	origen_ruta					INT FOREIGN KEY (origen_ruta) REFERENCES Central(cve_central) NOT NULL,
	destino_ruta				INT FOREIGN KEY (destino_ruta) REFERENCES Central(cve_central) NOT NULL,
	id_camion					INT FOREIGN KEY (id_camion) REFERENCES Camion(id_camion)
)

CREATE TABLE Viaje(
	cve_viaje					INT PRIMARY KEY NOT NULL,
	no_servicio					INT FOREIGN KEY (no_servicio) REFERENCES Ruta(no_servicio) NOT NULL,
	origen_viaje				INT FOREIGN KEY (origen_viaje) REFERENCES Central(cve_central) NOT NULL,
	destino_viaje				INT FOREIGN KEY (destino_viaje) REFERENCES Central(cve_central) NOT NULL,
	cve_tipo					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Viaje(cve_tipo) NOT NULL,
	fecha_salida				DATETIME NOT NULL,
	duracion					TIME NOT NULL,
	fecha_llegada				DATETIME NOT NULL	
)
--Activo, falta confirmacion, suspendido, inactivo
CREATE TABLE Estado_Usuario(
	cve_estado					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_edo_usuario		NVARCHAR(128) NOT NULL
)

CREATE TABLE Usuario(
	id_usuario					INT PRIMARY KEY IDENTITY (1,1),
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Usuario(cve_estado) DEFAULT 1,
	nombre_user					NVARCHAR(128) NOT NULL,
	apellido					NVARCHAR(128) NOT NULL,
	pass						NVARCHAR(256) NOT NULL,
	email						NVARCHAR(128) NOT NULL,
	tel_user					NUMERIC(10)
)

CREATE TABLE Operacion(
	no_operacion				INT PRIMARY KEY NOT NULL,
	no_servicio					INT FOREIGN KEY (no_servicio) REFERENCES Ruta (no_servicio) NOT NULL,
	id_usuario					INT FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) NOT NULL,
	costo_total					MONEY NOT NULL
)
--Adulto, niño, adulto mayor, estudiante, profesor
CREATE TABLE Tipo_Boleto(
	cve_tipo					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_tipo_boleto		NVARCHAR(128) NOT NULL
)

CREATE TABLE Costo_Tipo(
	cve_viaje					INT FOREIGN KEY (cve_viaje) REFERENCES Viaje(cve_viaje) NOT NULL,
	cve_tipo					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Boleto(cve_tipo) NOT NULL,
	disponibles					INT NOT NULL
)
--Pagado, pendiente, cancelado, reembolsado, usado
CREATE TABLE Estado_Boleto(
	cve_estado					INT PRIMARY KEY IDENTITY NOT NULL,
	descripcion_edo_boleto		NVARCHAR(128) NOT NULL
)

CREATE TABLE Boleto(
	no_boleto					INT PRIMARY KEY	NOT NULL,
	cve_tipo 					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Boleto(cve_tipo) NOT NULL,
	no_operacion				INT FOREIGN KEY (no_operacion) REFERENCES Operacion (no_operacion) NOT NULL,
	cve_asiento					INT FOREIGN KEY (cve_asiento) REFERENCES Asiento(cve_asiento)NOT NULL,
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Boleto(cve_estado) NOT NULL,
	nombre_pas					NVARCHAR (128) NOT NULL,
	token_fac					NVARCHAR(128) NOT NULL,
	no_asiento_boleto			INT NOT NULL,
	puerta						NVARCHAR(128),
	carril						INT,
	anden						INT,
	metodo_pago					NVARCHAR(128) NOT NULL,	
	tel_cliente					NUMERIC(12) NOT NULL,
	costo_boleto				MONEY NOT NULL
)

ALTER AUTHORIZATION ON DATABASE::db_flecha TO sa

SELECT * FROM Central
SELECT * FROM Clase
SELECT * FROM Clase_Servicio
SELECT * FROM Linea
SELECT * FROM Camion
SELECT * FROM Tipo_Asiento
SELECT * FROM Tipo_Viaje
SELECT * FROM Asiento
SELECT * FROM Boleto
SELECT * FROM Operacion
SELECT * FROM Viaje
SELECT * FROM Estado_Asiento
SELECT * FROM Estado_Boleto
SELECT * FROM Usuario
SELECT * FROM Servicio
SELECT * FROM Ruta