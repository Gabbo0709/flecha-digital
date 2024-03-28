class ConcentradoViaje{
    constructor(concentradoViaje){
        this.cve_ruta = concentradoViaje.cve_linea || null;
        this.no_servicio = concentradoViaje.no_servicio || null;
        this.orige_ruta = concentradoViaje.origen || null;
        this.destino_ruta = concentradoViaje.destino || null;
        this.id_camion = null;
        this.nombre_linea = concentradoViaje.nombre_linea || null;
        this.descripcion_clase = concentradoViaje.descripcion_clase || null;
        this.fecha_salida = concentradoViaje.fecha_salida || null;
        this.fecha_llegada = concentradoViaje.fecha_llegada || null;
        this.descripcion_servicios = concentradoViaje.descripcion_servicios || null;
        this.descrpcion_viaje = concentradoViaje.descrpcion_viaje || null;
    }
}

module.exports = ConcentradoViaje;