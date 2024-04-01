const firebase = require('firebase-admin');
const serviceAccount = require('./firebase.config.json');

firebase.initializeApp({
    credential: firebase.credential.cert(serviceAccount),
});

/**
 * @param {string[]} userTokens
 * @param {string} titulo
 * @param {string} mensaje
 * 
 * @returns {Promise<boolean>}
 */
const enviarNotificacionAMuchos = async (userTokens, titulo, mensaje) => {
    const notificacion = {
        notification: {
            title: titulo,
            body: mensaje,
        },
        tokens: userTokens
    };
    const respuesta = await firebase.messaging().sendMulticast(notificacion);
    return respuesta.successCount === userTokens.length;
};

module.exports = { enviarNotificacion };