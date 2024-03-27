const Viaje = require('./viaje');
const Ruta = require('./ruta');
const dao = require('../../data/dao');

class ViajeRepositorio{
    async buscarViaje(ruta, viaje){
        if(!(ruta instanceof Ruta) || !(viaje instanceof Viaje)){
            return null;
        }
        let query = `EXEC GetViajes ${origen_ruta}, ${origen_viaje}, ${destino_ruta}, ${destino_viaje}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0;
    }
    async registrarRuta(viaje){
        if(!(ruta instanceof Ruta) || !(viaje instanceof Viaje)){
            return false;
        }
        let query = `INSERT INTO Ruta (no_servicio, origen_ruta, destino_ruta, id_camion) VALUES ('${ruta.no_servicio}', '${ruta.origen_ruta}', '${ruta.destino_ruta}', ${ruta.id_camion})`;
        let result = await dao.ejecutarQuery(query);
    }
    async registrarViaje(viaje){
        if(!(ruta instanceof Ruta) || !(viaje instanceof Viaje)){
            return false;
        }
        let query = `INSERT INTO Viaje (no_servicio, origen_viaje, destino_viaje, tipo_viaje, fecha_salida, duracion, fecha_llegada) 
        VALUES ('${viaje.no_servicio}', '${viaje.origen_viaje}', '${viaje.destino_viaje}', '${viaje.tipo_viaje}', '${viaje.fecha_salida}', ${viaje.duracion}, '${viaje.fecha_llegada}')`;
        let result = await dao.ejecutarQuery(query);
    }

    async actualizarViaje(viaje, tiempo){
        if(!(viaje instanceof Viaje)){
            return false;
        }
        let query = `UPDATE Viaje
        SET fecha_salida = ADDTIME(fecha_salida, '${tiempo}'),
            hora_llegada = ADDTIME(hora_llegada, '${tiempo}')
        WHERE EXISTS (SELECT 1 FROM Viaje v WHERE v.no_operacion = ${viaje.no_servicio} GROUP BY v.no_operacion HAVING COUNT(*) > 1)`;
        let result = await dao.ejecutarQuery(query);
    }

}

module.exports = ViajeRepositorio;
