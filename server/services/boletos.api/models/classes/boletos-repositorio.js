const dao = require('../../data/dao');
const Boleto = require('./boleto');

class BoletosRepositorio {
    async buscarBoleto(boleto){
        if(!(boleto instanceof Boleto)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_boleto = ${boleto.no_boleto}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Boleto(result[0]) : null;
    }

    async buscarBoletos(boleto){
        if(!(boleto instanceof Boleto)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_operacion = ${boleto.no_operacion}`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Boleto() : null;
    }
    
    async buscarBoletoToken(boleto){
        if(!(boleto instanceof Boleto)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE token_fac = '${boleto.token_fac}'`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Boleto(result[0]) : null;
    }
    
    async actualizarEstadoBoleto(boleto, estado){
        if(!(boleto instanceof Boleto)) {
            return false;
        }
        let query = `UPDATE Boleto SET cve_estado = ${estado} WHERE no_boleto = ${boleto.no_boleto}`;
        return await dao.ejecutarQuery(query);
    }
}

module.exports = BoletosRepositorio;