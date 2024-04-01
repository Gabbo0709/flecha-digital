Use db_flecha 
GO

--Descripcion tipo boleto
INSERT INTO Tipo_Boleto(descripcion_tipo_boleto) VALUES
('Adulto'),
('Menor'),
('Adulto Mayor'),
('Estudiante')

--estados de asiento
INSERT INTO Estado_Asiento(descripcion_edo_asiento) VALUES
('Disponible'),
('Ocupado')

--descripcion y estado boleto
INSERT INTO Estado_Boleto(descripcion_edo_boleto) VALUES
('Pagado'),
('Pendiente'),
('Cancelado'),
('Reembolsado'),
('Usado')

--Descripcion estados usuario
INSERT INTO Estado_Usuario(descripcion_edo_usuario) VALUES
('Activo'),
('Falta confirmacion'),
('Inactivo'),
('Suspendido')

--Inserts tablas usuarios
INSERT INTO Usuario (nombre_user, apellido, pass, email, tel_user) VALUES 
('Gustavo', 'Garcia', '123', 'e.gus.gg@gmail.com', 5573408674),
('Gabriel', 'Arcos', '123', 'gabbo0709@gmail.com', 5575539391)

--Descripcion de clase
INSERT INTO Clase(descripcion_clase) VALUES
('Economico'),
('SEMI_DIRECTA'),
('Ejecutivo'),
('Primer Select'),
('Primera')

--Descripcion de servicios posibles
INSERT INTO Servicio(descripcion_servicio) VALUES
('No hay servicios disponibles'),
('Aire acondicionado'),
('Toma corriente'),
('Sanitario mixto'),
('Semicama'),
('Luz de lectura'),
('Pantalla general'),
('Wi-Fi')

--Se relaciona la clase son los servicios que ofrece
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


--Tipos de viaje
INSERT INTO Tipo_Viaje(tipo, descripcion_viaje) VALUES
('Local', 'La ruta de este autobús comienza en esta terminal y/o central.'),
('Paso', 'La ruta de este autobús comenzó en otra terminal y/o central, es decir, el autobús realiza una parada en este origen.')


--Insert de lineas
INSERT INTO Linea (cve_linea, nombre_linea, cve_clase)
VALUES
(1, 'Primera Plus', 1),
(2, 'ADO', 2),
(3, 'Linea', 3)


--INSERT de camiones
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


-- INSERTS para la tabla Central

-- Aguascalientes
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES (1, 'Central de Autobuses de Aguascalientes', 'Ags', 'Aguascalientes', 'Aguascalientes');

-- Baja California
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(2, 'Central de Autobuses de Ensenada', 'BC', 'Ensenada', 'Baja California'),
(3, 'Central de Autobuses de Mexicali', 'BC', 'Mexicali', 'Baja California'),
(4, 'Central de Autobuses de Tijuana', 'BC', 'Tijuana', 'Baja California'),
(5, 'Terminal de Autobuses ACN en Ensenada', 'BC', 'Ensenada', 'Baja California'),
(6, 'Terminal de Autobuses ACN Tijuana', 'BC', 'Tijuana', 'Baja California');

-- Baja California Sur
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(7, 'Terminal de Autobuses La Paz Malecón', 'BCS', 'La Paz', 'Baja California Sur'),
(8, 'Terminal de Autobuses San José del Cabo', 'BCS', 'San José del Cabo', 'Baja California Sur');

-- Campeche
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(9, 'Terminal de Autobuses ADO Campeche', 'Camp', 'Campeche', 'Campeche'),
(10, 'Terminal de Autobuses ADO Ciudad del Carmen', 'Camp', 'Ciudad del Carmen', 'Campeche'),
(11, 'Viajes Medher Ciudad del Carmen', 'Camp', 'Ciudad del Carmen', 'Campeche'),
(12, 'Terminal de Autobuses Champoton', 'Camp', 'Champoton', 'Campeche'),
(13, 'Terminal de Autobuses de Escarcega', 'Camp', 'Escarcega', 'Campeche');

-- Chihuahua
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(14, 'Central de Autobuses de Ciudad Juárez', 'Chih', 'Ciudad Juárez', 'Chihuahua'),
(15, 'Terminal de Autobuses Ciudad Cuauhtémoc', 'Chih', 'Ciudad Cuauhtémoc', 'Chihuahua'),
(16, 'Central de Autobuses de Chihuahua', 'Chih', 'Chihuahua', 'Chihuahua'),
(17, 'Terminal Estrella Blanca Delicias', 'Chih', 'Delicias', 'Chihuahua'),
(18, 'Terminal Ómnibus de México Delicias', 'Chih', 'Delicias', 'Chihuahua'),
(19, 'Terminal Ómnibus de México Ojinaga', 'Chih', 'Ojinaga', 'Chihuahua'),
(20, 'Central de Autobuses Parral', 'Chih', 'Parral', 'Chihuahua');


-- Ciudad de México CDMX
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(21, 'Central de Autobuses del Norte', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(22, 'Central de Autobuses del Poniente', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(23, 'Central de Autobuses del Sur', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(24, 'Terminal de Autobuses de Pasajeros de Oriente TAPO', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(25, 'Terminal Primera Plus Coapa – Calzada del Hueso', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(26, 'Terminal Indios Verdes autobuses ADO', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(27, 'Terminal Indios Verdes Autobuses Futura', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(28, 'Terminal de Autobuses Coordinados de Nayarit CDMX', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(29, 'Terminal Oasis de autobuses Santa Martha Acatitla', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(30, 'Terminal ADO Santa Martha Acatitla', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(31, 'Terminal Balbuena de autobuses TLA', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(32, 'Viajes Medher Ciudad de México', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(33, 'Terminal Balbuena AU', 'CDMX', 'Ciudad de México', 'Ciudad de México'),
(34, 'Aeropuerto Internacional de la Ciudad de México', 'CDMX', 'Ciudad de México', 'Ciudad de México');

-- Coahuila
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(35, 'Central de Autobuses de Saltillo', 'Coah', 'Saltillo', 'Coahuila'),
(36, 'Central de Autobuses de Torreón', 'Coah', 'Torreón', 'Coahuila'),
(37, 'Central de Autobuses de Monclova', 'Coah', 'Monclova', 'Coahuila'),
(38, 'Central de Autobuses de Piedras Negras', 'Coah', 'Piedras Negras', 'Coahuila'),
(39, 'Terminal de Autobuses en Ramos Arizpe', 'Coah', 'Ramos Arizpe', 'Coahuila');

-- Colima
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(40, 'Central de Autobuses de Colima', 'Col', 'Colima', 'Colima'),
(41, 'Central de Autobuses de Manzanillo', 'Col', 'Manzanillo', 'Colima'),
(42, 'Central de Autobuses de Tecoman', 'Col', 'Tecoman', 'Colima');

-- Durango
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(43, 'Central de Autobuses de Durango', 'Dgo', 'Durango', 'Durango'),
(44, 'Central de Autobuses de Gómez Palacio', 'Dgo', 'Gómez Palacio', 'Durango'),
(45, 'Terminal de autobuses Santiago Papasquiaro', 'Dgo', 'Santiago Papasquiaro', 'Durango');

-- Estado de México
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(46, 'Central de Autobuses de Atlacomulco', 'EdoMex', 'Atlacomulco', 'Estado de México'),
(47, 'Terminal SENDA en Cuautitlán – Tepotzotlán', 'EdoMex', 'Cuautitlán', 'Estado de México'),
(48, 'Terminal ADO Ixtapaluca', 'EdoMex', 'Ixtapaluca', 'Estado de México'),
(49, 'Terminal de Autobuses Ixtapan de la Sal', 'EdoMex', 'Ixtapan de la Sal', 'Estado de México'),
(50, 'Terminal de Autobuses ADO Tlalnepantla', 'EdoMex', 'Tlalnepantla', 'Estado de México'),
(51, 'Central de Autobuses Tepotzotlán', 'EdoMex', 'Tepotzotlán', 'Estado de México'),
(52, 'Terminal Toluca', 'EdoMex', 'Toluca', 'Estado de México'),
(53, 'Terminal Primera Plus Ecatepec', 'EdoMex', 'Ecatepec', 'Estado de México'),
(54, 'Central de Autobuses Valle de Bravo', 'EdoMex', 'Valle de Bravo', 'Estado de México');

-- Guanajuato
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(55, 'Central de Autobuses de Celaya', 'Gto', 'Celaya', 'Guanajuato'),
(56, 'Central de Autobuses de Comonfort', 'Gto', 'Comonfort', 'Guanajuato'),
(57, 'Central de Autobuses de Dolores Hidalgo', 'Gto', 'Dolores Hidalgo', 'Guanajuato'),
(58, 'Central de Autobuses de Guanajuato', 'Gto', 'Guanajuato', 'Guanajuato'),
(59, 'Central de Autobuses de Irapuato', 'Gto', 'Irapuato', 'Guanajuato'),
(60, 'Central de Autobuses de León', 'Gto', 'León', 'Guanajuato'),
(61, 'Central de Autobuses de Salamanca', 'Gto', 'Salamanca', 'Guanajuato'),
(62, 'Central de Autobuses de San Luis de la Paz', 'Gto', 'San Luis de la Paz', 'Guanajuato'),
(63, 'Central de Autobuses de San Miguel de Allende', 'Gto', 'San Miguel de Allende', 'Guanajuato');

-- Guerrero
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(64, 'Terminal de autobuses Acapulco Centro', 'Gro', 'Acapulco', 'Guerrero'),
(65, 'Terminal de Autobuses Estrella de Oro Acapulco Costera', 'Gro', 'Acapulco', 'Guerrero'),
(66, 'Terminal de autobuses Acapulco Ejido', 'Gro', 'Acapulco', 'Guerrero'),
(67, 'Terminal Estrella de Oro Acapulco Diamante', 'Gro', 'Acapulco', 'Guerrero'),
(68, 'Terminal de Autobuses Estrella Roja del Sur Acapulco Diamante', 'Gro', 'Acapulco', 'Guerrero'),
(69, 'Terminal de lujo de autobuses Acapulco Papagayo', 'Gro', 'Acapulco', 'Guerrero'),
(70, 'Central de Autobuses de Atoyac', 'Gro', 'Atoyac', 'Guerrero'),
(71, 'Central de Autobuses de Iguala', 'Gro', 'Iguala', 'Guerrero'),
(72, 'Terminal de Autobuses Estrella de Oro Iguala', 'Gro', 'Iguala', 'Guerrero'),
(73, 'Terminal de Autobuses Costa Line Chilpancingo', 'Gro', 'Chilpancingo', 'Guerrero'),
(74, 'Terminal de autobuses Estrella de Oro Chilpancingo', 'Gro', 'Chilpancingo', 'Guerrero'),
(75, 'Central de Autobuses de Zihuatanejo', 'Gro', 'Zihuatanejo', 'Guerrero'),
(76, 'Terminal de Autobuses Estrella de Oro Zihuatanejo', 'Gro', 'Zihuatanejo', 'Guerrero');

-- Hidalgo
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(77, 'Central de Autobuses de Ixmiquilpan', 'Hgo', 'Ixmiquilpan', 'Hidalgo'),
(78, 'Central de Autobuses de Pachuca', 'Hgo', 'Pachuca', 'Hidalgo'),
(79, 'Terminal de autobuses Villas de Pachuca', 'Hgo', 'Pachuca', 'Hidalgo'),
(80, 'Central de Autobuses de Tula', 'Hgo', 'Tula', 'Hidalgo'),
(81, 'Central de Autobuses de Tulancingo', 'Hgo', 'Tulancingo', 'Hidalgo'),
(82, 'Terminal de Autobuses Huejutla', 'Hgo', 'Huejutla', 'Hidalgo'),
(83, 'Terminal de Autobuses ADO Huejutla', 'Hgo', 'Huejutla', 'Hidalgo');

-- Jalisco
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(84, 'Terminal de Autobuses Primera Plus en Autlán', 'Jal', 'Autlán', 'Jalisco'),
(85, 'Central de Autobuses de Ciudad Guzmán', 'Jal', 'Ciudad Guzmán', 'Jalisco'),
(86, 'Antigua Central de Autobuses de Guadalajara', 'Jal', 'Guadalajara', 'Jalisco'),
(87, 'Central Nueva de Autobuses de Guadalajara', 'Jal', 'Guadalajara', 'Jalisco'),
(88, 'Terminal Guadalajara de Autobuses Vallarta Plus', 'Jal', 'Guadalajara', 'Jalisco'),
(89, 'Terminal Portal del Calzado Guadalajara', 'Jal', 'Guadalajara', 'Jalisco'),
(90, 'Central de Autobuses Lagos de Moreno', 'Jal', 'Lagos de Moreno', 'Jalisco'),
(91, 'Central de Autobuses Magdalena', 'Jal', 'Magdalena', 'Jalisco'),
(92, 'Central de Autobuses de Puerto Vallarta', 'Jal', 'Puerto Vallarta', 'Jalisco'),
(93, 'Terminal de Autobuses Vallarta Plus en Puerto Vallarta', 'Jal', 'Puerto Vallarta', 'Jalisco'),
(94, 'Central de Autobuses de San Juan de los Lagos', 'Jal', 'San Juan de los Lagos', 'Jalisco'),
(95, 'Terminal de Autobuses de Tamazula de Gordiano', 'Jal', 'Tamazula de Gordiano', 'Jalisco'),
(96, 'Terminal de Autobuses de Tequila', 'Jal', 'Tequila', 'Jalisco'),
(97, 'Central de Autobuses de Tepatitlán', 'Jal', 'Tepatitlán', 'Jalisco'),
(98, 'Terminal de Autobuses Tlaquepaque Periférico Sur Tren Ligero', 'Jal', 'Tlaquepaque', 'Jalisco'),
(99, 'Terminal Zapopan de Autobuses', 'Jal', 'Zapopan', 'Jalisco'),
(100, 'Terminal de Autobuses Nuevo Milenio de Zapopan', 'Jal', 'Zapopan', 'Jalisco');

-- Michoacán
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(101, 'Terminal de Autobuses 4 Caminos', 'Mich', '4 Caminos', 'Michoacán'),
(102, 'Terminal de autobuses en Apatzingán', 'Mich', 'Apatzingán', 'Michoacán'),
(103, 'Terminal de Autobuses Morelia TAM', 'Mich', 'Morelia', 'Michoacán'),
(104, 'Central de Autobuses de Lázaro Cárdenas', 'Mich', 'Lázaro Cárdenas', 'Michoacán'),
(105, 'Terminal de Autobuses de Maravatio', 'Mich', 'Maravatio', 'Michoacán'),
(106, 'Central de Autobuses de Pátzcuaro', 'Mich', 'Pátzcuaro', 'Michoacán'),
(107, 'Central de Autobuses de la Piedad', 'Mich', 'La Piedad', 'Michoacán'),
(108, 'Terminal Primera Plus Sahuayo', 'Mich', 'Sahuayo', 'Michoacán'),
(109, 'Central de Autobuses de Uruapan', 'Mich', 'Uruapan', 'Michoacán'),
(110, 'Terminal de Autobuses de Zacapú', 'Mich', 'Zacapú', 'Michoacán'),
(111, 'Central de Autobuses de Zamora', 'Mich', 'Zamora', 'Michoacán'),
(112, 'Central de Autobuses de Zitacuaro', 'Mich', 'Zitacuaro', 'Michoacán');

-- Morelos
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(113, 'Terminal de Autobuses OCC Cuautla', 'Mor', 'Cuautla', 'Morelos'),
(114, 'Terminal de Autobuses Oro Cuautla', 'Mor', 'Cuautla', 'Morelos'),
(115, 'Terminal de Autobuses Pullman de Morelos Cuautla', 'Mor', 'Cuautla', 'Morelos'),
(116, 'Terminal de Autobuses TER y Futura en Cuautla', 'Mor', 'Cuautla', 'Morelos'),
(117, 'Terminal Cuernavaca Casino de la Selva', 'Mor', 'Cuernavaca', 'Morelos'),
(118, 'Terminal de Autobuses Estrella Blanca Cuernavaca', 'Mor', 'Cuernavaca', 'Morelos'),
(119, 'Terminal de Autobuses Estrella de Oro Cuernavaca', 'Mor', 'Cuernavaca', 'Morelos'),
(120, 'Terminal Centro de autobuses Pullman de Morelos en Cuernavaca', 'Mor', 'Cuernavaca', 'Morelos'),
(121, 'Terminal de autobuses TER en Cuernavaca', 'Mor', 'Cuernavaca', 'Morelos');

-- Nayarit
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(122, 'Terminal Nuevo Vallarta de Autobuses ETN / TAP', 'Nay', 'Nuevo Vallarta', 'Nayarit'),
(123, 'Terminal de Autobuses Primera Plus Nuevo Vallarta', 'Nay', 'Nuevo Vallarta', 'Nayarit'),
(124, 'Terminal Nuevo Vallarta de Autobuses Vallarta Plus', 'Nay', 'Nuevo Vallarta', 'Nayarit'),
(125, 'Oficina autobuses Pacifico en la Peñita de Jaltemba', 'Nay', 'La Peñita de Jaltemba', 'Nayarit'),
(126, 'Oficina Vallarta Plus Peñita de Jaltemba', 'Nay', 'La Peñita de Jaltemba', 'Nayarit'),
(127, 'Terminal de Autobuses San Blas', 'Nay', 'San Blas', 'Nayarit'),
(128, 'Central de Autobuses de Tepic', 'Nay', 'Tepic', 'Nayarit'),
(129, 'Terminal de Autobuses Coordinados de Nayarit en Tepic', 'Nay', 'Tepic', 'Nayarit'),
(130, 'Terminal de Autobuses Tepic Plus en Tepic (centro)', 'Nay', 'Tepic', 'Nayarit'),
(131, 'Terminal de Autobuses Tufesa en Tepic', 'Nay', 'Tepic', 'Nayarit'),
(132, 'Terminal Colosio de Autobuses en Tepic', 'Nay', 'Tepic', 'Nayarit');

-- Nuevo León
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(133, 'Central de Autobuses Linares', 'NL', 'Linares', 'Nuevo León'),
(134, 'Central de Autobuses de Monterrey', 'NL', 'Monterrey', 'Nuevo León'),
(135, 'Terminal Monterrey Churubusco', 'NL', 'Monterrey', 'Nuevo León'),
(136, 'Terminal de Autobuses Greyhound Monterrey', 'NL', 'Monterrey', 'Nuevo León'),
(137, 'Terminal de Autobuses Expresso del Noreste en Monterrey', 'NL', 'Monterrey', 'Nuevo León'),
(138, 'Terminal de Autobuses Transpais Monterrey', 'NL', 'Monterrey', 'Nuevo León'),
(139, 'Central de Autobuses de Montemorelos', 'NL', 'Montemorelos', 'Nuevo León'),
(140, 'Terminal de Autobuses Noreste Montemorelos', 'NL', 'Montemorelos', 'Nuevo León');

-- Oaxaca
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(141, 'Terminal de Autobuses ADO Huajuapan de León', 'Oax', 'Huajuapan de León', 'Oaxaca'),
(142, 'Terminal ORO en Huajuapan de León', 'Oax', 'Huajuapan de León', 'Oaxaca'),
(143, 'Terminal de Autobuses ADO Huatulco', 'Oax', 'Huatulco', 'Oaxaca'),
(144, 'Terminal de Autobuses Altamar Huatulco', 'Oax', 'Huatulco', 'Oaxaca'),
(145, 'Terminal de Autobuses de Juchitán', 'Oax', 'Juchitán', 'Oaxaca'),
(146, 'Terminal de Autobuses ADO Oaxaca', 'Oax', 'Oaxaca', 'Oaxaca'),
(147, 'Terminal de Autobuses Oaxaca Periférico', 'Oax', 'Oaxaca', 'Oaxaca'),
(148, 'Terminal Expressos Colombo Oaxaca', 'Oax', 'Oaxaca', 'Oaxaca'),
(149, 'Terminal de Autobuses de Pochutla', 'Oax', 'Pochutla', 'Oaxaca'),
(150, 'Terminal de Autobuses Puerto Escondido', 'Oax', 'Puerto Escondido', 'Oaxaca'),
(151, 'Central de Autobuses de Puerto Escondido', 'Oax', 'Puerto Escondido', 'Oaxaca'),
(152, 'Terminal de Autobuses AU Santa Rosa', 'Oax', 'Santa Rosa', 'Oaxaca'),
(153, 'Terminal ADO de Salina Cruz', 'Oax', 'Salina Cruz', 'Oaxaca'),
(154, 'Terminal de Autobuses SUR en Salina Cruz', 'Oax', 'Salina Cruz', 'Oaxaca'),
(155, 'Terminal de Autobuses ADO Tehuantepec', 'Oax', 'Tehuantepec', 'Oaxaca'),
(156, 'Terminal de Autobuses ADO Tuxtepec', 'Oax', 'Tuxtepec', 'Oaxaca');

-- Puebla
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(157, 'Terminal de Autobuses Oro en Acatlán de Osorio', 'Pue', 'Acatlán de Osorio', 'Puebla'),
(158, 'Terminal de Autobuses de Atlixco', 'Pue', 'Atlixco', 'Puebla'),
(159, 'Terminal ATAH Chignahuapan', 'Pue', 'Chignahuapan', 'Puebla'),
(160, 'Central de Autobuses Nueva en Huauchinango', 'Pue', 'Huauchinango', 'Puebla'),
(161, 'Terminal de Autobuses Oro en Izucar de Matamoros', 'Pue', 'Izucar de Matamoros', 'Puebla'),
(162, 'Central de Autobuses de Puebla CAPU', 'Pue', 'Puebla', 'Puebla'),
(163, 'Central de Autobuses Puebla CAP', 'Pue', 'Puebla', 'Puebla'),
(164, 'Viajes Medher Puebla', 'Pue', 'Puebla', 'Puebla'),
(165, 'Terminal Paseo Destino Puebla', 'Pue', 'Puebla', 'Puebla'),
(166, 'Terminal de Autobuses ORO Puebla', 'Pue', 'Puebla', 'Puebla'),
(167, 'Terminal de Autobuses en San Martín Texmelucan', 'Pue', 'San Martín Texmelucan', 'Puebla'),
(168, 'Terminal de Autobuses de Tehuacán', 'Pue', 'Tehuacán', 'Puebla'),
(169, 'Terminal de Autobuses ADO Teziutlán', 'Pue', 'Teziutlán', 'Puebla'),
(170, 'Central de Autobuses de Zacatlán', 'Pue', 'Zacatlán', 'Puebla'),
(171, 'Terminal de Autobuses ADO Zaragoza', 'Pue', 'Zaragoza', 'Puebla');

-- Querétaro
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(172, 'TAQ – Terminal de Autobuses Querétaro', 'Qro', 'Querétaro', 'Querétaro'),
(173, 'Terminal Norte de Autobuses de Querétaro 5 de Febrero', 'Qro', 'Querétaro', 'Querétaro'),
(174, 'Central de Autobuses de San Juan del Río', 'Qro', 'San Juan del Río', 'Querétaro'),
(175, 'Central de Autobuses de Tequisquiapan', 'Qro', 'Tequisquiapan', 'Querétaro');

-- Quintana Roo
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(176, 'Terminal de Autobuses ADO Cancún', 'Q. Roo', 'Cancún', 'Quintana Roo'),
(177, 'Terminal de Autobuses ADO Chetumal', 'Q. Roo', 'Chetumal', 'Quintana Roo'),
(178, 'Terminal de Autobuses Alterna Playa del Carmen', 'Q. Roo', 'Playa del Carmen', 'Quintana Roo'),
(179, 'Terminal de Autobuses ADO Quinta Avenida Playa del Carmen', 'Q. Roo', 'Playa del Carmen', 'Quintana Roo'),
(180, 'Terminal de Autobuses ADO Tulum', 'Q. Roo', 'Tulum', 'Quintana Roo');

-- San Luis Potosí
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(181, 'Central de Autobuses de Ciudad Valles', 'SLP', 'Ciudad Valles', 'San Luis Potosí'),
(182, 'Central de Autobuses de Matehuala', 'SLP', 'Matehuala', 'San Luis Potosí'),
(183, 'Terminal Terrestre Potosina', 'SLP', 'San Luis Potosí', 'San Luis Potosí'),
(184, 'Central de Autobuses de Río Verde', 'SLP', 'Río Verde', 'San Luis Potosí'),
(185, 'Terminal Tamuín Autobuses Vencedor', 'SLP', 'Tamuín', 'San Luis Potosí');

-- Sinaloa
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(186, 'Central Internacional de Autobuses de Culiacán', 'Sin', 'Culiacán', 'Sinaloa'),
(187, 'Terminal TAP Guamuchil', 'Sin', 'Guamuchil', 'Sinaloa'),
(188, 'Terminal TUFESA en Guamuchil', 'Sin', 'Guamuchil', 'Sinaloa'),
(189, 'Central de Autobuses de Mazatlán', 'Sin', 'Mazatlán', 'Sinaloa'),
(190, 'Terminal Internacional de Autobuses TUFESA Mazatlán', 'Sin', 'Mazatlán', 'Sinaloa'),
(191, 'Terminal de Autobuses Mazatlán Primera Plus', 'Sin', 'Mazatlán', 'Sinaloa'),
(192, 'Central de Autobuses de Los Mochis', 'Sin', 'Los Mochis', 'Sinaloa'),
(193, 'Terminal TAP en Los Mochis', 'Sin', 'Los Mochis', 'Sinaloa'),
(194, 'Terminal Internacional TUFESA en Los Mochis', 'Sin', 'Los Mochis', 'Sinaloa');

-- Sonora
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(195, 'Central de Autobuses de Agua Prieta', 'Son', 'Agua Prieta', 'Sonora'),
(196, 'Terminal TUFESA Agua Prieta', 'Son', 'Agua Prieta', 'Sonora'),
(197, 'Terminal Ómnibus de México en Caborca', 'Son', 'Caborca', 'Sonora'),
(198, 'Central de Autobuses de Ciudad Obregón', 'Son', 'Ciudad Obregón', 'Sonora'),
(199, 'Terminal TAP Empalme', 'Son', 'Empalme', 'Sonora'),
(200, 'Central de Autobuses de Guaymas', 'Son', 'Guaymas', 'Sonora'),
(201, 'Terminal TAP Guaymas', 'Son', 'Guaymas', 'Sonora'),
(202, 'Terminal TUFESA Guaymas', 'Son', 'Guaymas', 'Sonora'),
(203, 'Central de Autobuses de Hermosillo', 'Son', 'Hermosillo', 'Sonora'),
(204, 'Terminal de Autobuses Albatros Hermosillo', 'Son', 'Hermosillo', 'Sonora'),
(205, 'Terminal TUFESA Hermosillo', 'Son', 'Hermosillo', 'Sonora'),
(206, 'Terminal de Autobuses Albatros Navojoa', 'Son', 'Navojoa', 'Sonora'),
(207, 'Terminal TUFESA Navojoa', 'Son', 'Navojoa', 'Sonora'),
(208, 'Central de Autobuses de Nogales', 'Son', 'Nogales', 'Sonora'),
(209, 'Terminal TAP Nogales', 'Son', 'Nogales', 'Sonora'),
(210, 'Terminal TUFESA Nogales', 'Son', 'Nogales', 'Sonora');

-- Tabasco
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(211, 'Terminal de autobuses ADO Villahermosa', 'Tab', 'Villahermosa', 'Tabasco'),
(212, 'Terminal de autobuses de Cárdenas', 'Tab', 'Cárdenas', 'Tabasco');

-- Tamaulipas
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(213, 'Central de Autobuses de Ciudad Victoria', 'Tamps', 'Ciudad Victoria', 'Tamaulipas'),
(214, 'Terminal Transpais de Ciudad Mante', 'Tamps', 'Ciudad Mante', 'Tamaulipas'),
(215, 'Terminal Nuevo Laredo de Estrella Blanca', 'Tamps', 'Nuevo Laredo', 'Tamaulipas'),
(216, 'Terminal Nuevo Laredo de Ómnibus de México', 'Tamps', 'Nuevo Laredo', 'Tamaulipas'),
(217, 'Terminal Nuevo Laredo de Grupo Senda', 'Tamps', 'Nuevo Laredo', 'Tamaulipas'),
(218, 'Central de Autobuses de Matamoros', 'Tamps', 'Matamoros', 'Tamaulipas'),
(219, 'Central de Autobuses de Reynosa', 'Tamps', 'Reynosa', 'Tamaulipas'),
(220, 'CAT – Central de Autobuses de Tampico', 'Tamps', 'Tampico', 'Tamaulipas');

-- Veracruz
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(221, 'Terminal de Autobuses de Acayucan', 'Ver', 'Acayucan', 'Veracruz'),
(222, 'Central de Autobuses de Coatzacoalcos', 'Ver', 'Coatzacoalcos', 'Veracruz'),
(223, 'Terminal de Autobuses ADO Córdoba', 'Ver', 'Córdoba', 'Veracruz'),
(224, 'Terminal de Autobuses de Tecolutla', 'Ver', 'Tecolutla', 'Veracruz'),
(225, 'Terminal de autobuses ADO de Tierra Blanca', 'Ver', 'Tierra Blanca', 'Veracruz'),
(226, 'Central de Autobuses de Veracruz – CAVE', 'Ver', 'Veracruz', 'Veracruz'),
(227, 'Central de Autobuses de Xalapa – CAXA', 'Ver', 'Xalapa', 'Veracruz');

-- Zacatecas
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado) 
VALUES 
(228, 'Central de Autobuses de Fresnillo', 'Zac', 'Fresnillo', 'Zacatecas'),
(229, 'Central de Autobuses de Zacatecas', 'Zac', 'Zacatecas', 'Zacatecas');

--Yucatán
INSERT INTO Central (cve_central, nombre_central, abreviatura, municipio, estado)
VALUES
(230, 'Terminal de Autobuses ADO Mérida', 'Yuc', 'Mérida', 'Yucatán'),
(231, 'Terminal de Autobuses ADO Progreso', 'Yuc', 'Progreso', 'Yucatán'),
(232, 'Terminal de Autobuses ADO Valladolid', 'Yuc', 'Valladolid', 'Yucatán');

--Abreviatura en mayuscula
UPDATE Central 
SET abreviatura = UPPER(abreviatura);

--xd
DELETE FROM Servicio_Viaje
DBCC CHECKIDENT (Servicio_Viaje, RESEED, 0);

--INSERT tabla Servicio_Viaje

--Origen: Central del Norte a los posibles destinos
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    21 as origen_servicio,
    c.cve_central as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Aguascalientes', 'Querétaro', 'Hidalgo', 'Estado de México', 'Michoacán', 'Jalisco', 'Colima', 'San Luis Potosí', 'Tamaulipas', 'Zacatecas', 'Nuevo León', 'Durango', 'Nayarit', 'Sinaloa', 'Coahuila', 'Chihuahua', 'Sonora', 'Baja California', 'Yucatán');

--Destino: Central del Norte
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    c.cve_central as origen_servicio,
    21 as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Aguascalientes','Querétaro', 'Hidalgo', 'Estado de México', 'Michoacán', 'Jalisco', 'Colima', 'San Luis Potosí', 'Tamaulipas', 'Zacatecas', 'Nuevo León', 'Durango', 'Nayarit', 'Sinaloa', 'Coahuila', 'Chihuahua', 'Sonora', 'Baja California', 'Yucatán');

--Origen: Central Poniente
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    22 as origen_servicio,
    c.cve_central as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Aguascalientes','Guerrero', 'Michoacán', 'Colima', 'Jalisco', 'Nayarit', 'Guanajuato', 'Sinaloa', 'Durango');
--Destino: Central Poniente
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    c.cve_central as origen_servicio,
    22 as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Aguascalientes','Guerrero', 'Michoacán', 'Colima', 'Jalisco', 'Nayarit', 'Guanajuato', 'Sinaloa', 'Durango');

--Origen: Central del Sur
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    23 as origen_servicio,
    c.cve_central as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Puebla', 'Morelos', 'Guerrero', 'Oaxaca', 'Veracruz');
--Destino: Central del Sur
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    c.cve_central as origen_servicio,
    23 as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Puebla', 'Morelos', 'Guerrero', 'Oaxaca', 'Veracruz');

--Origen Oriente(TAPO) a los posibles destinos
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    24 as origen_servicio,
    c.cve_central as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Hidalgo', 'Tlaxcala', 'Morelos', 'Puebla', 'Oaxaca', 'Chiapas', 'Tabasco', 'Campeche', 'Quintana Roo', 'Veracruz', 'Yucatan');
--Destino la TAPO
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    c.cve_central as origen_servicio,
    24 as destino_servicio
FROM 
    Central c
WHERE 
    c.estado IN ('Hidalgo', 'Tlaxcala', 'Morelos', 'Puebla', 'Oaxaca', 'Chiapas', 'Tabasco', 'Campeche', 'Quintana Roo', 'Veracruz', 'Yucatan');

--Inserts de Estados en la zona SurEste del Pais(a partir de aqui se intenta comprobar si ya existe una ruta para evitar repetir filas
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Chiapas', 'Tabasco', 'Campeche', 'Yucatan', 'Quintana Roo', 'Guerrero', 'Puebla', 'Veracruz')
    AND destino.estado IN ('Chiapas', 'Tabasco', 'Campeche', 'Yucatan', 'Quintana Roo', 'Guerrero', 'Puebla', 'Veracruz')
    AND origen.cve_central <> destino.cve_central
	AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );

--Zona Sur 
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Oaxaca', 'Guerrero', 'Veracruz', 'Puebla')
    AND destino.estado IN ('Oaxaca', 'Guerrero', 'Veracruz', 'Puebla')
    AND origen.cve_central <> destino.cve_central
    AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );

--Zona Centro 
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Guerrero', 'Michoacán', 'Colima', 'Jalisco', 'Querétaro', 'Hidalgo', 'Morelos', 'Veracruz')
    AND destino.estado IN ('Guerrero', 'Michoacán', 'Colima', 'Jalisco', 'Querétaro', 'Hidalgo', 'Morelos', 'Veracruz')
    AND origen.cve_central <> destino.cve_central
    AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );

--Zona arribita del centro
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Aguascalientes','Colima', 'Jalisco', 'Guanajuato', 'Querétaro', 'Hidalgo', 'Nayarit', 'San Luis Potosí', 'Veracruz')
    AND destino.estado IN ('Aguascalientes','Colima', 'Jalisco', 'Guanajuato', 'Querétaro', 'Hidalgo', 'Nayarit', 'San Luis Potosí', 'Veracruz')
    AND origen.cve_central <> destino.cve_central
    AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );

--Zona Norte
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Aguascalientes','Sinaloa', 'Durango', 'San Luis Potosí', 'Jalisco', 'Tamaulipas', 'Nuevo León', 'Zacatecas', 'Durango')
    AND destino.estado IN ('Aguascalientes','Sinaloa', 'Durango', 'San Luis Potosí', 'Jalisco', 'Tamaulipas', 'Nuevo León', 'Zacatecas', 'Durango')
    AND origen.cve_central <> destino.cve_central
    AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );

--Zona más Norte(y)
INSERT INTO Servicio_Viaje (origen_servicio, destino_servicio)
SELECT 
    origen.cve_central as origen_servicio,
    destino.cve_central as destino_servicio
FROM 
    Central origen
CROSS JOIN
    Central destino
WHERE 
    origen.estado IN ('Aguascalientes','Sinaloa', 'Durango', 'Coahuila', 'Chihuahua', 'Sonora', 'Baja California', 'Baja California Sur')
    AND destino.estado IN ('Aguascalientes','Sinaloa', 'Durango', 'Coahuila', 'Chihuahua', 'Sonora', 'Baja California', 'Baja California Sur')
    AND origen.cve_central <> destino.cve_central
    AND NOT EXISTS (
        SELECT 1 
        FROM Servicio_Viaje 
        WHERE origen_servicio = origen.cve_central 
        AND destino_servicio = destino.cve_central
    );
GO


--Ayuda dios

