USE master
GO

DROP DATABASE IF EXISTS db_flecha
GO

CREATE DATABASE db_flecha
GO

Use db_flecha 
GO

CREATE TABLE  Central(
	cve_central		INT PRIMARY KEY NOT NULL,
	nombre			NVARCHAR(128) NOT NULL,
	calle			NVARCHAR(128) NOT NULL,
	numero			NVARCHAR(128) NOT NULL,
	colonia			NVARCHAR(128) NOT NULL,
	municipio		NVARCHAR(128) NOT NULL,
	estado			NVARCHAR(128) NOT NULL
)
--Clases: ejecutivo, SEMI_DIRECTA, Economico, Primer Select
--Semidirecta y primer select ofrecen servicios, los otros dos no.
CREATE TABLE Clase(
	cve_clase		INT PRIMARY KEY IDENTITY (1,1),
	descripcion		NVARCHAR(128) NOT NULL
)

CREATE TABLE Servicio(
	cve_servicio	INT PRIMARY KEY IDENTITY (1,1),
	descripcion		NVARCHAR(128) NOT NULL
)

CREATE TABLE Clase_Servicio(
	cve_clase		INT FOREIGN KEY (cve_clase) REFERENCES Clase (cve_clase) NOT NULL,
	cve_servicio	INT FOREIGN KEY (cve_servicio) REFERENCES Servicio (cve_servicio) NOT NULL
)

CREATE TABLE Linea(
	cve_linea		INT PRIMARY KEY NOT NULL,
	nombre			NVARCHAR(128) NOT NULL,
	cve_clase		INT FOREIGN KEY (cve_clase) REFERENCES Clase(cve_clase) NOT NULL
)

CREATE TABLE Camion(
	no_camion		INT PRIMARY KEY NOT NULL,
	cve_linea		INT FOREIGN KEY (cve_linea) REFERENCES Linea(cve_linea) NOT NULL,
	cant_asientos	INT NOT NULL
)

CREATE TABLE Estado_Asiento(
	cve_estado		INT PRIMARY KEY IDENTITY (1,1),
	descripcion		NVARCHAR (128) NOT NULL
)

CREATE TABLE Tipo_Asiento(
	cve_tipo		INT PRIMARY KEY IDENTITY (1,1),
	descripcion		NVARCHAR(128) NOT NULL,
	costo			MONEY NOT NULL,
	cantidad		INT NOT NULL
)

CREATE TABLE Asiento(
	no_asiento		INT PRIMARY KEY NOT NULL,
	cve_estado		INT FOREIGN KEY (cve_estado) REFERENCES Estado_Asiento(cve_estado) NOT NULL,
	no_camion		INT FOREIGN KEY (no_camion) REFERENCES Camion(no_camion) NOT NULL,
	cve_tipo		INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Asiento(cve_tipo) NOT NULL
)

--Paso: La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.
--Local:  La ruta de este autobús comienza en esta terminal y/o central.
CREATE TABLE Tipo_Viaje(
	cve_tipo		INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	descripcion		NVARCHAR(128) NOT NULL
)

CREATE TABLE Viaje(
	no_servicio		INT PRIMARY KEY NOT NULL,
	origen			INT FOREIGN KEY (origen) REFERENCES Central(cve_central) NOT NULL,
	destino			INT FOREIGN KEY (destino) REFERENCES Central(cve_central) NOT NULL,
	no_camion		INT FOREIGN KEY (no_camion) REFERENCES Camion(no_camion) NOT NULL,
	cve_tipo		INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Viaje(cve_tipo) NOT NULL,
	fecha_salida	DATE NOT NULL,
	hora_salida		TIME NOT NULL,
	duracion		TIME NOT NULL,
	fecha_llegada	DATE NOT NULL,
	hora_llegada	TIME NOT NULL	
)


CREATE TABLE Usuario(
	id_usuario		INT PRIMARY KEY IDENTITY (1,1),
	nombre			NVARCHAR(128) NOT NULL,
	apellido		NVARCHAR(128) NOT NULL,
	usuario			NVARCHAR(128) NOT NULL,
	edad			INT NOT NULL,
	pass			NVARCHAR(256) NOT NULL,
	tel_user		NUMERIC(12) NOT NULL
)


CREATE TABLE Operacion(
	no_operacion	INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	id_usuario		INT FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) NOT NULL,
	cant_boletos	INT NOT NULL,
	costo_total		MONEY NOT NULL
)


CREATE TABLE Estado_Boleto(
	cve_estado		INT PRIMARY KEY IDENTITY NOT NULL,
	descripcion		NVARCHAR(128) NOT NULL
)

CREATE TABLE Boleto(
	no_boleto		INT PRIMARY KEY	NOT NULL,
	no_operacion	INT FOREIGN KEY (no_operacion) REFERENCES Operacion (no_operacion) NOT NULL,
	no_servicio		INT FOREIGN KEY (no_servicio) REFERENCES Viaje (no_servicio) NOT NULL,
	no_asiento		INT FOREIGN KEY (no_asiento) REFERENCES Asiento(no_asiento)NOT NULL,
	cve_estado		INT FOREIGN KEY (cve_estado) REFERENCES Estado_Boleto(cve_estado) NOT NULL,
	nombre_pas		NVARCHAR (128) NOT NULL,
	puerta			NVARCHAR(128),
	carril			INT,
	anden			INT,
	token_fac		NVARCHAR(128) NOT NULL,
	metodo_pago		NVARCHAR(128) NOT NULL,	
	tel_cliente		NUMERIC(12) NOT NULL,
	costo			MONEY NOT NULL
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