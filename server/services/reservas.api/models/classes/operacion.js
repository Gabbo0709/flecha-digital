class Operacion{
    constructor(no_operacion, id_usuario, cve_tipo, cant_boletos, costo_total){
        this.no_operacion = no_operacion;
        this.id_usuario = id_usuario;
        this.cve_tipo = cve_tipo;
        this.cant_boletos = cant_boletos;
        this.costo_total = costo_total;
    }
    constructor(operacion){ 
        this.no_operacion = operacion.no_operacion;
        this.id_usuario = operacion.id_usuario;
        this.cve_tipo = operacion.cve_tipo;
        this.cant_boletos = operacion.cant_boletos;
        this.costo_total = operacion.costo_total;
    }
}

module.exports = Operacion;