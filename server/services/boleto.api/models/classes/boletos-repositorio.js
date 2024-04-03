const Boleto = require('./boleto');
const GooglePassesRepositorio = require('');


class BoletosRepositorio {
    /**
     * @param {Boleto} boleto
     * @returns {Promise<boolean>}
     */
    static async guardarBoleto(boleto) {
        const b = new Boleto(boleto);

    }
}