const Suscripcion = require('./suscripcion');
const nodemailer = require('nodemailer');
const smptConfig = require('../../config/smtp.congif.json');

/**
 * Clase que representa un repositorio que gestionará suscripciones
 * @class SuscripcionesRepositorio
 *  */
class SuscripcionesRepositorio {

    /**
     * Método que genera el código HTML para el correo de suscripción
     * @param { Boleto } boleto - Suscripción a agregar
     * @param { string } correo - Correo de la suscripción
     * @param { string } enlaceGoogleWallet - Enlace de Google Wallet
     * @param { string } enlaceAppleWallet - Enlace de Apple Wallet
     * @returns { Suscripcion }
     */
    agregarSuscripcion(boleto, enlaceAppleWallet, enlaceGoogleWallet) {
        return new Suscripcion(boleto, enlaceGoogleWallet, enlaceAppleWallet);
    }

    /**
     * Método que envía un correo electrónico de suscripción a través de un SMTP
     * @param { Suscripcion } suscripcion - Suscripción a enviar
     */
    enviarCorreo(suscripcion) {
        const transporter = nodemailer.createTransport(smptConfig);
        const mailOptions = {
            from: `${smptConfig.auth.user}`,
            to: suscripcion.boleto.correo_pasajero,
            subject: `¡${suscripcion.boleto.nombre_pasajero}}! Aquí están los detalles de tu viaje a ${suscripcion.boleto.destino}`,
            html: suscripcion.html
        };
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                console.log(error);
            } else {
                console.log(`Correo enviado: ${info.response}`);
            }
        });
    }
}