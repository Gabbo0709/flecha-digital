const Viaje = require('./viaje');
const Ruta = require('./ruta');
const dao = require('../../data/dao');

class ViajeRepositorio{
    async getViajes(viaje){
        if (!(viaje instanceof Viaje)){
            return null;
        }
        let query = `SELECT * FROM Viaje WHERE no_servicio = ${no_servicio}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Viaje(result[0]) : null;
    }
    async buscarViaje(ruta, viaje){
        if(!(ruta instanceof Ruta) || !(viaje instanceof Viaje)){
            return null;
        }
        let query = `EXEC GetViajes ${viaje.origen_viaje}, ${viaje.destino_viaje}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Viaje(result[0]) : null;
    };

    async actualizarViaje(viaje, tiempo){
        if(!(viaje instanceof Viaje)){
            return false;
        }
        let query = `UPDATE Viaje
        SET fecha_salida = ADDTIME(fecha_salida, '${tiempo}'),
            hora_llegada = ADDTIME(hora_llegada, '${tiempo}')
        WHERE EXISTS (SELECT 1 FROM Viaje v WHERE v.no_operacion = ${viaje.no_servicio} GROUP BY v.no_operacion HAVING COUNT(*) > 1)`;
        return await dao.ejecutarQuery(query);
    };
}

module.exports = ViajeRepositorio;
