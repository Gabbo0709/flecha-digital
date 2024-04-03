const Boleto = require('./boleto');
const GooglePassObjectsRepositorio = require('./google-pass-objects-repositorio');


/**
 * @class BoletosRepositorio
 * @description Clase que se encarga de gestionar los boletos
 * @method guardarBoleto
 * @method actualizarBoleto
 */
class BoletosRepositorio {
    /**
     * @description Método que guarda un boleto en Google Wallet y Apple Wallet
     * @param {Boleto} boleto
     * @returns {Promise<String[]>}
     */
    static async guardarBoleto(boleto) {
        const boletoRecibido = new Boleto(boleto);
        const googlePassObject = new GooglePassObjectsRepositorio();
        const googleResult = await googlePassObject.crearJwtNuevoObject(boletoRecibido);
        const AppleResult = 'Apple Wallet';
        return [ googleResult, AppleResult ];
    }

    /**
     * @description Método que actualiza el estado de un boleto
     * @param {Boleto} boleto
     * @returns {Promise<Boolean>}
     */
    static async actualizarBoleto(boleto) {
        const boletoRecibido = new Boleto(boleto);
        const googlePassObject = new GooglePassObjectsRepositorio();
        const tipoActualizacion = this.obtenerTipoDeActualizacion(boletoRecibido);
        switch (tipoActualizacion) {
            case 1:
                return await googlePassObject.marcarObjectComoCancelado(boletoRecibido);
            case 2:
                return await googlePassObject.marcarObjectComoAbordado(boletoRecibido);
            case 3:
                return await googlePassObject.marcarObjectComoExpirado(boletoRecibido);
        }
        return googleResult;
    
    }

    static obtenerTipoDeActualizacion(boleto) {
        if (boleto.estado === 'INACTIVE') {
            return 1;
        } else if (boleto.estado === 'COMPLETED') {
            return 2;
        } else {
            return 3; // En caso de que el estado sea EXPIRED
        }
    }
}

module.exports = BoletosRepositorio;