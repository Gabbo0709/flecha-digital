class Viaje{
    constructor(viaje){
        this.cve_viaje = viaje.cve_viaje || null;
        this.no_servicio = viaje.no_servicio || null;
        this.origen_viaje = viaje.origen_viaje || null;
        this.destino_viaje = viaje.destino_viaje || null;
        this.cve_tipo = viaje.cve_tipo || null;
        this.fecha_salida = viaje.fecha_salida || null;
        this.duracion = viaje.duracion || null;
        this.fecha_llegada = viaje.fecha_llegada || null;
    }
}

module.exports = Viaje;