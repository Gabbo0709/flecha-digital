/*
    Clase Actividad
    Esta clase representa la actividad reciente de un usuario.
    Por actividad se entienden los viajes realizados y reservados por el usuario.
*/

class Actividad {
    constructor(actividad) {
        this.id_usuario = actividad.id_usuario;
        this.no_operacion = actividad.no_operacion;
        this.origen_viaje = actividad.origen_viaje;
        this.destino_viaje = actividad.destino_viaje;
        this.cantidad_boletos = actividad.cantidad_boletos;
    };
}

module.exports = Actividad;