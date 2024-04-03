/**
 * Clase del modelo de Google Pass Class
 * @class GooglePassClass
 * @constructor
 * @param { any } googlePass Datos de Google Pass
 * @description Modelo para Google Flight Pass Class.
 * - Atributos:
 * @attribute { numeric } issuer_id | Identificador del emisor. Ejemplo: 1
 * @attribute { numeric } viaje_id | Identificador del viaje. Ejemplo: 1
 * @attribute { string } logo | URL del logo de Flecha Amarilla. Degault: "https://www.flecha-amarilla.com.mx/wp-content/uploads/2019/07/FA-Logo-1.png"
 * @attribute { numeric } origen | Ciudad de origen. Ejemplo: Guadalajara
 * @attribute { numeric } destino | Ciudad de destino. Ejemplo: Ciudad de México
 * @attribute { date } fecha_salida | Fecha y hora de salida. dd/MM/YYYY HH:mm. Ejemplo: 01/01/2021 12:00
 * @attribute { string } puerta_embarque | Puerta de embarque. Ejemplo: A1
 * @attribute { string } color | Color de la tarjeta. Default: "#FFCC00"
 * @attribute { string } imagen_pie | URL de la imagen del pie de la tarjeta. Default: "https://www.flecha-amarilla.com.mx/wp-content/uploads/2019/07/FA-Logo-1.png"
 */

class GooglePassClass {
    /**
     * 
     * @param {any} googlePass
     * @returns {GooglePassClass}
     * @description Constructor de la clase GooglePassClass
     * @constructs GooglePassClass
     */
    constructor(googlePass) {
        this.issuer_id = 3388000000022336175;
        this.viaje_id = googlePass.viaje_id || 1;
        this.logo = googlePass.logo || "https://www.flecha-amarilla.com.mx/wp-content/uploads/2019/07/FA-Logo-1.png";
        this.origen = googlePass.origen || "Guadalajara";
        this.destino = googlePass.destino || "Ciudad de México";
        this.fecha_salida = googlePass.fecha_salida || "01/01/2021 12:00";
        this.puerta_embarque = googlePass.puerta_embarque || "A1";
        this.color = googlePass.color || "#FFCC00";
        this.imagen_pie = googlePass.imagen_pie || "https://www.flecha-amarilla.com.mx/wp-content/uploads/2019/07/FA-Logo-1.png";
    }
}

module.exports = GooglePassClass;