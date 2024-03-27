class Operacion{
    constructor(no_operacion, no_servicio, id_usuario, costo_total){
        this.no_operacion = no_operacion;
        this.no_servicio = no_servicio;
        this.id_usuario = id_usuario;
        this.costo_total = costo_total;
    }
    constructor(operacion){ 
        this.no_operacion = operacion.no_operacion;
        this.no_servicio = operacion.no_servicio;
        this.id_usuario = operacion.id_usuario;
        this.costo_total = operacion.costo_total;
    }
}

module.exports = Operacion;