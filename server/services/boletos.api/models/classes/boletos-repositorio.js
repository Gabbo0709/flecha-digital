const dao = require('../../data/dao');
const Boleto = require('./boleto');

class BoletosRepositorio {

    /**
     * @param {Boleto} boleto
     * @returns {Boleto}
     * @description Busca un boleto en la base de datos por su número de boleto
     */

    static async buscarBoleto(boleto){
        if(!(boleto instanceof Boleto)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_boleto = ${boleto.no_boleto}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Boleto(result[0]) : null;
    }


    /**
     * @param {Boleto} boleto
     * @returns {Promise<Boleto[]>}
     * @description Busca boletos en la base de datos por su número de operación
     */

    static async buscarBoletos(boleto){
        if(!(boleto instanceof Boleto)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_operacion = ${boleto.no_operacion}`;
        let result = await dao.consultar(query);
        return result.map(boleto => new Boleto(boleto));
    }
}

module.exports = BoletosRepositorio;