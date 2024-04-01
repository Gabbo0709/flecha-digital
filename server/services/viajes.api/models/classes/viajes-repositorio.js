const Viaje = require('./viaje');
const Asiento = require('./asiento');
const TipoBoleto= require('./tipoBoleto');
const ConcentradoViaje = require('./concentradoViaje');
const dao = require('../../data/dao');

class ViajeRepositorio{

    /**
     * @description Se obtienen los concentrados de viajes que cumplan con los requisitos de viaje. Estos viajes tendran las paradas (de existir) desde el origen hasta el destino.
     * @param {Viaje} viaje
     * @returns {Promise<ConcentradoViaje[]>}
     */
    static async obtenerViajes(viaje){
        if(!(viaje instanceof Viaje)){
            return null;
        }
        const query = `EXEC GetViajes ${viaje.origen_viaje}, ${viaje.destino_viaje}, ${viaje.fecha_salida};`;
        let result = await dao.consultar(query);
        if (result != null && result.length > 0) {
            return result.map(viajeData => new ConcentradoViaje(viajeData));
        } else {
            return null;
        }
    };

    /**
     * @description Se actualizan los viajes de un no_servicio 
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
    }
    /**
     * @description Obtiene el estado de los boletos y la cantidad disponible de los mismos.
     * @param {ConcentradoViaje} concentradoViaje
     * @returns {Promise<TipoBoleto[]>}
     */
    static async obtenerTipoBoleto(concentradoViaje){
        if(!(concentradoViaje instanceof ConcentradoViaje)){
            return null;
        }
        const query = `EXEC ObtenerBoletosDisponibles $()`;
        let result = await dao.consultar(query);
    }
}

module.exports = ViajeRepositorio;
