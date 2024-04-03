const Boleto = require('./boleto');

/**
 * Clase que representa los correos electrónicos de suscripción a Wallets
 * @class Suscripcion
 * @constructor
 * @param { any } suscripcion Datos de la suscripción
 * @description Modelo de Suscripción.
 * - Atributos:
 * @attribute { Boleto } boleto | Boleto de la suscripción
 * @attribute { string } correo | Correo electrónico del suscriptor
 * @attribute { string } enlaceGoogleWallet | Enlace de Google Wallet
 * @attribute { string } enlaceAppleWallet | Enlace de Apple Wallet
 */
class Suscripcion {
    /**
     *
     * @param { Boleto } boleto
     * @param { string } correo
     * @param { string } enlaceGoogleWallet
     * @param { string } enlaceAppleWallet
     * @returns { Suscripcion }
     * @description Constructor de la clase Suscripcion
     * @constructs Suscripcion
     */
    constructor (boleto, enlaceGoogleWallet, enlaceAppleWallet) {
        this.boleto = boleto;
        this.correo = boleto.correo_pasajero;
        this.enlaceGoogleWallet = enlaceGoogleWallet;
        this.enlaceAppleWallet = enlaceAppleWallet;
        this.html = this.generarCodigoHTML();
    }

    /**
     * @Método que genera el código HTML para el correo de suscripción
     * @returns { string }
     */
    generarCodigoHTML() {
        const result = `
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            </head>
            <body>
                    <div class="container">
                        <div class="header">
                            <h1>Suscripción a Wallets</h1>
                        </div>
                        <div class="content">
                            <h1>¡Gracias por tu compra ${this.boleto.nombre_pasajero}!</h1>
                            <hr>
                            <h2>Desglose de tu boleto</h2>
                            <p>Origen: ${this.boleto.origen}</p>
                            <p>Destino: ${this.boleto.destino}</p>
                            <p>Fecha y hora de salida: ${this.boleto.fecha_hora_salida}</p>
                            <p>Puerta de embarque: ${this.boleto.puerta_embarque}</p>
                            <p>Asiento: ${this.boleto.numero_asiento}</p>
                            <p>Categoría: ${this.boleto.categoria}</p>
                            <p>Método de pago: ${this.boleto.metodo_pago}</p>
                            <p>Total de pago: $${this.boleto.total_pago}</p>
                            <p>Token de facturación: ${this.boleto.token_facturacion}</p>
                            <hr>
                            <h2>Enlaces a Wallets</h2>
                            <button><a href="${this.enlaceGoogleWallet}">Google Wallet</a></button>
                            <p>¡Buen viaje!</p>
                            <button class='btn'><a href="${this.enlaceAppleWallet}">Apple Wallet</a></button>
                            <button class='btn'><a href="${this.enlaceGoogleWallet}">Google Wallet</a></button>
                            <hr>
                            <h3>¡Buen viaje!</h3>
                        </div>
                        <div class="footer">
                            <p>Este es un correo electrónico automático, por favor no respondas a este mensaje.</p>
                        </div>
            </body>
        </html>
        `;
    }
}

module.exports = Suscripcion;