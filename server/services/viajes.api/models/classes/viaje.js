class Viaje{
    constructor(cve_viaje, no_servicio, origen_viaje, destino_viaje, cve_tipo, fecha_salida, duracion, fecha_llegada){
        this.cve_viaje = cve_viaje;
        this.no_servicio = no_servicio;
        this.origen_viaje = origen_viaje;
        this.destino_viaje = destino_viaje;
        this.cve_tipo = cve_tipo;
        this.fecha_salida = fecha_salida;
        this.duracion = duracion;
        this.fecha_llegada = fecha_llegada;
    }
    constructor(viaje){
        this.cve_viaje = viaje.cve_viaje;
        this.no_servicio = viaje.no_servicio;
        this.origen_viaje = viaje.origen_viaje;
        this.destino_viaje = viaje.destino_viaje;
        this.cve_tipo = viaje.cve_tipo;
        this.fecha_salida = viaje.fecha_salida;
        this.duracion = viaje.duracion;
        this.fecha_llegada = viaje.fecha_llegada;
    }
}

module.exports = Viaje;