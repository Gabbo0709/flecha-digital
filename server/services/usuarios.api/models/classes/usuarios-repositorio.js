const dao = require('../../data/dao');
const Usuario = require('./usuario');

class UsuariosRepositorio {

    /**
     * @param {string} email
     * @returns {Promise<Usuario>}
     */
    static async buscarUsuarioCorreo(email) {
        let query = `SELECT * FROM Usuario WHERE email = '${email}'`;
        let result = await dao.consultar(query);
        return result != null && result.length > 0 ? new Usuario(result[0]) : null;
    }

    /**
     * @param {Usuario} usuario
     * @returns {Promise<boolean>}
     */

    static async autenticarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        // A futuro, se añadirá la encriptación de la contraseña
        let query = `SELECT * FROM Usuario WHERE email = '${usuario.email}' AND pass = '${usuario.pass}' AND cve_estado = 1`; // Activo
        let result = await dao.consultar(query);
        return result != null && result.length > 0;
    }

    /**
     * @param {Usuario}
     * @returns {Promise<boolean>}
     */

    static async registrarUsuario(usuario) {
        if(!(usuario instanceof Usuario)) {
            return false;
        }
        if(usuario.tel_user == null || usuario.tel_user == "")
            usuario.tel_user = "123456";
        // A futuro, se añadirá la encriptación de la contraseña
        let query = `INSERT INTO Usuario (nombre_user, apellido, pass, email, tel_user, cve_estado) VALUES ('${usuario.nombre}', '${usuario.apellido}', '${usuario.pass}', '${usuario.correo}', ${usuario.telefono}, ${usuario.cve_estado})`;
        return await dao.ejecutarQuery(query);
    }

    /**
     * @param {string} email // Correo del usuario que será actualizado
     * @param {Usuario} usuario // Objeto con los datos a actualizar
     * @returns {Promise<boolean>}
     */

    static async actualizarUsuario(email, usuario) {
        const user = await this.buscarUsuarioCorreo(email);
        if(user == null || user.length == 0) {
            return false;
        }
        let query = `UPDATE Usuario SET ${this.obtenerTipoActualizacionUsuario(usuario)} WHERE id_usuario = ${user.id_usuario}`;
        return await dao.ejecutarQuery(query);
    }

    /**
     * @param {Usuario} usuario
     * @returns {string}
     */

    static obtenerTipoActualizacionUsuario(usuario) {
        let result = "";
        if (usuario.email != null) {
            result += `email = '${usuario.email}', `;
        }
        if (usuario.tel_user != null) {
          result += `tel_user = ${usuario.tel_user}, `;
        }
        if (usuario.nombre_user != null) {
          result += `nombre_user = '${usuario.nombre_user}', `;
        }
        if (usuario.apellido != null) {
          result += `apellido = '${usuario.apellido}', `;
        }
        return result.substring(0, result.length - 2);
    }

    /**
     * @param {Usuario} usuario
     * @returns {Promise<boolean>}
     */

    static async actualizarPass(usuario) {
        let user = await this.buscarUsuarioCorreo(usuario.email);
        if(user == null || user.length == 0) {
            return false;
        }
        // A futuro, se añadirá una confirmación por correo electrónico o teléfono para cambiar la contraseña
        // A futuro, se añadirá la encriptación de la contraseña
        let query = `UPDATE Usuario SET pass = ${usuario.pass} WHERE id_usuario = ${user[0].id_usuario}`;
        return await dao.ejecutarQuery(query);
    }

    /**
     * @param {Usuario} usuario
     * @returns {Promise<boolean>}
     */

    static async actualizarEstado(usuario) {
        let user = await this.buscarUsuarioCorreo(usuario.email);
        if(user == null || user.length == 0) {
            return false;
        }
        let query = `UPDATE Usuario SET cve_estado = ${usuario.cve_estado} WHERE id_usuario = ${user.id_usuario}`;
        return await dao.ejecutarQuery(query);
    }
}

module.exports = UsuariosRepositorio;