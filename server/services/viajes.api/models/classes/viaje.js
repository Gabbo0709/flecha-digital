class Viaje{
    constructor(no_servicio, origen_viaje, destino_viaje, tipo_viaje, fecha_salida, duracion, fecha_llegada){
        this.no_servicio = no_servicio;
        this.origen_viaje = origen_viaje;
        this.destino_viaje = destino_viaje;
        this.tipo_viaje = tipo_viaje;
        this.fecha_salida = fecha_salida;
        this.duracion = duracion;
        this.fecha_llegada = fecha_llegada;
    }
    constructor(viaje){
        this.no_servicio = viaje.no_servicio;
        this.origen_viaje = viaje.origen_viaje;
        this.destino_viaje = viaje.destino_viaje;
        this.tipo_viaje = viaje.tipo_viaje;
        this.fecha_salida = viaje.fecha_salida;
        this.duracion = viaje.duracion;
        this.fecha_llegada = viaje.fecha_llegada;
    }
}


module.exports = Viaje;