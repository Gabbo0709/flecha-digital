const dao = require('../../data/dao');
const Boleto = require('./boleto');

class BoletosRepositorio {
    /**
    *@param {Boleto}
    *@returns {Promise<boolean>}
    */
    static async actualizarEstadoBoleto(boleto, estado){
        if(!(boleto instanceof Boleto)) {
            return false;
        }
        let query = `UPDATE Boleto SET cve_estado = ${estado} WHERE no_boleto = ${boleto.no_boleto}`;
        return await dao.ejecutarQuery(query);
    }

    /**
    *@param {int} no_servicio 
    *@returns {Promise<boolean>}
    */
    static async cancelarBoletosServicio(no_servicio){
        let query = `EXEC CancelarBoletosPorServicio ${no_servicio};`;
        return await dao.ejecutarQuery(query);
    }
}

module.exports = BoletosRepositorio;