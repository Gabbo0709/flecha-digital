const Actividad = require('./actividad');
const Usuario = require('./usuario');
const UsuarioRepositorio = require('./usuarios-repositorio');
const dao = require('../../data/dao');
class ActividadesRepositorio {
    async obtenerActividadesUsuario(usuario) {
        let user = await UsuarioRepositorio.buscarUsuarioCorreoStatic(usuario.email);
        if(user == null || user.length == 0 || !(user instanceof Usuario)){
            return null;
        }
        let query = `EXEC GetActividadesUsuario ${user.id_usuario}`;
        let result = await dao.consultar(query);
        // let actividades = [];
        // for(let actividad of result) {
        //     actividades.push(new Actividad(
        //         user.id_usuario,
        //         actividad.no_operacion,
        //         actividad.origen_viaje,
        //         actividad.destino_viaje,
        //         actividad.cantidad_boletos
        //     ));
        // }
        // return actividades;
        return result.map(actividad => new Actividad(actividad));
    }
}

module.exports = ActividadesRepositorio;