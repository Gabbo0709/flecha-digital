Use db_flecha 
GO

INSERT INTO Clase(descripcion_clase) VALUES
('Economico'),
('SEMI_DIRECTA'),
('Ejecutivo'),
('Primer Select'),
('Primera')

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
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8);

INSERT INTO Tipo_Viaje(tipo, descripcion_viaje) VALUES
('Local', 'La ruta de este autobús comienza en esta terminal y/o central.'),
('Paso', 'La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.')

-- INSERT statements for Central table
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado)
VALUES 
(1, 'Central Camionera de Guadalajara', 'GDL', 'Guadalajara', 'JAL'),
(2, 'Central Camionera de Tlaquepaque', 'TLQ', 'Tlaquepaque', 'JAL'),
(3, 'Central Camionera de Zapopan', 'ZPN', 'Zapopan', 'JAL'),
(4, 'Central de Autobuses "Estrella de Oro" (Iguala)', 'IGL', 'Iguala', 'GRO'),
(5, 'Central de Autobuses Cordoba', 'CRD', 'Cordoba', 'VER'),
(6, 'Central de autobuses de Celaya', 'CLY', 'Celaya', 'GTO'),
(7, 'Central de Autobuses de Huatulco', 'HTL', 'Huatulco', 'OAX'),
(8, 'Central de Autobuses de Monterrey', 'MTY', 'Monterrey', 'NL'),
(9, 'Central de Autobuses de Pátzcuaro', 'PTZ', 'Pátzcuaro', 'MICH'),
(10, 'Central de Autobuses de Primera Clase de Oaxaca', 'OAX', 'Oaxaca', 'OAX'),
(11, 'Central de Autobuses de Primera Clase de Puerto Escondido', 'PES', 'Puerto Escondido', 'OAX'),
(12, 'Central de Autobuses de Puerto Escondido', 'PES', 'Puerto Escondido', 'OAX'),
(13, 'Central de Autobuses de Segunda Clase de Oaxaca', 'OAX', 'Oaxaca', 'OAX'),
(14, 'Central de Autobuses de Tabasco', 'TAB', 'Tabasco', 'TAB'),
(15, 'Central de Autobuses de Tuxpan (Veracruz)', 'TXP', 'Tuxpan', 'VER'),
(16, 'Central de Autobuses de Tuxtepec', 'TXT', 'Tuxtepec', 'OAX'),
(17, 'Central de Autobuses de Veracruz', 'VER', 'Veracruz', 'VER'),
(18, 'Central de Autobuses de Xalapa', 'XAL', 'Xalapa', 'VER'),
(19, 'Central de Autobuses del Puerto de Coatzacoalcos', 'CTZ', 'Coatzacoalcos', 'VER'),
(20, 'Central de Autobuses Millenium Culiacán', 'CUL', 'Culiacán', 'SIN'),
(21, 'Central de Autobuses Uruapan', 'URU', 'Uruapan', 'MICH'),
(22, 'Central y Terminal de Autobuses de Atlacomulco', 'ATL', 'Atlacomulco', 'MEX'),
(23, 'Terminal Autobuses de Orizaba', 'ORZ', 'Orizaba', 'VER'),
(24, 'Terminal Autobuses de Primera Clase de Tuxpan (Veracruz)', 'TXP', 'Tuxpan', 'VER'),
(25, 'Terminal Autobuses de Segunda Clase de Orizaba', 'ORZ', 'Orizaba', 'VER'),
(26, 'Terminal Central de Autobuses de Minatitlán (Veracruz)', 'MTL', 'Minatitlán', 'VER'),
(27, 'Terminal Central de Autobuses de Pasajeros de la Ciudad de Puebla', 'PUE', 'Puebla', 'PUE'),
(28, 'Terminal Central de Autobuses de Pasajeros de Pachuca', 'PCH', 'Pachuca', 'HGO'),
(29, 'Terminal Central de Autobuses de Poza Rica', 'PZR', 'Poza Rica', 'VER'),
(30, 'Terminal Central de Autobuses del Norte', 'MTY', 'Monterrey', 'NL'),
(31, 'Terminal Central de Autobuses del Poniente', 'MTY', 'Monterrey', 'NL'),
(32, 'Terminal Central de Autobuses del Sur', 'MTY', 'Monterrey', 'NL'),
(33, 'Terminal Central de Autobuses Puerto Vallarta', 'PVR', 'Puerto Vallarta', 'JAL'),
(34, 'Terminal Central de Cuernavaca E. Blanca', 'CVC', 'Cuernavaca', 'MOR'),
(35, 'Terminal Central de Iguala', 'IGL', 'Iguala', 'GRO'),
(36, 'Terminal de Autobuses de Cuatro Caminos', 'CCM', 'Cuatro Caminos', 'MEX'),
(37, 'Terminal de Autobuses de Pasajeros de Oriente', 'MEX', 'Ciudad de México', 'CDMX'),
(38, 'Terminal de Autobuses de Primera Clase (Villahermosa,Tabasco)', 'VSA', 'Villahermosa', 'TAB'),
(39, 'Terminal de Autobuses de Querétaro', 'QRO', 'Querétaro', 'QRO'),
(40, 'Terminal de Autobuses de Zacapu', 'ZCP', 'Zacapu', 'MICH'),
(41, 'Terminal de Autobuses Morelia', 'MLA', 'Morelia', 'MICH'),
(42, 'Terminal de Autobuses Periférico de Oaxaca', 'OAX', 'Oaxaca', 'OAX'),
(43, 'Terminal de Autobuses San Nicolás de los Garza', 'MTY', 'Monterrey', 'NL'),
(44, 'Terminal San Jerónimo Monterrey', 'MTY', 'Monterrey', 'NL'),
(45, 'Terminal Toluca', 'TLC', 'Toluca', 'MEX');

-- INSERT statements for Linea table
INSERT INTO Linea (cve_linea, nombre_linea, cve_clase)
VALUES
(1, 'Primera Plus', 1),
(2, 'ADO', 2),
(3, 'Linea', 3);

--INSERT statements for Camion table
INSERT INTO Camion (id_camion, cve_linea, no_camion, cant_asientos)
VALUES
(1, 1, 123, 30),
(2, 2, 456, 40),
(3, 3, 789, 36);
-- INSERT statements for Ruta table

