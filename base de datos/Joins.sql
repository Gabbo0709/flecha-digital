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
		@origen_viaje INT,
		@destino_viaje INT,
        @fecha_salida DATE
	AS
	BEGIN
SELECT 
    R.no_servicio,
	L.cve_linea,
    L.nombre_linea,
    V.origen_viaje,
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
AND CONVERT(DATE , V.fecha_salida) = @fecha_salida
GROUP BY 
    R.no_servicio,
    L.nombre_linea,
    V.origen_viaje,
    V.destino_viaje,
    C.descripcion_clase,
    V.fecha_salida,
    V.fecha_llegada,
    TV.descripcion_viaje;
	END
GO

EXEC GetViajes 1, 1, "01/04/2024";
GO

CREATE PROCEDURE GetAsientos
    @origen INT,
    @destino INT,
    @no_servicio INT
AS
BEGIN
    SELECT A.cve_asiento, A.no_asiento, AEV.cve_estado
    FROM Asiento_Edo_Viaje AEV
        JOIN Asiento A ON AEV.cve_asiento = A.cve_asiento
        JOIN Viaje V ON AEV.cve_viaje = V.cve_viaje
        JOIN Ruta R ON V.no_servicio = R.no_servicio
    WHERE V.origen_viaje = @origen AND V.destino_viaje = @destino AND R.no_servicio = @no_servicio
    GROUP BY A.cve_asiento, A.no_asiento, AEV.cve_estado;
END
GO

EXEC GetAsientos 1, 3;
GO
--Corregir, agregar nombre central origen y nombre central destino
CREATE PROCEDURE GetActividad
		@id_usuario INT
AS
BEGIN
    SELECT 
        OV.no_operacion,
        V.no_servicio,
        O.cantidad_boletos,
        (SELECT TOP 1 origen_viaje FROM Viaje WHERE no_servicio = V.no_servicio ORDER BY fecha_salida ASC) AS origen_viaje,
        V.fecha_salida,
        (SELECT TOP 1 destino_viaje FROM Viaje WHERE no_servicio = V.no_servicio ORDER BY fecha_salida DESC) AS destino_viaje
    FROM 
        Operacion_Viaje OV
    INNER JOIN 
        Viaje V ON OV.cve_viaje = V.cve_viaje
	INNER JOIN Operacion O ON OV.no_operacion = O.no_operacion
	WHERE 
		O.id_usuario = @id_usuario;
END
GO

EXEC GetActividad 1;
GO

CREATE PROCEDURE InsertarOperacionYBoletos
    @no_operacion INT,
    @id_usuario INT,
    @cve_metodo INT,
    @cant_boletos INT,
    @costo_total MONEY
AS
BEGIN
    -- Insertar la operación
    INSERT INTO Operacion(no_operacion, id_usuario, cve_metodo, cant_boletos, costo_total)
    VALUES (@no_operacion, @id_usuario, @cve_metodo, @cant_boletos, @costo_total)

    -- Insertar los boletos
    INSERT INTO Boleto(no_boleto, cve_tipo, no_operacion, cve_asiento, cve_estado, nombre_pas, token_fac, no_asiento_boleto, puerta, carril, anden, tel_cliente, costo_boleto)
    SELECT no_boleto, cve_tipo_boleto, @no_operacion, cve_asiento, cve_estado, nombre_pas, token_fac, no_asiento_boleto, puerta, carril, anden, tel_cliente, costo_boleto
    FROM #BoletosTemporales
END
--Se crea tabla temporal para los boletos
CREATE TABLE #BoletosTemporales(
    no_boleto INT,
    cve_tipo_boleto INT,
    cve_asiento INT,
    cve_estado INT,
    nombre_pas NVARCHAR(128),
    token_fac NVARCHAR(128),
    no_asiento_boleto INT,
    puerta NVARCHAR(128),
    carril INT,
    anden INT,
    tel_cliente NUMERIC(12),
    costo_boleto MONEY
)
--Los boletos se insertan en el mismo orden en que se compraron
INSERT INTO #BoletosTemporales VALUES (1, 1, 1, 1, 'Juan Perez', '123456', 1, 'A', 1, 1, 'Efectivo', 1234567890, 100.00) EXEC InsertarOperacionYBoletos 1, 1, 1, 2, 300.00
GO

CREATE PROCEDURE CancelarBoletosPorServicio
    @NoServicio INT
AS
BEGIN
    UPDATE Boleto 
    SET cve_estado = 2
    WHERE no_boleto IN (
        SELECT no_boleto
        FROM Boleto b
        JOIN Operacion o 
        ON b.no_operacion = o.no_operacion
        JOIN Operacion_Viaje ov 
        ON o.no_operacion = ov.no_operacion
        JOIN Viaje v 
        ON ov.cve_viaje = v.cve_viaje
        WHERE v.no_servicio = @NoServicio AND b.cve_estado = 1
    )
END

EXEC CancelarBoletosPorServicio 1;

