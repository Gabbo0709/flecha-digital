class Asiento{
    constructor(cve_asiento, no_asiento, cve_estado){
        this.cve_asiento = cve_asiento || null;
        this.no_asiento = no_asiento || null;
        this.cve_estado = cve_estado || null;
    }
}

module.exports = Asiento;