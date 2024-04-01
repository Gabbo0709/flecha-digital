const Token = require('./token');
const dao = require('../data/dao');
const Viaje = require('./viaje');
const Usuario = require('./usuario');
const UsuariosRepositorio = require('./usuarios-repositorio');

class TokensRepositorio {
    /**
     * @param { Viaje } viaje
     * @return { Promise<Token[]> } tokens
     */
    static async obtenerTokens(viaje) {
        let query = 'EXEC GetTokens @idViaje = ?';

    };
    
}; 

