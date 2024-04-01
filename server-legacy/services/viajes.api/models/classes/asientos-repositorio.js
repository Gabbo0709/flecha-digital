const Viaje = require('./viaje');
const Asiento = require('./asiento');
const dao = require('../../data/dao');

class AsientoRepositorio{

    /**
     * @param { Viaje[] } viajes 
     * @returns { Promise<Asiento[]> }    
     */
    
    static async obtenerAsiento(viajes){
        if (viajes.length() == 0 || !(viajes[0] instanceof Viaje)) {
            return null;
        }
        const clavesViaje = viajes.map(v => v.cve_viaje ).join(',');
        let query = `EXEC GetAsientos '${clavesViaje}', ${viajes[0].no_servicio};`;
        result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Asiento() : null;
    }
    
    static async confirmarAsiento(asiento){
        if(!(asiento instanceof Asiento)){
            return false;
        }
        let query = `EXEC ConfirmarAsiento ${asiento.cve_asiento}, ${asiento.cve_viaje}, ${asiento.no_servicio}, ${asiento.cve_tipo};`;
        return await dao.ejecutarQuery(query);
    }

    

    
}

module.exports = asientoRepositario;