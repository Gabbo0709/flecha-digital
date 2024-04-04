const { google } = require('googleapis');
const { v4: uuidv4 } = require('uuid');
const GooglePassClass = require('./google-pass-class');

/**
 * @class GooglePassClassesRepositorio
 * @description Clase que se encarga de gestionar las clases de Google Pass
 * @method obtenerClass
 * @method validarExistenciaDeClass
 * @method crearClass
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
        this.credentials = require('../config/keys/level-approach-419200-a328206b635b.json');
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
            credentials: this.credentials,
            scopes: ['https://www.googleapis.com/auth/wallet_object.issuer']
        });
        this.client = google.walletobjects({
            version: 'v1',
            auth: auth
        });
    }

    /**
     * @method obtenerClass
     * @description Método que se encarga de obtener una clase de Google Pass
     * @param { any } clase - Clase de Google Pass
     * @returns { Promise<Object> } - Retorna una clase de Google Pass
     */
    async obtenerClass(clase) {
        const googlePass = new GooglePassClass(clase);
        let response;
        try{
        response = await this.client.flightclass.get({
            resourceId: `${googlePass.issuer_id}.${googlePass.viaje_id}`
        }); }
        catch(err){
            if(response == 404){
            return false;
            }
        }
        const result = response;
        return result;
    };

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
        this.obtenerClass(clase);
        
        let response;
        const googlePass = new GooglePassClass(clase);
        const claseNueva = {
            'id': `${googlePass.issuer_id}.${googlePass.viaje_id}`,
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
     * @description Método que se encarga de actualizar la  una clase de Google Pass
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
        updatedClass.localScheduledDepartureDateTime = googlePass.fecha_salida;
        response = await this.client.flightclass.update({
            resourceId: `${googlePass.issuer_id}.${googlePass.viaje_id}`,
            resource: updatedClass
        });
        const result = response.data.status;
        return result === 200;
    }
}

module.exports = GooglePassClassesRepositorio;