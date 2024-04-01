USE master
GO

DROP DATABASE IF EXISTS db_flecha
GO

CREATE DATABASE db_flecha
GO

Use db_flecha 
GO

CREATE TABLE  Central( -- Centrales de autobuses
	cve_central					INT PRIMARY KEY NOT NULL,
	nombre_central				NVARCHAR(128) NOT NULL,
	abreviatura					NVARCHAR(128) NOT NULL,
	municipio					NVARCHAR(128) NOT NULL,
	estado						NVARCHAR(128) NOT NULL
)

--Clases: ejecutivo, SEMI_DIRECTA, Economico, Primer Select
--Semidirecta y primer select ofrecen servicios, los otros dos no.
CREATE TABLE Clase(  -- Clases de autobuses. Por clase se entiende el tipo de autobús que se ofrece. Se diferencian por la calidad de los servicios que ofrecen.
	cve_clase					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_clase			NVARCHAR(128) NOT NULL
)

CREATE TABLE Servicio_Camion( -- Servicios que se ofrecen en las clases SEMI_DIRECTA y Primer Select
	cve_servicio				INT PRIMARY KEY IDENTITY (1,1),
	descripcion_servicio		NVARCHAR(128) NOT NULL
)

CREATE TABLE Clase_Servicio( -- Clases de autobuses y servicios que se ofrecen
	cve_clase					INT FOREIGN KEY (cve_clase) REFERENCES Clase (cve_clase) NOT NULL,
	cve_servicio				INT FOREIGN KEY (cve_servicio) REFERENCES Servicio_Camion (cve_servicio) NOT NULL
)

CREATE TABLE Linea( -- Lineas de autobuses
	cve_linea					INT PRIMARY KEY NOT NULL,
	nombre_linea				NVARCHAR(128) NOT NULL,
	cve_clase					INT FOREIGN KEY (cve_clase) REFERENCES Clase(cve_clase) NOT NULL
)

CREATE TABLE Camion( -- Camiones de la linea
	id_camion					INT PRIMARY KEY NOT NULL,
	cve_linea					INT FOREIGN KEY (cve_linea) REFERENCES Linea(cve_linea) NOT NULL,
	no_camion					INT NOT NULL,
	cant_asientos				INT NOT NULL
)

--Paso: La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.
--Local:  La ruta de este autobús comienza en esta terminal y/o central.
CREATE TABLE Tipo_Viaje( -- Tipos de viaje que se pueden realizar
	cve_tipo					INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	tipo						NVARCHAR(128) NOT NULL,
	descripcion_viaje			NVARCHAR(128)
)

CREATE TABLE Servicio_Viaje (--Servicios con origen y destino ya establecidos
	no_servicio					INT PRIMARY KEY IDENTITY(1,1),
	origen_servicio				INT FOREIGN KEY (origen_servicio) REFERENCES Central(cve_central) NOT NULL,
	destino_servicio			INT FOREIGN KEY(destino_servicio) REFERENCES Central(cve_central) NOT NULL
)
--Rutas de los camiones: Estan asociadas directamente con un no_servicio, o sea un origen y destino fijos
CREATE TABLE Ruta(	--Las rutas pueden tener escalas (paradas intermedias) EJ: Ruta punto A a C, viajes: A a B y B a C
	cve_ruta					INT PRIMARY KEY NOT NULL,
	no_servicio					INT FOREIGN KEY (no_servicio) REFERENCES Servicio_Viaje (no_servicio)NOT NULL,
	id_camion					INT FOREIGN KEY (id_camion) REFERENCES Camion(id_camion),
	escalas						INT NOT NULL
)

CREATE TABLE Viaje( -- Viajes que se realizan en una ruta (Pueden ser de A a B o de B a C pero no de A a C)
	cve_viaje					INT PRIMARY KEY NOT NULL,
	cve_ruta					INT FOREIGN KEY (cve_ruta) REFERENCES Ruta(cve_ruta) NOT NULL,
	origen_viaje				INT FOREIGN KEY (origen_viaje) REFERENCES Central(cve_central) NOT NULL,
	destino_viaje				INT FOREIGN KEY (destino_viaje) REFERENCES Central(cve_central) NOT NULL,
	cve_tipo					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Viaje(cve_tipo) NOT NULL,
	fecha_salida				DATETIME NOT NULL,
	duracion					TIME NOT NULL,
	fecha_llegada				DATETIME NOT NULL,
	escalas_pendientes			INT NOT NULL
)
--Estado: Disponible, ocupado
CREATE TABLE Estado_Asiento( -- Estados de los asientos
	cve_estado					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_edo_asiento		NVARCHAR (128) NOT NULL
)

CREATE TABLE Asiento( -- Asiento y su número de asiento 
	cve_asiento					INT PRIMARY KEY NOT NULL,
	no_asiento					INT NOT NULL
)

CREATE TABLE Asiento_Edo_Viaje(--El estado de los asientos dependen del VIAJE
	cve_asiento					INT FOREIGN KEY (cve_asiento) REFERENCES Asiento(cve_asiento) NOT NULL,
	cve_viaje					INT FOREIGN KEY (cve_viaje) REFERENCES Viaje(cve_viaje) NOT NULL,
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Asiento(cve_estado) NOT NULL
)
--Adulto, niño, adulto mayor, estudiante, profesor
CREATE TABLE Tipo_Boleto( -- Tipos de boletos que se pueden comprar
	cve_tipo					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_tipo_boleto		NVARCHAR(128) NOT NULL
)

CREATE TABLE Costo_Tipo( -- Disponibilidad de boletos de un tipo en un viaje.
	cve_viaje					INT FOREIGN KEY (cve_viaje) REFERENCES Viaje(cve_viaje) NOT NULL,
	cve_tipo					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Boleto(cve_tipo) NOT NULL,
	disponibles					INT NOT NULL
)
--Activo, falta confirmacion, suspendido, inactivo
CREATE TABLE Estado_Usuario( -- Estados de las cuentas de usuario
	cve_estado					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_edo_usuario		NVARCHAR(128) NOT NULL
)

CREATE TABLE Usuario( -- Usuarios que pueden comprar boletos
	id_usuario					INT PRIMARY KEY IDENTITY (1,1),
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Usuario(cve_estado) DEFAULT 1,
	nombre_user					NVARCHAR(128) NOT NULL,
	apellido					NVARCHAR(128) NOT NULL,
	pass						NVARCHAR(256) NOT NULL,
	email						NVARCHAR(128) NOT NULL,
	tel_user					NUMERIC(10)
)

CREATE TABLE MetodoPago_Operacion( -- Métodos de pago que se pueden utilizar para comprar boletos
	cve_metodo					INT PRIMARY KEY IDENTITY (1,1),
	descripcion_tipo_operacion	NVARCHAR(128) NOT NULL
)
CREATE TABLE Operacion( -- Operación de compra de boletos
	no_operacion				INT PRIMARY KEY NOT NULL,
	id_usuario					INT FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) NOT NULL,
	cve_metodo					INT FOREIGN KEY (cve_metodo) REFERENCES MetodoPago_Operacion(cve_metodo) NOT NULL,
	cant_boletos				INT NOT NULL,
	costo_total					MONEY NOT NULL
)

CREATE TABLE Operacion_Viaje( -- Relación entre la compra de boletos y los viajes
	no_operacion				INT FOREIGN KEY (no_operacion) REFERENCES Operacion(no_operacion) NOT NULL,
	cve_viaje					INT FOREIGN KEY (cve_viaje) REFERENCES Viaje(cve_viaje) NOT NULL
)

--1. Pagado, 2. pendiente, 3. cancelado, 4. reembolsado, 5. usado 
CREATE TABLE Estado_Boleto( -- Estados de los boletos comprados
	cve_estado					INT PRIMARY KEY IDENTITY NOT NULL,
	descripcion_edo_boleto		NVARCHAR(128) NOT NULL
)

CREATE TABLE Boleto( -- Boletos comprados por los usuarios
	no_boleto					INT PRIMARY KEY	NOT NULL,
	cve_tipo 					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Boleto(cve_tipo) NOT NULL,
	no_operacion				INT FOREIGN KEY (no_operacion) REFERENCES Operacion (no_operacion) NOT NULL,
	cve_asiento					INT FOREIGN KEY (cve_asiento) REFERENCES Asiento(cve_asiento)NOT NULL,
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Boleto(cve_estado) DEFAULT 2,
	nombre_pas					NVARCHAR (128) NOT NULL,
	token_fac					NVARCHAR(128) NOT NULL,
	no_asiento_boleto			INT NOT NULL,
	puerta						NVARCHAR(128),
	carril						INT,
	anden						INT,
	costo_boleto				MONEY NOT NULL
)

CREATE TABLE Token( --Token de usuario para firebase
	token_usuario				NVARCHAR(256) PRIMARY KEY NOT NULL,
	id_usuario					INT FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) NOT NULL
)

CREATE TABLE Actividad_Usuario(
	no_operacion				INT FOREIGN KEY (no_operacion) REFERENCES Operacion(no_operacion) NOT NULL,
	cve_central_origen			INT FOREIGN KEY (cve_central_origen) REFERENCES Central(cve_central) NOT NULL,
	cve_central_destino			INT FOREIGN KEY (cve_central_destino) REFERENCES Central(cve_central) NOT NULL,
	fecha_salida				DATETIME NOT NULL,
	fecha_operacion				DATETIME DEFAULT GETDATE()
)

ALTER AUTHORIZATION ON DATABASE::db_flecha TO sa
--Select central
SELECT * FROM Central
--Select Clase, linea y sus servicios
SELECT * FROM Clase
SELECT * FROM Clase_Servicio
SELECT * FROM Linea
SELECT * FROM Servicio_Camion

--Select seccion de viajes y asientos (tipoBoleto)
SELECT * FROM Servicio_Viaje
SELECT * FROM Ruta
SELECT * FROM Viaje
SELECT * FROM Camion
SELECT * FROM Estado_Asiento
SELECT * FROM Tipo_Viaje
SELECT * FROM Asiento
SELECT * FROM Asiento_Edo_Viaje
SELECT * FROM Costo_Tipo
--Select Usuario
SELECT * FROM Estado_Usuario
SELECT * FROM Usuario
SELECT * FROM Token
--Select operacion, boleto y actividad
SELECT * FROM Boleto
SELECT * FROM Operacion
SELECT * FROM Estado_Boleto
SELECT * FROM MetodoPago_Operacion
SELECT * FROM Actividad_Usuario




