const Boleto = require('./boleto');
const Operacion = require('./operacion');
const dao = require('../../data/dao');

class reservasRepositorio{
    async crearOperacion(operacion){
        if(!(operacion instanceof Operacion)){
            return false;
        }
        let query = `INSERT INTO Operacion(no_servicio, id_usuario, costo_total) VALUES(${operacion.no_servicio}, ${operacion.id_usuario}, ${operacion.costo_total})`;
        return dao.ejecutarQuery(query);
    }

    async crearBoleto(boleto){
        if(!(boleto[0] instanceof Boleto)){
            return false;
        }
        let query = `INSERT INTO Boleto (no_boleto, no_operacion, cve_asiento, cve_estado, nombre_pas, token_fac, no_asiento_boleto, puerta, carril, anden, metodo_pago, tel_cliente, costo) VALUES${this.definirBoletos(boleto)}`;
        return await dao.ejecutarQuery(query);
    }
    definirBoletos(boleto){
        let result = "";
        for(let b of boleto){
            result += ` (${b.no_boleto}, ${b.no_operacion}, ${b.cve_asiento}, ${b.cve_estado}, '${b.nombre_pas}', '${b.token_fac}', ${b.no_asiento_boleto}, ${b.puerta}, ${b.carril}, ${b.anden}, '${b.metodo_pago}', '${b.tel_cliente}', ${b.costo}),`;
        }
        return result.substring(0, result.length - 1);
    }
}

module.exports = reservasRepositorio;