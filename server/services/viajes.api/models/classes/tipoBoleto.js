class tipoBoleto{
    constructor(cve_tipo, descripciom, disponibles){
        this.cve_tipo = cve_tipo || null;
        this.descripciom = descripciom || null;
        this.disponibles = disponibles || null;
    }
}

module.exports = tipoBoleto;