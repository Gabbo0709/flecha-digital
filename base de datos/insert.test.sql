Use db_flecha 
GO

INSERT INTO Tipo_Boleto(descripcion_tipo_boleto) VALUES
('Adulto'),
('Menor'),
('Adulto Mayor'),
('Estudiante')

INSERT INTO Estado_Asiento(descripcion_edo_asiento) VALUES
('Disponible'),
('Ocupado')

INSERT INTO Estado_Boleto(descripcion_edo_boleto) VALUES
('Pagado'),
('Pendiente'),
('Cancelado'),
('Reembolsado'),
('Usado')


INSERT INTO Estado_Usuario(descripcion_edo_usuario) VALUES
('Activo'),
('Falta confirmacion'),
('Inactivo'),
('Suspendido')

INSERT INTO Usuario (nombre_user, apellido, pass, email, tel_user) VALUES 
('Gustavo', 'Garcia', '123', 'e.gus.gg@gmail.com', 5573408674),
('Gabriel', 'Arcos', '123', 'gabbo0709@gmail.com', 5575539391)

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
('Pantalla general'),
('Wi-Fi')


INSERT INTO Clase_Servicio (cve_clase, cve_servicio) VALUES 
(1,1),
(2,2),
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
(4, 8),
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



INSERT INTO Linea (cve_linea, nombre_linea, cve_clase)
VALUES
(1, 'Primera Plus', 1),
(2, 'ADO', 2),
(3, 'Linea', 3)



INSERT INTO Camion (id_camion, cve_linea, no_camion, cant_asientos)
VALUES
(1, 1, 123, 35),
(2, 2, 456, 38),
(3, 3, 789, 32),
(4, 1, 234, 35),
(5, 2, 567, 38),
(6, 3, 890, 32),
(7, 1, 345, 35),
(8, 2, 678, 38),
(9, 3, 901, 32),
(10, 1, 456, 35),
(11, 2, 789, 38),
(12, 3, 012, 32),
(13, 1, 567, 35),
(14, 2, 890, 38),
(15, 3, 123, 32),
(16, 1, 678, 35),
(17, 2, 901, 38),
(18, 3, 234, 32),
(19, 1, 789, 35),
(20, 2, 012, 38),
(21, 3, 345, 32),
(22, 1, 890, 35),
(23, 2, 123, 38),
(24, 3, 456, 32),
(25, 1, 901, 35),
(26, 2, 234, 38),
(27, 3, 567, 32),
(28, 1, 012, 35),
(29, 2, 345, 38),
(30, 3, 678, 32),
(31, 1, 123, 35),
(32, 2, 456, 38),
(33, 3, 789, 32),
(34, 1, 234, 35),
(35, 2, 567, 38),
(36, 3, 890, 32),
(37, 1, 345, 35),
(38, 2, 678, 38),
(39, 3, 901, 32),
(40, 1, 456, 35),
(41, 2, 789, 38),
(42, 3, 012, 32),
(43, 1, 567, 35),
(44, 2, 890, 38),
(45, 3, 123, 32),
(46, 1, 678, 35),
(47, 2, 901, 38),
(48, 3, 234, 32),
(49, 1, 789, 35),
(50, 2, 012, 38);
GO

INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado)
VALUES 
(1, 'Central de Autobuses de Aguascalientes', 'AGS', 'Aguascalientes', 'AGS'),
(2, 'Central de Autobuses de Ensenada', 'ENS', 'Ensenada', 'BC'),
(3, 'Central de Autobuses de Mexicali', 'MXL', 'Mexicali', 'BC'),
(4, 'Central de Autobuses de Tijuana', 'TIJ', 'Tijuana', 'BC'),
(5, 'Terminal de Autobuses ACN en Ensenada', 'ENS', 'Ensenada', 'BC'),
(6, 'Terminal de Autobuses ACN Tijuana', 'TIJ', 'Tijuana', 'BC'),
(7, 'Terminal de Autobuses La Paz Malecón', 'LAP', 'La Paz', 'BCS'),
(8, 'Terminal de Autobuses San José del Cabo', 'SJC', 'San José del Cabo', 'BCS'),
(9, 'Terminal de Autobuses ADO Campeche', 'CAM', 'Campeche', 'CAM'),
(10, 'Terminal de Autobuses ADO Ciudad del Carmen', 'CDC', 'Ciudad del Carmen', 'CAM'),
(11, 'Viajes Medher Ciudad del Carmen', 'CDC', 'Ciudad del Carmen', 'CAM'),
(12, 'Terminal de Autobuses Champoton', 'CHP', 'Champoton', 'CAM'),
(13, 'Terminal de Autobuses de Escarcega', 'ESC', 'Escarcega', 'CAM'),
(14, 'Central de Autobuses de Ciudad Juárez', 'CJZ', 'Ciudad Juárez', 'CHIH'),
(15, 'Terminal de Autobuses Ciudad Cuauhtémoc', 'CUA', 'Ciudad Cuauhtémoc', 'CHIH'),
(16, 'Central de Autobuses de Chihuahua', 'CUU', 'Chihuahua', 'CHIH'),
(17, 'Terminal Estrella Blanca Delicias', 'DEL', 'Delicias', 'CHIH'),
(18, 'Terminal Ómnibus de México Delicias', 'DEL', 'Delicias', 'CHIH'),
(19, 'Terminal Ómnibus de México Ojinaga', 'OJI', 'Ojinaga', 'CHIH'),
(20, 'Central de Autobuses Parral', 'PAR', 'Parral', 'CHIH'),
(21, 'Central de Autobuses del Norte', 'CDMX', 'Ciudad de México', 'CDMX'),
(22, 'Central de Autobuses del Poniente', 'CDMX', 'Ciudad de México', 'CDMX'),
(23, 'Central de Autobuses del Sur', 'CDMX', 'Ciudad de México', 'CDMX'),
(24, 'Terminal de Autobuses de Pasajeros de Oriente TAPO', 'CDMX', 'Ciudad de México', 'CDMX'),
(25, 'Terminal Primera Plus Coapa – Calzada del Hueso', 'CDMX', 'Ciudad de México', 'CDMX'),
(26, 'Terminal Indios Verdes autobuses ADO', 'CDMX', 'Ciudad de México', 'CDMX'),
(27, 'Terminal Indios Verdes Autobuses Futura', 'CDMX', 'Ciudad de México', 'CDMX'),
(28, 'Terminal de Autobuses Coordinados de Nayarit CDMX', 'CDMX', 'Ciudad de México', 'CDMX'),
(29, 'Terminal Oasis de autobuses Santa Martha Acatitla', 'CDMX', 'Ciudad de México', 'CDMX'),
(30, 'Terminal ADO Santa Martha Acatitla', 'CDMX', 'Ciudad de México', 'CDMX'),
(31, 'Terminal Balbuena de autobuses TLA', 'CDMX', 'Ciudad de México', 'CDMX'),
(32, 'Viajes Medher Ciudad de México', 'CDMX', 'Ciudad de México', 'CDMX'),
(33, 'Terminal Balbuena AU', 'CDMX', 'Ciudad de México', 'CDMX'),
(34, 'Aeropuerto Internacional de la Ciudad de México', 'CDMX', 'Ciudad de México', 'CDMX'),
(35, 'Central de Autobuses de Saltillo', 'SLW', 'Saltillo', 'COAH'),
(36, 'Central de Autobuses de Torreón', 'TRC', 'Torreón', 'COAH'),
(37, 'Central de Autobuses de Monclova', 'MON', 'Monclova', 'COAH'),
(38, 'Central de Autobuses de Piedras Negras', 'PNL', 'Piedras Negras', 'COAH'),
(39, 'Terminal de Autobuses en Ramos Arizpe', 'RAM', 'Ramos Arizpe', 'COAH'),
(40, 'Central de Autobuses de Atlacomulco', 'ATL', 'Atlacomulco', 'MEX'),
(41, 'Terminal SENDA en Cuautitlán – Tepotzotlán', 'TEP', 'Cuautitlán - Tepotzotlán', 'MEX'),
(42, 'Terminal ADO Ixtapaluca', 'IXT', 'Ixtapaluca', 'MEX'),
(43, 'Terminal de Autobuses Ixtapan de la Sal', 'IXS', 'Ixtapan de la Sal', 'MEX'),
(44, 'Terminal de Autobuses ADO Tlalnepantla', 'TLA', 'Tlalnepantla', 'MEX'),
(45, 'Central de Autobuses Tepotzotlán', 'TEP', 'Tepotzotlán', 'MEX'),
(46, 'Terminal Toluca', 'TOL', 'Toluca', 'MEX'),
(47, 'Terminal Primera Plus Ecatepec', 'ECA', 'Ecatepec', 'MEX'),
(48, 'Central de Autobuses Valle de Bravo', 'VBR', 'Valle de Bravo', 'MEX'),
(49, 'Central de Autobuses de Celaya', 'CLY', 'Celaya', 'GTO'),
(50, 'Central de Autobuses de Comonfort', 'COM', 'Comonfort', 'GTO'),
(51, 'Central de Autobuses de Dolores Hidalgo', 'DHG', 'Dolores Hidalgo', 'GTO'),
(52, 'Central de Autobuses de Guanajuato', 'GUA', 'Guanajuato', 'GTO'),
(53, 'Central de Autobuses de Irapuato', 'IRP', 'Irapuato', 'GTO'),
(54, 'Central de Autobuses de León', 'LEN', 'León', 'GTO'),
(55, 'Central de Autobuses de Salamanca', 'SLM', 'Salamanca', 'GTO'),
(56, 'Central de Autobuses de San Luis de la Paz', 'SLP', 'San Luis de la Paz', 'GTO'),
(57, 'Central de Autobuses de San Miguel de Allende', 'SMA', 'San Miguel de Allende', 'GTO'),
(58, 'Terminal de autobuses Acapulco Centro', 'ACA', 'Acapulco', 'GRO'),
(59, 'Terminal de Autobuses Estrella de Oro Acapulco Costera', 'ACA', 'Acapulco', 'GRO'),
(60, 'Terminal de autobuses Acapulco Ejido', 'ACA', 'Acapulco', 'GRO'),
(61, 'Terminal Estrella de Oro Acapulco Diamante', 'ACA', 'Acapulco', 'GRO'),
(62, 'Terminal de Autobuses Estrella Roja del Sur Acapulco Diamante', 'ACA', 'Acapulco', 'GRO'),
(63, 'Terminal de lujo de autobuses Acapulco Papagayo', 'ACA', 'Acapulco', 'GRO'),
(64, 'Central de Autobuses de Atoyac', 'ATO', 'Atoyac', 'GRO'),
(65, 'Central de Autobuses de Iguala', 'IGL', 'Iguala', 'GRO'),
(66, 'Terminal de Autobuses Estrella de Oro Iguala', 'IGL', 'Iguala', 'GRO'),
(67, 'Terminal de Autobuses Costa Line Chilpancingo', 'CHP', 'Chilpancingo', 'GRO'),
(68, 'Terminal de autobuses Estrella de Oro Chilpancingo', 'CHP', 'Chilpancingo', 'GRO'),
(69, 'Central de Autobuses de Zihuatanejo', 'ZIH', 'Zihuatanejo', 'GRO'),
(70, 'Terminal de Autobuses Estrella de Oro Zihuatanejo', 'ZIH', 'Zihuatanejo', 'GRO'),
(71, 'Central de Autobuses de Ixmiquilpan', 'IXM', 'Ixmiquilpan', 'HGO'),
(72, 'Central de Autobuses de Pachuca', 'PAC', 'Pachuca', 'HGO'),
(73, 'Terminal de autobuses Villas de Pachuca', 'PAC', 'Pachuca', 'HGO'),
(74, 'Central de Autobuses de Tula', 'TUL', 'Tula', 'HGO'),
(75, 'Central de Autobuses de Tulancingo', 'TUL', 'Tulancingo', 'HGO'),
(76, 'Terminal de Autobuses Huejutla', 'HUE', 'Huejutla', 'HGO'),
(77, 'Terminal de Autobuses ADO Huejutla', 'HUE', 'Huejutla', 'HGO'),
(78, 'Terminal de Autobuses Primera Plus en Autlán', 'AUT', 'Autlán', 'JAL'),
(79, 'Central de Autobuses de Ciudad Guzmán', 'CGU', 'Ciudad Guzmán', 'JAL'),
(80, 'Antigua Central de Autobuses de Guadalajara', 'GDL', 'Guadalajara', 'JAL'),
(81, 'Central Nueva de Autobuses de Guadalajara', 'GDL', 'Guadalajara', 'JAL'),
(82, 'Terminal Guadalajara de Autobuses Vallarta Plus', 'GDL', 'Guadalajara', 'JAL'),
(83, 'Terminal Portal del Calzado Guadalajara', 'GDL', 'Guadalajara', 'JAL'),
(84, 'Central de Autobuses Lagos de Moreno', 'LAG', 'Lagos de Moreno', 'JAL'),
(85, 'Central de Autobuses Magdalena', 'MAG', 'Magdalena', 'JAL'),
(86, 'Central de Autobuses de Puerto Vallarta', 'PVR', 'Puerto Vallarta', 'JAL'),
(87, 'Terminal de Autobuses Vallarta Plus en Puerto Vallarta', 'PVR', 'Puerto Vallarta', 'JAL'),
(88, 'Central de Autobuses de San Juan de los Lagos', 'SJL', 'San Juan de los Lagos', 'JAL'),
(89, 'Terminal de Autobuses de Tamazula de Gordiano', 'TAM', 'Tamazula de Gordiano', 'JAL'),
(90, 'Terminal de Autobuses de Tequila', 'TEQ', 'Tequila', 'JAL'),
(91, 'Central de Autobuses de Tepatitlán', 'TEP', 'Tepatitlán', 'JAL'),
(92, 'Terminal de Autobuses Tlaquepaque Periférico Sur Tren Ligero', 'TLQ', 'Tlaquepaque', 'JAL'),
(93, 'Terminal Zapopan de Autobuses', 'ZAP', 'Zapopan', 'JAL'),
(94, 'Terminal de Autobuses Nuevo Milenio de Zapopan', 'ZAP', 'Zapopan', 'JAL'),
(95, 'Terminal de Autobuses 4 Caminos', 'CMI', 'Cuatro Caminos', 'MICH'),
(96, 'Terminal de autobuses en Apatzingán', 'APT', 'Apatzingán', 'MICH'),
(97, 'Terminal de Autobuses Morelia TAM', 'MOR', 'Morelia', 'MICH'),
(98, 'Central de Autobuses de Lázaro Cárdenas', 'LZC', 'Lázaro Cárdenas', 'MICH'),
(99, 'Terminal de Autobuses de Maravatio', 'MAR', 'Maravatio', 'MICH'),
(100, 'Central de Autobuses de Pátzcuaro', 'PTZ', 'Pátzcuaro', 'MICH'),
(101, 'Central de Autobuses de la Piedad', 'PDD', 'La Piedad', 'MICH'),
(102, 'Terminal Primera Plus Sahuayo', 'SAH', 'Sahuayo', 'MICH'),
(103, 'Central de Autobuses de Uruapan', 'URU', 'Uruapan', 'MICH'),
(104, 'Terminal de Autobuses de Zacapú', 'ZCP', 'Zacapú', 'MICH'),
(105, 'Central de Autobuses de Zamora', 'ZAM', 'Zamora', 'MICH'),
(106, 'Central de Autobuses de Zitacuaro', 'ZIT', 'Zitacuaro', 'MICH'),
(107, 'Terminal de Autobuses OCC Cuautla', 'CMA', 'Cuautla', 'MOR'),
(108, 'Terminal de Autobuses Oro Cuautla', 'CMA', 'Cuautla', 'MOR'),
(109, 'Terminal de Autobuses Pullman de Morelos Cuautla', 'CMA', 'Cuautla', 'MOR'),
(110, 'Terminal de Autobuses TER y Futura en Cuautla', 'CMA', 'Cuautla', 'MOR'),
(111, 'Terminal Cuernavaca Casino de la Selva', 'CUER', 'Cuernavaca', 'MOR'),
(112, 'Terminal de Autobuses Estrella Blanca Cuernavaca', 'CUER', 'Cuernavaca', 'MOR'),
(113, 'Terminal de Autobuses Estrella de Oro Cuernavaca', 'CUER', 'Cuernavaca', 'MOR'),
(114, 'Terminal Centro de autobuses Pullman de Morelos en Cuernavaca', 'CUER', 'Cuernavaca', 'MOR'),
(115, 'Terminal de autobuses TER en Cuernavaca', 'CUER', 'Cuernavaca', 'MOR'),
(116, 'Terminal Nuevo Vallarta de Autobuses ETN / TAP', 'NVN', 'Nuevo Vallarta', 'NAY'),
(117, 'Terminal de Autobuses Primera Plus Nuevo Vallarta', 'NVN', 'Nuevo Vallarta', 'NAY'),
(118, 'Terminal Nuevo Vallarta de Autobuses Vallarta Plus', 'NVN', 'Nuevo Vallarta', 'NAY'),
(119, 'Oficina autobuses Pacifico en la Peñita de Jaltemba', 'PEN', 'La Peñita de Jaltemba', 'NAY'),
(120, 'Oficina Vallarta Plus Peñita de Jaltemba', 'PEN', 'La Peñita de Jaltemba', 'NAY'),
(121, 'Terminal de Autobuses San Blas', 'SBL', 'San Blas', 'NAY'),
(122, 'Central de Autobuses de Tepic', 'TPC', 'Tepic', 'NAY'),
(123, 'Terminal de Autobuses Coordinados de Nayarit en Tepic', 'TPC', 'Tepic', 'NAY'),
(124, 'Terminal de Autobuses Tepic Plus en Tepic (centro)', 'TPC', 'Tepic', 'NAY'),
(125, 'Terminal de Autobuses Tufesa en Tepic', 'TPC', 'Tepic', 'NAY'),
(126, 'Terminal Colosio de Autobuses en Tepic', 'TPC', 'Tepic', 'NAY'),
(127, 'Central de Autobuses Linares', 'LIN', 'Linares', 'NL'),
(128, 'Central de Autobuses de Monterrey', 'MTY', 'Monterrey', 'NL'),
(129, 'Terminal Monterrey Churubusco', 'MTY', 'Monterrey', 'NL'),
(130, 'Terminal de Autobuses Greyhound Monterrey', 'MTY', 'Monterrey', 'NL'),
(131, 'Terminal de Autobuses Expresso del Noreste en Monterrey', 'MTY', 'Monterrey', 'NL'),
(132, 'Terminal de Autobuses Transpais Monterrey', 'MTY', 'Monterrey', 'NL'),
(133, 'Central de Autobuses de Montemorelos', 'MON', 'Montemorelos', 'NL'),
(134, 'Terminal de Autobuses Noreste Montemorelos', 'MON', 'Montemorelos', 'NL'),
(135, 'Terminal de Autobuses ADO Cancún', 'CUN', 'Cancún', 'QR'),
(136, 'Terminal de Autobuses ADO Chetumal', 'CHE', 'Chetumal', 'QR'),
(137, 'Terminal de Autobuses Alterna Playa del Carmen', 'PCM', 'Playa del Carmen', 'QR'),
(138, 'Terminal de Autobuses ADO Quinta Avenida Playa del Carmen', 'PCM', 'Playa del Carmen', 'QR'),
(139, 'Terminal de Autobuses ADO Tulum', 'TUL', 'Tulum', 'QR'),
(140, 'Central de Autobuses de Ciudad Valles', 'CDV', 'Ciudad Valles', 'SLP'),
(141, 'Central de Autobuses de Matehuala', 'MTL', 'Matehuala', 'SLP'),
(142, 'Terminal Terrestre Potosina', 'TTP', 'San Luis Potosí', 'SLP'),
(143, 'Central de Autobuses de Río Verde', 'RVD', 'Río Verde', 'SLP'),
(144, 'Terminal Tamuín Autobuses Vencedor', 'TMN', 'Tamuín', 'SLP'),
(145, 'Central Internacional de Autobuses de Culiacán', 'CUL', 'Culiacán', 'SIN'),
(146, 'Terminal TAP Guamuchil', 'GUA', 'Guamuchil', 'SIN'),
(147, 'Terminal TUFESA en Guamuchil', 'GUA', 'Guamuchil', 'SIN'),
(148, 'Central de Autobuses de Mazatlán', 'MZT', 'Mazatlán', 'SIN'),
(149, 'Terminal Internacional de Autobuses TUFESA Mazatlán', 'MZT', 'Mazatlán', 'SIN'),
(150, 'Terminal de Autobuses Mazatlán Primera Plus', 'MZT', 'Mazatlán', 'SIN'),
(151, 'Central de Autobuses de Los Mochis', 'MOH', 'Los Mochis', 'SIN'),
(152, 'Terminal TAP en Los Mochis', 'MOH', 'Los Mochis', 'SIN'),
(153, 'Terminal Internacional TUFESA en Los Mochis', 'MOH', 'Los Mochis', 'SIN'),
(154, 'Central de Autobuses de Agua Prieta', 'AGP', 'Agua Prieta', 'SON'),
(155, 'Terminal TUFESA Agua Prieta', 'AGP', 'Agua Prieta', 'SON'),
(156, 'Terminal Ómnibus de México en Caborca', 'CAB', 'Caborca', 'SON'),
(157, 'Central de Autobuses de Ciudad Obregón', 'CIB', 'Ciudad Obregón', 'SON'),
(158, 'Terminal TAP Empalme', 'EMP', 'Empalme', 'SON'),
(159, 'Central de Autobuses de Guaymas', 'GUA', 'Guaymas', 'SON'),
(160, 'Terminal TAP Guaymas', 'GUA', 'Guaymas', 'SON'),
(161, 'Terminal TUFESA Guaymas', 'GUA', 'Guaymas', 'SON'),
(162, 'Central de Autobuses de Hermosillo', 'HMO', 'Hermosillo', 'SON'),
(163, 'Terminal de Autobuses Albatros Hermosillo', 'HMO', 'Hermosillo', 'SON'),
(164, 'Terminal TUFESA Hermosillo', 'HMO', 'Hermosillo', 'SON'),
(165, 'Terminal de Autobuses Albatros Navojoa', 'NAV', 'Navojoa', 'SON'),
(166, 'Terminal TUFESA Navojoa', 'NAV', 'Navojoa', 'SON'),
(167, 'Central de Autobuses de Nogales', 'NOG', 'Nogales', 'SON'),
(168, 'Terminal TAP Nogales', 'NOG', 'Nogales', 'SON'),
(169, 'Terminal TUFESA Nogales', 'NOG', 'Nogales', 'SON'),
(170, 'Terminal de autobuses ADO Villahermosa', 'VSA', 'Villahermosa', 'TAB'),
(171, 'Terminal de autobuses de Cárdenas', 'CAR', 'Cárdenas', 'TAB'),
(172, 'Central de Autobuses de Ciudad Victoria', 'CVT', 'Ciudad Victoria', 'TAM'),
(173, 'Terminal Transpais de Ciudad Mante', 'MAN', 'Ciudad Mante', 'TAM'),
(174, 'Terminal Nuevo Laredo de Estrella Blanca', 'NLD', 'Nuevo Laredo', 'TAM'),
(175, 'Terminal Nuevo Laredo de Ómnibus de México', 'NLD', 'Nuevo Laredo', 'TAM'),
(176, 'Terminal Nuevo Laredo de Grupo Senda', 'NLD', 'Nuevo Laredo', 'TAM'),
(177, 'Central de Autobuses de Matamoros', 'MTM', 'Matamoros', 'TAM'),
(178, 'Central de Autobuses de Reynosa', 'RYN', 'Reynosa', 'TAM'),
(179, 'CAT – Central de Autobuses de Tampico', 'TMP', 'Tampico', 'TAM'),
(180, 'Terminal de Autobuses de Acayucan', 'ACY', 'Acayucan', 'VER'),
(181, 'Central de Autobuses de Coatzacoalcos', 'COA', 'Coatzacoalcos', 'VER'),
(182, 'Terminal de Autobuses ADO Córdoba', 'COR', 'Córdoba', 'VER'),
(183, 'Terminal de Autobuses de Tecolutla', 'TEC', 'Tecolutla', 'VER'),
(184, 'Terminal de autobuses ADO de Tierra Blanca', 'TBL', 'Tierra Blanca', 'VER'),
(185, 'Central de Autobuses de Veracruz – CAVE', 'VER', 'Veracruz', 'VER'),
(186, 'Central de Autobuses de Xalapa – CAXA', 'XAL', 'Xalapa', 'VER'),
(187, 'Central de Autobuses de Fresnillo', 'FRE', 'Fresnillo', 'ZAC'),
(188, 'Central de Autobuses de Zacatecas', 'ZAC', 'Zacatecas', 'ZAC')
GO
--Por si hay que reniciar los inserts (y)
DELETE FROM Ruta
DBCC CHECKIDENT (Ruta, RESEED, 0);

--INSERTS Para Ruta
--INSERTS DE CDMX A TODO EL PAIS
INSERT INTO Ruta (origen_ruta, destino_ruta)
SELECT c1.cve_central AS origen, c2.cve_central AS destino
FROM Central c1, Central c2
WHERE c1.cve_central BETWEEN 21 AND 32
  AND c2.cve_central NOT BETWEEN 78 AND 93;

INSERT INTO Ruta (origen_ruta, destino_ruta)
SELECT c2.cve_central AS origen, c1.cve_central AS destino
FROM Central c1, Central c2
WHERE c1.cve_central BETWEEN 21 AND 32
  AND c2.cve_central NOT BETWEEN 78 AND 93;


SELECT * FROM Ruta
INSERT INTO Ruta (origen_ruta, destino_ruta)
SELECT TOP 100 c1.cve_central, c2.cve_central
FROM Central c1, Central c2
WHERE c1.cve_central IN (21, 22)
AND c2.cve_central BETWEEN 78 AND 93;
INSERT INTO Ruta (origen_ruta, destino_ruta)
SELECT TOP 100 c2.cve_central, c1.cve_central
FROM Central c1, Central c2
WHERE c1.cve_central IN (21, 22)
AND c2.cve_central BETWEEN 78 AND 93;



