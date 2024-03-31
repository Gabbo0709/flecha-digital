const dao = require('../../data/dao');
const Central = require('./central');

class CentralesRepositorio {
    /**
     * @param {Central} central
     * @returns {Promise<Central[]>}
     */
    static async obtenerCentrales() {
        const query = `SELECT * FROM Central`;
        const result = await dao.consultar(query);
        return result.map(central => new Central(central));
    };
}

module.exports = CentralesRepositorio;