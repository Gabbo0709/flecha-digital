Use db_flecha 
GO

SELECT descripcion_clase, descripcion_servicio FROM Clase AS c 
	INNER JOIN Clase_Servicio AS cs
	ON c.cve_clase = cs.cve_clase 
	INNER JOIN Servicio AS s
	ON s.cve_servicio = cs.cve_servicio;