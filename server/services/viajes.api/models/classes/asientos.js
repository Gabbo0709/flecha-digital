class Asiento{
    constructor(id_asiento, no_asiento, id_camion, cve_estado){
        this.id_asiento = id_asiento;
        this.no_asiento = no_asiento;
        this.id_camion = id_camion;
        this.cve_estado = cve_estado;
    }
    constructor (asiento){
        this.id_asiento = asiento.id_asiento;
        this.no_asiento = asiento.no_asiento;
        this.id_camion = asiento.id_camion;
        this.cve_estado = asiento.cve_estado;
    }
}

module.exports = Asiento;