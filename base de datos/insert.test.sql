Use db_flecha 
GO

INSERT INTO Clase(descripcion_clase) VALUES
('Economico'),
('SEMI_DIRECTA'),
('Ejecutivo'),
('Primer Select')

INSERT INTO Servicio(descripcion_servicio) VALUES
('No hay servicios disponibles'),
('Aire acondicionado'),
('Toma corriente'),
('Sanitario mixto'),
('Semicama'),
('Luz de lectura'),
('Pantalla genera'),
('Wi-Fi')

INSERT INTO Clase_Servicio (cve_clase, cve_servicio) VALUES 
(1, 1),
(2, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8)

INSERT INTO Tipo_Viaje(tipo, descripcion_viaje) VALUES
('Local', 'La ruta de este autobús comienza en esta terminal y/o central.'),
('Paso', 'La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.')

-- INSERT statements for Central table
INSERT INTO Central (cve_central, nombre_central, calle, numero, colonia, municipio, estado)
VALUES
(1, 'Central A', 'Calle A', '123', 'Colonia A', 'Municipio A', 'Estado A'),
(2, 'Central B', 'Calle B', '456', 'Colonia B', 'Municipio B', 'Estado B'),
(3, 'Central C', 'Calle C', '789', 'Colonia C', 'Municipio C', 'Estado C');

-- INSERT statements for Linea table
INSERT INTO Linea (cve_linea, nombre_linea, cve_clase)
VALUES
(1, 'Linea A', 1),
(2, 'Linea B', 2),
(3, 'Linea C', 3);

--INSERT statements for Camion table
INSERT INTO Camion (id_camion, cve_linea, no_camion, cant_asientos)
VALUES
(1, 1, 123, 50),
(2, 2, 456, 50),
(3, 3, 789, 50);
-- INSERT statements for Ruta table
INSERT INTO Ruta (origen_ruta, destino_ruta, id_camion)
VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3);

-- INSERT statements for Viaje table
INSERT INTO Viaje (no_servicio, origen_viaje, destino_viaje, cve_tipo, fecha_salida, hora_salida, duracion, fecha_llegada, hora_llegada)
VALUES
(1, 1, 2, 1, '2022-01-01', '08:00:00', '02:00:00', '2022-01-01', '10:00:00'),
(1, 2, 3, 2, '2022-01-01', '10:30:00', '01:30:00', '2022-01-01', '12:00:00'),
(2, 1, 3, 1, '2022-01-01', '12:30:00', '02:30:00', '2022-01-01', '15:00:00'),
(2, 3, 1, 2, '2022-01-01', '15:30:00', '01:30:00', '2022-01-01', '17:00:00');
