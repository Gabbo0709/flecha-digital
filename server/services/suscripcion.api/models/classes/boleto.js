/** 
 * Clase del modelo de Boleto cuyos atributos se adjuntarán al modelo de Suscripción para el envío de correos electrónicos de suscripción a Wallets.
 * @class Boleto
 * @constructor
 * @param { any } boleto Datos del boleto
 * @description Modelo de Boleto.
 * - Atributos:
 * @attribute { numeric } viaje_id | Identificador del viaje. Ejemplo: 1
 * @attribute { numeric } boleto_id | Identificador del boleto. Ejemplo: 1
 * @attribute { string } correo_pasajero | Correo del pasajero. Ejemplo: "ejemplo@gmail.com"
 * @attribute { string } nombre_pasajero | Nombre del pasajero. Ejemplo: "Juan Perez"
 * @attribute { integer } numero_asiento | Numero de asiento asignado. Ejemplo: 23
 * @attribute { string } origen | Origen. Ejemplo: "GUADALAJARA"
 * @attribute { string } destino | Destino. Ejemplo: "CDMX"
 * @attribute { integer } numero_servicio | Numero de servicio. Ejemplo: 123
 * @attribute { date } fecha_hora_salida | Fecha y hora de salida. Ejemplo: "15/03/2024 12:00"
 * @attribute { string } puerta_embarque Puerta de embarque/carril/anden {string}
 * @attribute { string } token_facturacion | Token de facturacion. Ejemplo: "1ab2c"
 * @attribute { string } categoria | Categoría del boleto. [Completo, Inapam, Medio, Profesor]
 * @attribute { integer } numero_operacion | Número de operación. Ejemplo: 123emplo: 123
 * @attribute { float } total_pago | Total de pago (a dos decimales). Ejemplo: 123.45
 * @attribute { string } metodo_pago | Método de pago. [Efectivo, Tarjeta]
 * @attribute { string } estado | Estado del boleto. [Cancelado, Abordado, Vigente, Caducado]
 */
class Boleto {
    /**
     *
     * @param { any } boleto
     * @returns { Boleto }
     * @description Constructor de la clase Boleto
     * @constructs Boleto
     */
    constructor (boleto) {
        this.viaje_id = boleto.viaje_id;
        this.boleto_id = boleto.boleto_id;
        this.correo_pasajero = boleto.correo_pasajero;
        this.estado = boleto.estado;
        this.nombre_pasajero = boleto.nombre_pasajero;
        this.numero_asiento = boleto.numero_asiento;
        this.categoria = boleto.categoria;
        this.origen = boleto.origen;
        this.destino = boleto.destino;
        this.numero_servicio = boleto.numero_servicio;
        this.fecha_hora_salida = boleto.fecha_hora_salida;
        this.puerta_embarque = boleto.puerta_embarque;
        this.token_facturacion = boleto.token_facturacion;
        this.numero_operacion = boleto.numero_operacion;
        this.total_pago = boleto.total_pago;
        this.metodo_pago = boleto.metodo_de_pago;
    }
}

module.exports = Boleto;