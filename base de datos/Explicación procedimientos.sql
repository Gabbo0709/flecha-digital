--El formato para Procedimientos almacenados:
--EXEC nombre_procedimiento DATOS separados por ,


--Obtiene el concentrado de viaje
--Se debe mandar el @origen_viaje, @destino_viaje y @fecha_salida
--Ejemplo
EXEC GetViajes 1, 2, '2024-04-01'
GO
--Nos dara no_servicio, cve_linea, nombre_linea, origen_viaje, destino_viaje, descripcion_clase(de la linea),
--fecha_salida, fecha_llegada del viaje, cve_viajes(en forma de arreglo separando ids por ",", 
--descripcion_servicio(en forma de arreglo separando las descripciones por "," y la descripcion viaje(paso o local)

--Obtiene los asientos y su estado(disponible u ocupado) para el viaje que seleccione el usuario
--Se debe mandar un arreglo de cve_viaje, no_servicio
EXEC GetAsientos
--Nos dara cve_asiento, no_asiento, cantidad de asientos, descripcion del estado

--Obtiene la actividad de un usuario especifico
EXEC GetActividadUsuario
--Nos manda no_operacion, cantidad de boletos, origen, destino(en nombre de la central) y fecha de salida
--Se debe mandar el id_usuario


--Guarda un nuevo token cuando se crea un usuario
EXEC GuardarUsuarioYToken
--Se debe mandar los datos del usuario en orden: nombre_user, apellido, pass, email, tel_user
--Y el Token 

--Guarda la operacion, los boletos y la actividad para esa operacion y ese usuario
--Se debe mandar: no_operacion, id_usuario, cve_metodo, cant_boletos, costo_total, cve_origen, cve_destino, fecha_salida
--Despues de eso se Inserta el arreglo de boletos (en js ya esta el orden)
EXEC InsertarOperacionYBoletos

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
EXEC InsertarOperacionYBoletos 1, 1, 1, 2, 300.00, 1, 3, '2024-04-01 10:00:00';
GO

--No se planea usar pero por si acaso
--Cancela los boletos dependiendo de un numero de servicio
EXEC CancelarBoletosPorServicio
--Se agrega el no_servicio


--Obtiene los tokens para los usuarios dependiendo el no_servicio
--Solo obtiene los tokens de los boletos que tengan estado 1 (en proceso)
EXEC GetTokensViaje
--Se debe agregar el no_servicio


--Para demostracion, actualiza los viajes de un no_servicio
EXEC UpdateViaje
--Se agrega la cantidad de tiempo en formato que acepte SQL y el no_servicio


--Obtiene el estado de los boletos y la cantidad disponible para un viaje personalizado
EXEC ObtenerBoletosDisponibles
--Se agrega un arreglo de cve_viaje 


--Actualiza el estado de los boletos despues de su compra
--Actualiza todo los tipos que les mandemos por cantidad
--Actualiza la cantidad disponibles por cve_viaje
EXEC ActualizarDisponiblesMultiplesTipos
--Se debe agregar un arreglo de cve_viajes, la cantidad de boletos de tipo 1, 2, 3 y 4
--Y un arreglo de cve_asientos(para especificar que asientos van actualizar su estado de disponible a ocupado)