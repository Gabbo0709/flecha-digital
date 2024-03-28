const Boleto = require('./boleto');
const Operacion = require('./operacion');
const dao = require('../../data/dao');

class reservasRepositorio{
    /**
     * 
     * @param {Operacion} operacion 
     * @param {Boleto[]} boleto 
     * @returns {Promise<boolean>}
     */
    static async crearOperacionYBoleto(operacion, boleto){
        if(!(operacion instanceof Operacion || boleto instanceof Boleto)){
            return false;
        }
        let query = `CREATE TABLE #BoletosTemporales(
            no_boleto INT,
            cve_tipo_boleto INT,
            cve_asiento INT,
            cve_estado INT,
            nombre_pas NVARCHAR(128),
            token_fac NVARCHAR(128),
            no_asiento_boleto INT,
            puerta NVARCHAR(128),
            carril INT,
            anden INT,
            tel_cliente NUMERIC(12),
            costo_boleto MONEY
        )
        INSERT INTO #BoletosTemporales VALUES${this.definirBoletos(boleto)}`;
        query += ` EXEC InsertarOperacionYBoleto ${operacion.no_operacion}, ${operacion.id_usuario}, ${operacion.cve_metodo}, ${operacion.cant_boletos}, ${operacion.costo_total}`;
        return dao.ejecutarQuery(query);
    }
    /**
     * @param {Boleto[]} boleto
     * @returns {string}     
     */

    static definirBoletos(boleto){
        let result = "";
        for(let b of boleto){
            result += ` (${b.no_boleto}, ${b.no_operacion}, ${b.cve_asiento}, ${b.cve_estado}, '${b.nombre_pas}', '${b.token_fac}', ${b.no_asiento_boleto}, ${b.puerta}, ${b.carril}, ${b.anden}, '${b.tel_cliente}', ${b.costo}),`;
        }
        return result.substring(0, result.length - 1);
    }
}

module.exports = reservasRepositorio;