Use db_flecha
GO

SELECT descripcion_clase, descripcion_servicio FROM Clase AS c
	INNER JOIN Clase_Servicio AS cs
	ON c.cve_clase = cs.cve_clase
	INNER JOIN Servicio AS s
	ON s.cve_servicio = cs.cve_servicio;

SELECT origen_ruta, origen_viaje, destino_ruta, destino_viaje FROM Ruta AS r
	INNER JOIN Viaje AS v
	ON (r.origen_ruta = 1 OR v.origen_viaje = 1) AND (r.destino_ruta = 2 OR v.destino_viaje = 2);
GO
	CREATE PROCEDURE GetViajes
		@origen_ruta INT,
		@origen_viaje INT,
		@destino_ruta INT,
		@destino_viaje INT
	AS
	BEGIN
		SELECT origen_ruta, origen_viaje, destino_ruta, destino_viaje FROM Ruta AS r
		INNER JOIN Viaje AS v
		ON (r.origen_ruta = @origen_ruta OR v.origen_viaje = @origen_viaje) AND (r.destino_ruta = @destino_ruta OR v.destino_viaje = @destino_viaje);
	END;
	GO

EXEC GetViajes 1, 1, 2, 2;
