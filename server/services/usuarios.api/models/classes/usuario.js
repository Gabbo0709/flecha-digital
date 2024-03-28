class Usuario {
    constructor(usuario) {
        this.nombre_user = usuario.nombre_user || null;
        this.apellido = usuario.apellido || null;
        this.pass = usuario.pass || null;
        this.email = usuario.email || null;
        this.tel_user = usuario.tel_user || null;
        this.cve_estado = usuario.cve_estado || 2 || null;
    };
};

module.exports = Usuario;