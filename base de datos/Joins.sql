Use db_flecha
GO


SELECT descripcion_clase, descripcion_servicio, nombre_linea FROM Linea AS l
	INNER JOIN Clase AS c
	ON l.cve_clase = c.cve_clase
	INNER JOIN Clase_Servicio AS cs
	ON c.cve_clase = cs.cve_clase
	INNER JOIN Servicio AS s
	ON cs.cve_servicio = s.cve_servicio
	WHERE cve_linea = 2;
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
CREATE PROCEDURE GetActividadUsuario
    @id_usuario INT
AS
BEGIN
    SELECT 
        O.no_operacion,
        O.cant_boletos,
        CO.nombre_central AS central_origen,
        CD.nombre_central AS central_destino,
        AU.fecha_salida
    FROM 
        Operacion O
    INNER JOIN 
        Actividad_Usuario AU ON O.no_operacion = AU.no_operacion
    INNER JOIN 
        Central CO ON AU.cve_central_origen = CO.cve_central
    INNER JOIN 
        Central CD ON AU.cve_central_destino = CD.cve_central
    WHERE
        O.id_usuario = @id_usuario;
END;

EXEC GetActividad 1;
GO

CREATE PROCEDURE GuardarUsuarioYToken
    @nombre_user NVARCHAR(128),
    @apellido NVARCHAR(128),
    @pass NVARCHAR(256),
    @email NVARCHAR(128),
    @tel_user NUMERIC(10),
    @token_usuario NVARCHAR(128)
AS
BEGIN
    INSERT INTO Usuario(nombre_user, apellido, pass, email, tel_user)
    VALUES (@nombre_user, @apellido, @pass, @email, @tel_user)

    INSERT INTO Token(token_usuario, id_usuario)
    VALUES (@token_usuario, SCOPE_IDENTITY())
END
GO

CREATE PROCEDURE InsertarOperacionYBoletos
    @no_operacion INT,
    @id_usuario INT,
    @cve_metodo INT,
    @cant_boletos INT,
    @costo_total MONEY,
    @cve_central_origen INT,
    @cve_central_destino INT,
    @fecha_salida DATETIME,
    @fecha_operacion DATETIME
AS
BEGIN
    -- Insertar la operación
    INSERT INTO Operacion(no_operacion, id_usuario, cve_metodo, cant_boletos, costo_total)
    VALUES (@no_operacion, @id_usuario, @cve_metodo, @cant_boletos, @costo_total)

    --Insertar la actividad del usuario
    INSERT INTO Actividad_Usuario(no_operacion, cve_central_origen, cve_central_destino, fecha_salida, fecha_operacion)
    VALUES (@no_operacion, @cve_central_origen, @cve_central_destino, @fecha_salida, @fecha_operacion)

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
--EJEMPLO DE USO
--Los boletos se insertan en el mismo orden en que se compraron
INSERT INTO #BoletosTemporales VALUES 
(1, 1, 1, 2, 'Juan Perez', '123456', 1, 'A', 1, 1, 'En linea', 1234567890, 100.00),
(2, 2, 1, 3, 'Mariana Perez', '123457', 2, 'B', 2, 2, 'En linea', 1234567891, 50.00),
(3, 3, 1, 2, 'Pedro Perez', '123458', 3, 'C', 3, 3, 'En linea', 1234567892, 300.00)
EXEC InsertarOperacionYBoletos 1, 1, 1, 2, 300.00, 1, 3, '2024-04-01 10:00:00', '2024-03-31 10:00:00';
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
GO

CREATE PROCEDURE GetTokensViaje
    @no_servicio INT
AS
BEGIN
    SELECT token_usuario
    FROM Usuario u 
    JOIN Token t
    ON u.id_usuario = t.id_usuario
    JOIN Operacion o
    ON u.id_usuario = o.id_usuario
    JOIN Operacion_Viaje ov
    ON o.no_operacion = ov.no_operacion
    JOIN Viaje v
    ON ov.cve_viaje = v.cve_viaje
    JOIN Boleto b
    ON o.no_operacion = b.no_operacion
    WHERE v.no_servicio = @no_servicio AND b.cve_estado = 1
END 
GO

CREATE PROCEDURE UpdateViaje
    @tiempo TIME,
    @no_servicio INT
AS
BEGIN
UPDATE Viaje
        SET fecha_salida = ADDTIME(fecha_salida, @tiempo),
            hora_llegada = ADDTIME(hora_llegada, @tiempo)
        WHERE EXISTS (SELECT 1 FROM Viaje v WHERE v.no_servicio = @no_servicio GROUP BY v.no_servicio HAVING COUNT > 1)
END

EXEC UpdateViaje '01:00:00', 1;
GO

--Obtener viajes y boletos con un arreglo de id's de viaje
CREATE PROCEDURE GetViajes
--los datos que dará el usuario para la consulta
    @origen_viaje INT,
    @destino_viaje INT,
    @fecha_salida DATE,
    @fecha_usuario  TIME
AS
BEGIN
    SELECT 
    --Los datos que vamos a obtener
        R.no_servicio,
        L.cve_linea,
        L.nombre_linea,
        V.origen_viaje,
        V.destino_viaje,
        C.descripcion_clase,
        V.fecha_salida,
        V.fecha_llegada,
        --Se juntan las cve_viaje en una sola columna separados por ","
        STRING_AGG(CONVERT(VARCHAR(10), V.cve_viaje), ', ') AS cve_viajes,
        --Se juntan las descripciones de los servicios en una sola columna separados por ","
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
    WHERE 
        V.origen_viaje = @origen_viaje 
        AND V.destino_viaje = @destino_viaje
        --Debería mostrar los viajes que su fecha salida sea la misma a la que da el usuario
        AND CONVERT(DATE , V.fecha_salida) = @fecha_salida
        --Otra opcion es agregar estado a los viajes(disponible, no disponible)
        --Debe mostrar una fecha y hora mayor a la que solicita el usuario(solicitud del mismo dia)
        AND V.fecha_salida > @fecha_usuario 
    GROUP BY 
        R.no_servicio,
        L.cve_linea,
        L.nombre_linea,
        V.origen_viaje,
        V.destino_viaje,
        C.descripcion_clase,
        V.fecha_salida,
        V.fecha_llegada,
        TV.descripcion_viaje;
END
GO
EXEC GetViajes 1,4,"31/03/2024", "31/03/2024 10:00:00"
GO

CREATE PROCEDURE ObtenerBoletosDisponibles
    @cve_viaje_lista NVARCHAR(MAX)
AS
BEGIN
    -- Crear una tabla temporal para almacenar los cve_viaje que obtuvimos
    -- del procedimiento almacenado de GetViajes
    DECLARE @cve_viaje_table TABLE (cve_viaje INT)

    -- Llenar la tabla con los cve_viaje de la lista
    INSERT INTO @cve_viaje_table
    SELECT value FROM STRING_SPLIT(@cve_viaje_list, ',')

    -- Realizar la consulta
    SELECT 
        TB.descripcion_tipo_boleto AS 'Tipo de Boleto',
        -- Se obtiene el mínimo de los boletos disponibles dependiendo el 
        --intervalo de viajes que se buscó
        MIN(CT.disponibles) AS 'Boletos Disponibles'
    FROM 
        Costo_Tipo CT
    JOIN 
        Tipo_Boleto TB ON CT.cve_tipo = TB.cve_tipo
    WHERE 
        CT.cve_viaje IN (SELECT cve_viaje FROM @cve_viaje_table)
    GROUP BY 
        TB.descripcion_tipo_boleto
END
GO

--El mamón del gabbo quiere que se obtengan estos dos juntos
--EXEC OBTENER BOLETOS DISPONIBLES @"ARREGLO DE CVE_VIAJES"

--Para revisar y probar
-- CREATE PROCEDURE GetViajes
-- --los datos que dará el usuario para la consulta
--     @origen_viaje INT,
--     @destino_viaje INT,
--     @fecha_salida DATE
-- AS
-- BEGIN
--     SELECT 
--     --Los datos que vamos a obtener
--         R.no_servicio,
--         L.cve_linea,
--         L.nombre_linea,
--         V.origen_viaje,
--         V.destino_viaje,
--         C.descripcion_clase,
--         V.fecha_salida,
--         V.fecha_llegada,
--         --Se juntan las descripciones de los servicios en una sola columna separados por ","
--         STRING_AGG(S.descripcion_servicio, ', ') AS descripcion_servicio,
--         TV.descripcion_viaje
--     FROM 
--         Viaje V
--     JOIN 
--         Ruta R ON V.no_servicio = R.no_servicio
--     JOIN 
--         Camion CM ON R.id_camion = CM.id_camion
--     JOIN 
--         Linea L ON CM.cve_linea = L.cve_linea
--     JOIN 
--         Clase C ON L.cve_clase = C.cve_clase
--     JOIN 
--         Clase_Servicio CS ON C.cve_clase = CS.cve_clase
--     JOIN 
--         Servicio S ON CS.cve_servicio = S.cve_servicio
--     JOIN 
--         Tipo_Viaje TV ON V.cve_tipo = TV.cve_tipo
--     WHERE 
--         V.origen_viaje = @origen_viaje 
--         AND V.destino_viaje = @destino_viaje
--         --Debería mostrar los viajes que su fecha salida sea la misma a la que da el usuario
--         AND CONVERT(DATE , V.fecha_salida) = @fecha_salida
--     GROUP BY 
--         R.no_servicio,
--         L.cve_linea,
--         L.nombre_linea,
--         V.origen_viaje,
--         V.destino_viaje,
--         C.descripcion_clase,
--         V.fecha_salida,
--         V.fecha_llegada,
--         TV.descripcion_viaje;
-- END
-- GO

-- CREATE PROCEDURE ObtenerBoletosDisponibles
--     @origen_viaje INT,
--     @destino_viaje INT,
--     @fecha_salida DATE
-- AS
-- BEGIN
--     -- Crear una tabla temporal para almacenar los cve_viaje obtenidos
--     DECLARE @cve_viaje_table TABLE (cve_viaje INT)

--     -- Ejecutar el procedimiento GetViajes para obtener los cve_viaje
--     INSERT INTO @cve_viaje_table
--     EXEC GetViajes @origen_viaje, @destino_viaje, @fecha_salida

--     -- Realizar la consulta para obtener los boletos disponibles
--     SELECT 
--         TB.descripcion_tipo_boleto AS 'Tipo de Boleto',
--         MIN(CT.disponibles) AS 'Boletos Disponibles'
--     FROM 
--         Costo_Tipo CT
--     JOIN 
--         Tipo_Boleto TB ON CT.cve_tipo = TB.cve_tipo
--     WHERE 
--         CT.cve_viaje IN (SELECT cve_viaje FROM @cve_viaje_table)
--     GROUP BY 
--         TB.descripcion_tipo_boleto
-- END

--Con esto se obtienen los boletos disponibles de los viajes que se obtuvieron
-- EXEC ObtenerBoletosDisponibles 1, 3, '2024-04-01'
