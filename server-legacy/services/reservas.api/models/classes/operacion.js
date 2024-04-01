class Operacion{
    constructor(operacion){ 
        this.no_operacion = operacion.no_operacion || null;
        this.id_usuario = operacion.id_usuario || null;
        this.cve_metodo = operacion.cve_metodo || null;
        this.cant_boletos = operacion.cant_boletos || null;
        this.costo_total = operacion.costo_total || null;
    }
}

module.exports = Operacion;