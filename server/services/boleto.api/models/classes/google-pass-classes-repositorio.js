const { google } = require('googleapis');
const jwt = require('jsonwebtoken');
const { v4: uuidv4 } = require('uuid');
const GooglePassClass = require('./google-pass-class');

/**
 * @class GooglePassClassesRepositorio
 * @description Clase que se encarga de gestionar la persistencia de las clases de Google Pass
 * @method validarExistenciaDeClass
 * @method crearClass
 * @method obtenerClass
 * @method actualizarClass
 */
class GooglePassClassesRepositorio {
    /**
     * @description Constructor de la clase GooglePassClassesRepositorio. Configura el keyFilePath con las credenciales de Google Cloud Platform
     * @constructor
     * @public
     * @memberof GooglePassClassesRepositorio
     */
    constructor() {
        this.keyFilePath = process.env.GOOGLE_APPLICATION_CREDENTIALS || './key.json';
        this.auth();
    }

    /**
     * @method auth
     * @description Método que se encarga de crear un cliente HTTP autenticado con las credenciales de Google Cloud Platform
     * @returns { void }
     * @throws { Error } - Lanza un error si ocurre un problema en la autenticación
     * @private
     * @memberof GooglePassClassesRepositorio
     */
    auth() {
        const auth = new google.auth.GoogleAuth({
            keyFile: this.keyFilePath,
            scopes: ['https://www.googleapis.com/auth/wallet_object.issuer']
        });

        this.credentials = require(this.keyFilePath);

        this.client = google.walletobjects({
            version: 'v1',
            auth: auth
        });
    }

    /**
     * @method validarExistenciaDeClass
     * @description Método que se encarga de validar la existencia de una clase de Google Pass
     * @param { any } clase - Clase de Google Pass
     * @returns { Promise<boolean> } - Retorna un booleano que indica si la clase existe o no
     * @throws { Error } - Lanza un error si ocurre un problema en la validación
     * @async
     * @static
     * @public
     * @memberof GooglePassClassesRepositorio
     */
    async validarExistenciaDeClass(clase) {
        let response;
        const passClass = new GooglePassClass(clase);
        try {
            response = await this.client.flightclass.get({
                resourceId: `${passClass.issuer_id}.${passClass.viaje_id}`
            });
            const result = response.status === 200 ? true : response.status === 404 ? false : null;
        }
        catch(err) {
            if (err.response && err.response.status !== 404) {
                console.log(err);
                return false;
            }
        }
    }

    /**
     * @method crearClass
     * @description Método que se encarga de crear una clase de Google Pass
     * @param { any } clase - Clase de Google Pass
     * @returns { Promise<boolean> } - Retorna la respuesta de la creación de la clase
     * @throws { Error } - Lanza un error si ocurre un problema en la creación
     * @async
     * @public
     * @memberof GooglePassClassesRepositorio
     */
    async crearClass(clase) {
        if (this.validarExistenciaDeClass(clase)) {
            return false;
        }
        let response;
        const googlePass = new GooglePassClass(clase);
        const claseNueva = {
            'id': `${googlePass.issuer_id}.${googlePass.viaje_id}`,
            'localizedIssuerName': {
                'defaultValue': 'Flecha Amarilla',
            },
            'flightHeader': {
                'carrier': {
                    'airlineLogo': {
                        'sourceUri': {
                            'uri': `${googlePass.logo}`
                        },
                        'contentDescription': 'Logo de la aerolínea'

                    }
                },
                'flightNumber': googlePass.viaje_id,
            },
            'origin': {
                'gate': googlePass.puerta_embarque,
                'airportNameOverride': googlePass.origen,
            },
            'destination': {
                'airportNameOverride': googlePass.destino,
            },
            'hexBackgroundColor': googlePass.color,
            'heroImage': {
                'sourceUri': {
                    'uri': `${googlePass.imagen}`
                },
                'contentDescription': 'Imagen del viaje'
            },
        };
        response = await this.client.flightclass.insert({
            resource: claseNueva
        });
        const result = response.then(data => data.status);
        return result === 200;
    }

    /**
     * @method actualizarClass
     * @description Método que se encarga de actualizar una clase de Google Pass
     * @param { any } clase - Clase de Google Pass
     * @returns { Promise<boolean> } - Retorna la respuesta de la actualización de la clase
     */
    async actualizarClass(clase) {
        if (!this.validarExistenciaDeClass(clase)) {
            return false;
        }
        const googlePass = new GooglePassClass(clase);
        let response = await this.client.flightclass.get({
            resourceId: `${googlePass.issuer_id}.${googlePass.viaje_id}`
        });
        let updatedClass = response.data;
        updatedClass.localScheduledArrivalDateTime = googlePass.fecha_llegada;
        response = await this.client.flightclass.update({
            resourceId: `${googlePass.issuer_id}.${googlePass.viaje_id}`,
            resource: updatedClass
        });
        const result = response.data.status;
        return result === 200;
    }
}