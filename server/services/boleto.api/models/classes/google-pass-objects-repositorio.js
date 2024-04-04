const { google } = require('googleapis');
const jwt = require('jsonwebtoken');
const GooglePassObject = require('./google-pass-object');

/**
 * @class GooglePassObjectsRepositorio
 * @description Clase que se encarga de gestionar los objetos de Google Pass
 * @method crearObject
 * @method obtenerObject
 * @method validarExistenciaDeObject
 * @method marcarObjectComoExpirado
 * @method marcarObjectComoAbordado
 * @method marcarObjectComoCancelado
 * @method crearJwtNuevoObject
 */
class GooglePassObjectsRepositorio {
    /**
     * @description Constructor de la clase GooglePassObjectsRepositorio. Configura el keyFilePath con las credenciales de Google Cloud Platform
     * @constructor
     * @public
     * @memberof GooglePassObjectsRepositorio
     */
    constructor() {
        this.credentials = require('../config/keys/level-approach-419200-a328206b635b.json');
        this.auth();
    }

    /**
     * @method auth
     * @description Método que se encarga de crear un cliente HTTP autenticado con las credenciales de Google Cloud Platform
     * @returns { void }
     * @throws { Error } - Lanza un error si ocurre un problema en la autenticación
     * @private
     * @memberof GooglePassObjectsRepositorio
     */
    auth() {
        const auth = new google.auth.GoogleAuth({
            credentials: this.credentials,
            scopes: ['https://www.googleapis.com/auth/wallet_object.issuer']
        });

        this.client = google.walletobjects({
            version: 'v1',
            auth: auth
        });
    }

    /**
     * @method crearObject
     * @description Método que se encarga de crear un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<String> } - Retorna un objeto de Google Pass
     */
    async crearObject(objeto) {
        const googlePass = new GooglePassObject(objeto);
        let response;
        const nuevoObject = {
            'id': `${googlePass.issuer_id}.${googlePass.boleto_id}`,
            'classId': `${googlePass.issuer_id}.${googlePass.viaje_id}`,
            'state': 'ACTIVE',
            'passengerName': `${googlePass.nombre_pasajero}`,
            "reservationInfo": {
                "confirmationCode": `${googlePass.boleto_id}`,
                "eticketNumber": `${googlePass.numero_operacion}`,
              },
            'textModulesData': [
                {
                    'header': `Método de pago: ${googlePass.metodo_pago}`,
                    'body': `Número de operación: ${googlePass.numero_operacion}\nTotal de pago: ${googlePass.total_pago}`,
                    'id': 'metodo_pago'
                },
                {
                    'header': `Token de facturación: ${googlePass.token_facturacion}`,
                    'id': 'token_facturacion'
                }
            ],
            'boardingAndSeatingInfo': {
                'seatNumber': `${googlePass.numero_asiento}`,
                'seatClass': `${googlePass.categoria}`
            },
            'barcode': {
                'type': 'qrCode',
                'value': `https://www.flecha-amarilla.com.mx/boleto/${googlePass.boleto_id}`
            }
        };
        response = await this.client.flightobject.insert({
            requestBody: nuevoObject
        });
        console.log(response);
        return `${googlePass.issuer_id}.${googlePass.boleto_id}`;
    }

    /**
     * @method obtenerObject
     * @description Método que se encarga de obtener un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<Object> } - Retorna un objeto de Google Pass
     */
    async obtenerObject(objeto) {
        const googlePass = new GooglePassObject(objeto);
        let response;
        response = await this.client.flightobject.get({
            resourceId: `${googlePass.issuer_id}.${googlePass.boleto_id}`
        });
        const result = response;
        return result;
    }

    /**
     * @method validarExistenciaDeObject
     * @description Método que se encarga de validar la existencia de un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<boolean> } - Retorna un booleano que indica si el objeto existe o no
     */
    async validarExistenciaDeObject(objeto) {
        this.obtenerObject(objeto).then(data => {
            return data.status === 200;
        });
    }

    /**
     * @method marcarObjectComoExpirado
     * @description Método que se encarga de expirar un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<boolean> } - Retorna la respuesta de la expiración del objeto
     */
    async marcarObjectComoExpirado(objeto) {
        const googlePass = await this.obtenerObject(objeto);
        let estadoNuevo = {
            'state': 'EXPIRED'
        };
        let response = await this.client.flightobject.patch({
            resourceId: `${googlePass.issuer_id}.${googlePass.boleto_id}`,
            requestBody: estadoNuevo
        });
        return response.status === 200;
    }

    /**
     * @method marcarObjectComoAbordado
     * @description Método que se encarga de marcar como abordado un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<boolean> } - Retorna la respuesta de marcar como abordado el objeto
     */
    async marcarObjectComoAbordado(objeto) {
        const googlePass = await this.obtenerObject(objeto);
        let estadoNuevo = {
            'state': 'COMPLETED'
        };
        let response = await this.client.flightobject.patch({
            resourceId: `${googlePass.issuer_id}.${googlePass.boleto_id}`,
            requestBody: estadoNuevo
        });
        return response.status === 200;
    }

    /**
     * @method marcarObjectComoCancelado
     * @description Método que se encarga de cancelar un objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { Promise<boolean> } - Retorna la respuesta de la cancelación del objeto
     */
    async marcarObjectComoCancelado(objeto) {
        const googlePass = await this.obtenerObject(objeto);
        let estadoNuevo = {
            'state': 'INACTIVE'
        };
        let response = await this.client.flightobject.patch({
            resourceId: `${googlePass.issuer_id}.${googlePass.boleto_id}`,
            requestBody: estadoNuevo
        });
        return response.status === 200;
    }

    /**
     * @method crearJwtNuevoObject
     * @description Método que se encarga de crear un JWT para un nuevo objeto de Google Pass
     * @param { any } objeto - Objeto de Google Pass
     * @returns { String } - Retorna un emñace para el nuevo objeto de Google Pass para que el usuario lo guarde en Google Wallet
     */
    async crearJwtNuevoObject(objeto) {
        const passRecibido = new GooglePassObject(objeto);
        const idPass = await this.crearObject(passRecibido);
        if(idPass === null) {
            return null;
        }
        const googlePass = {
            'id': `${idPass}`,
            'classId': `${passRecibido.issuer_id}.${passRecibido.viaje_id}`,
        };
        const claims = {
            iss: this.credentials.client_email,
            aud: 'google',
            typ: 'savetowallet',
            payload: {
                flightObjects: [googlePass]
            }
        };
        const token = jwt.sign(claims, this.credentials.private_key, { algorithm: 'RS256' });
        return `https://pay.google.com/gp/v/save/${token}`;
    }
}

module.exports = GooglePassObjectsRepositorio;