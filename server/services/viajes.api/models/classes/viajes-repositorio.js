const Viaje = require('./viaje');
const Asiento = require('./asiento');
const ConcentradoViaje = require('./concentradoViaje');
const dao = require('../../data/dao');

class ViajeRepositorio{

    /**
     * @param {Viaje} viaje
     * @returns {Promise<ConcentradoViaje[]>}
     */
    static async buscarViaje(viaje){
        if(!(viaje instanceof Viaje)){
            return null;
        }
        let query = `EXEC GetViajes ${viaje.origen_viaje}, ${viaje.destino_viaje}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Viaje(result[0]) : null;
    };
    /**
     * @param {Viaje} viaje 
     * @returns {Promise<Asiento[]>} 
     */
    static async obtenerAsiento(viaje){
        if (!(viaje instanceof Viaje)){
            return null;
        }
        let query = `EXEC GetAsientos ${viaje.origen_viaje, viaje.destino_viaje};`;
        result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Asiento() : null;
    }
    /**
     * 
     * @param {Viaje} viaje 
     * @param {string} tiempo 
     * @returns {Promise<boolean>}
     */
    static async actualizarViaje(viaje, tiempo){
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
