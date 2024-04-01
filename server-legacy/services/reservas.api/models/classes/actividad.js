class Actividad {
    constructor(actividad) {
        this.id_usuario = actividad.id_usuario;
        this.no_operacion = actividad.no_operacion;
        this.origen_viaje = actividad.origen_viaje;
        this.destino_viaje = actividad.destino_viaje;
        this.fecha_salida = actividad.fecha_salida;
        this.fecha_llegada = actividad.fecha_llegada;
        this.cantidad_boletos = actividad.cantidad_boletos;
    };
}

module.exports = Actividad;