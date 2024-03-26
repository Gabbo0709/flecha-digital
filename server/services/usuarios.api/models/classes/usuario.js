class Usuario {
    constructor(nombre_user, apellido, pass, email, tel_user) {
        this.nombre_user = nombre_user;
        this.apellido = apellido;
        this.pass = pass;
        this.email = email;
        this.tel_user = tel_user;
        this.cve_estado = 1; // Default value for cve_estado
    }
    constructor(nombre_user, apellido, pass, email, tel_user, cve_estado) {
        this.nombre_user = nombre_user;
        this.apellido = apellido;
        this.pass = pass;
        this.email = email;
        this.tel_user = tel_user;
        this.cve_estado = cve_estado;
    }
    constructor(usuario) {
        this.nombre_user = usuario.nombre_user;
        this.apellido = usuario.apellido;
        this.pass = usuario.pass;
        this.email = usuario.email;
        this.tel_user = usuario.tel_user;
        this.cve_estado = usuario.cve_estado;
    }
}

module.exports = Usuario;