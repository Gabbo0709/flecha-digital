class Ruta{
    constructor(cve_ruta, no_servicio, orige_ruta, destino_ruta, id_camion){
        this.cve_ruta = cve_ruta;
        this.no_servicio = no_servicio;
        this.orige_ruta = orige_ruta;
        this.destino_ruta = destino_ruta;
        this.id_camion = id_camion;
    }
    constructor(ruta){
        this.cve_ruta = cve_ruta;
        this.no_servicio = ruta.no_servicio;
        this.orige_ruta = ruta.orige_ruta;
        this.destino_ruta = ruta.destino_ruta;
        this.id_camion = ruta.id_camion;
    }
}

module.exports = Ruta;