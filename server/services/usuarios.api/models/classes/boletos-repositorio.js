const dao = require('../../data/dao');
const Boleto = require('./boleto');
const Usuario = require('./usuario');
const UsuarioRepositorio = require('./usuarios-repositorio');

class BoletosRepositorio {
    async obtenerBoletosActividad(actividad) {
        if(!(actividad instanceof Actividad)) {
            return null;
        }
        let query = `SELECT * FROM Boleto WHERE no_operacion = ${actividad.no_operacion}`;
        let result = await dao.consultar(query);
        // let boletos = [];
        // for(let boleto of result) {
        //     boletos.push(new Boleto(
        //         boleto.no_boleto,
        //         boleto.cve_tipo,
        //         boleto.no_operacion,
        //         boleto.cve_asiento,
        //         boleto.cve_estado,
        //         boleto.nombre_pas,
        //         boleto.token_fac,
        //         boleto.no_asiento_boleto,
        //         boleto.puerta,
        //         boleto.carril,
        //         boleto.anden,
        //         boleto.metodo_pago,
        //         boleto.tel_cliente,
        //         boleto.costo_boleto
        //     ));
        // }
        // return boletos;
        return result.map(boleto => new Boleto(boleto));
    }
}

module.exports = BoletosRepositorio;
