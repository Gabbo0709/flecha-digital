class tipoBoleto{
    //Clave tipo: se obtiene 
    //Descripción: se obtiene
    //Disponibles: se obtiene
    constructor(cve_tipo, descripcion, disponibles){
        this.cve_tipo = cve_tipo || null;
        this.descripcion = descripcion || null;
        this.disponibles = disponibles || null;
    }
}

module.exports = tipoBoleto;