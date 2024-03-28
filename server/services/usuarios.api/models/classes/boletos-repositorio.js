const dao = require('../../data/dao');
const Boleto = require('./boleto');
const Usuario = require('./usuario');
const UsuarioRepositorio = require('./usuarios-repositorio');

class BoletosRepositorio {
    /**
     * @param {Usuario} usuario
     * @returns {Promise<Boleto[]>}
     */
    static async obtenerBoletosActividad(actividad) {
        if(!(actividad instanceof Actividad)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_operacion = ${actividad.no_operacion}`;
        let result = await dao.consultar(query);
        return result.map(boleto => new Boleto(boleto));
    };
};

module.exports = BoletosRepositorio;
