const Actividad = require('./actividad');
const Usuario = require('./usuario');
const UsuarioRepositorio = require('./usuarios-repositorio');
const dao = require('../../data/dao');
class ActividadesRepositorio {
    /**
     * @param {Usuario} usuario
     * @returns {Promise<Actividad[]>}
     */

    static async obtenerActividadesUsuario(usuario) {
        let user = await UsuarioRepositorio.buscarUsuarioCorreo(usuario.email);
        if(user == null || user.length == 0 || !(user instanceof Usuario)){
            return null;
        }
        let query = `EXEC GetActividadesUsuario ${user.id_usuario}`;
        let result = await dao.consultar(query);
        return result.map(actividad => new Actividad(actividad));
    }
}

module.exports = ActividadesRepositorio;