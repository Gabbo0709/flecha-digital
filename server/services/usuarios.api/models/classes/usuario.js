class Usuario {
    constructor(usuario) {
        this.nombre_user = usuario.nombre_user;
        this.apellido = usuario.apellido;
        this.pass = usuario.pass;
        this.email = usuario.email;
        this.tel_user = usuario.tel_user;
        this.cve_estado = usuario.cve_estado || 2;
    }
};

module.exports = Usuario;