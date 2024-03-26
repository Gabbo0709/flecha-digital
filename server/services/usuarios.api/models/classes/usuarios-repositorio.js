const dao = require('../../data/dao');
const Usuario = require('./usuario');

class UsuariosRepositorio {
    async buscarUsuarioCorreo(usuario) {
        if(!(usuario instanceof Usuario)) {
            return null;
        }
        let query = `SELECT * FROM Usuario WHERE email = '${usuario.email}'`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Usuario(result[0]) : null;
    }

    async autenticarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        let query = `SELECT * FROM Usuario WHERE email = '${usuario.correo}' AND pass = '${usuario.pass}'`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0;
    }

    async registrarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        let query = `INSERT INTO Usuario (nombre_user, apellido, pass, email, tel_user, cve_estado) VALUES ('${usuario.nombre}', '${usuario.apellido}', '${usuario.pass}', '${usuario.correo}', '${usuario.telefono}', ${usuario.cve_estado})`;
        return await dao.ejecutarQuery(query);
    }

    async actualizarUsuario(usuario) {
        let user = await this.buscarUsuarioCorreo(usuario);
        if(user == null || user.length == 0) {
            return false;
        }
        if (user == null || user.length == 0) {
            return false;
        }
        let query = `UPDATE Usuario SET ${this.obtenerTipoActualizacionUsuario(user)} WHERE id_usuario = ${user[0].id_usuario}`;
        return await dao.ejecutarQuery(query);
    }

    obtenerTipoActualizacionUsuario(usuario) {
        let result = "";
        if (usuario.email != null) {
            result += `email = ${usuario.email}, `;
        }
        if (usuario.tel_user != null) {
          result += `tel_user = ${usuario.tel_user}, `;
        }
        return result.substring(0, result.length - 2);
    }

    async eliminarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        let query = `UPDATE Usuario SET cve_estado = 2 WHERE email = ${usuario.mail}`;
        return await dao.ejecutarQuery(query);
    }

    async activarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        let query = `UPDATE Usuario SET cve_estado = 1 WHERE email = ${usuario.mail}`;
        return await dao.ejecutarQuery(query);
    }
}

module.exports = UsuariosRepositorio;