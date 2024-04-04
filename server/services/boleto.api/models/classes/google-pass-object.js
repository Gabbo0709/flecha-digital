/**
 * Clase de Google Boarding Pass
 * @class GooglePass
 * @constructor
 * @param { any } googlePass Datos de Google Pass
 * @description Modelo de Google Pass.
 * - Atributos:
 * @attribute { string } issuer_id | Identificador del emisor
 * @attribute { string } viaje_id | Identificador del viaje
 * @attribute { string } boleto_id | Identificador del boleto
 * @attribute { string } estado | Estado del boleto
 * @attribute { string } nombre_pasajero | Nombre del pasajero
 * @attribute { string } numero_asiento | Asiento del pasajero
 * @attribute { string } categoria | Categoría del boleto
 * @attribute { string } token_facturacion | Token de facturación
 * @attribute { numeric } numero_operacion | Número de operación
 * @attribute { money } total_pago | Total de pago (a dos decimales)
 * @attribute { string } metodo_pago | Método de pago
 */

class GooglePassObject {
    /**
     * @param { any } googlePass
     * @returns { GooglePassObject }
     * @description Constructor de la clase GooglePassObject
     * @constructs GooglePassObject
     */
    constructor(googlePass) {
        this.issuer_id = '3388000000022336175';
        this.viaje_id = googlePass.viaje_id || 1;
        this.boleto_id = googlePass.boleto_id || 1;
        this.estado = googlePass.estado || "Vigente";
        this.nombre_pasajero = googlePass.nombre_pasajero || "Juan Perez";
        this.numero_asiento = googlePass.numero_asiento || 23;
        this.categoria = googlePass.categoria || "Completo";
        this.token_facturacion = googlePass.token_facturacion || "1ab2c";
        this.numero_operacion = googlePass.numero_operacion || 123;
        this.total_pago = googlePass.total_pago || 123.45;
        this.metodo_pago = googlePass.metodo_pago || "Efectivo";
    }
}

module.exports = GooglePassObject;