const Viaje = require('../../../viajes.api/models/classes/viaje');
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
        const query = `EXEC GetAsientos '${clavesViaje}', ${viajes[0].no_servicio};`;
        result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Asiento() : null;
    }
    /**
     * @param { Asiento } asiento
     * @return { Promise<boolean>}
     */
    
    static async confirmarAsiento(asiento){
        if(!(asiento instanceof Asiento)){
            return false;
        }
        const query = `UPDATE ${asiento.cve_estado} = 2`;
        return await dao.ejecutarQuery(query);
    }

    

    
}

module.exports = AsientoRepositario;