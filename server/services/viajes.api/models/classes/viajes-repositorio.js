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
        let query = `EXEC GetViajes ${viaje.origen_viaje}, ${viaje.destino_viaje}, ${viaje.fecha_salida};`;
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
        let query = `EXEC GetAsientos ${viaje.origen_viaje, viaje.destino_viaje, no_servicio};`;
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
        const query = `EXEC UpdateViaje ${tiempo}, ${viaje.no_servicio};`;
        return await dao.ejecutarQuery(query);
    };
}

module.exports = ViajeRepositorio;
