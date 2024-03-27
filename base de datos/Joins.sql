Use db_flecha
GO


SELECT descripcion_clase, descripcion_servicio, nombre_linea FROM Linea AS l
	INNER JOIN Clase AS c
	ON l.cve_clase = c.cve_clase
	INNER JOIN Clase_Servicio AS cs
	ON c.cve_clase = cs.cve_clase
	INNER JOIN Servicio AS s
	ON cs.cve_servicio = s.cve_servicio
	WHERE cve_linea = 1;
GO


CREATE PROCEDURE GetViajes
		@origen_ruta INT,
		@origen_viaje INT,
		@destino_ruta INT,
		@destino_viaje INT,
		@cve_ruta INT
	AS
	BEGIN
SELECT 
    R.no_servicio,
    L.nombre_linea,
    R.origen_ruta,
    V.origen_viaje,
    R.destino_ruta,
    V.destino_viaje,
    C.descripcion_clase,
    V.fecha_salida,
    V.fecha_llegada,
    STRING_AGG(S.descripcion_servicio, ', ') AS descripcion_servicio,
    TV.descripcion_viaje
FROM 
    Viaje V
JOIN 
    Ruta R ON V.no_servicio = R.no_servicio
JOIN 
    Camion CM ON R.id_camion = CM.id_camion
JOIN 
    Linea L ON CM.cve_linea = L.cve_linea
JOIN 
    Clase C ON L.cve_clase = C.cve_clase
JOIN 
    Clase_Servicio CS ON C.cve_clase = CS.cve_clase
JOIN 
    Servicio S ON CS.cve_servicio = S.cve_servicio
JOIN 
    Tipo_Viaje TV ON V.cve_tipo = TV.cve_tipo
WHERE (V.origen_viaje = @origen_viaje AND V.destino_viaje = @destino_viaje)
GROUP BY 
    R.no_servicio,
    L.nombre_linea,
    R.origen_ruta,
    V.origen_viaje,
    R.destino_ruta,
    V.destino_viaje,
    C.descripcion_clase,
    V.fecha_salida,
    V.fecha_llegada,
    TV.descripcion_viaje;
	END;
GO
