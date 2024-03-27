class Boleto {
    constructor(no_boleto, cve_tipo, no_operacion, cve_asiento, cve_estado, nombre_pas, token_fac, no_asiento_boleto, puerta, carril, anden, metodo_pago, tel_cliente, costo_boleto) {
        this.no_boleto = no_boleto;
        this.cve_tipo = cve_tipo;
        this.no_operacion = no_operacion;
        this.cve_asiento = cve_asiento;
        this.cve_estado = cve_estado;
        this.nombre_pas = nombre_pas;
        this.token_fac = token_fac;
        this.no_asiento_boleto = no_asiento_boleto;
        this.puerta = puerta;
        this.carril = carril;
        this.anden = anden;
        this.metodo_pago = metodo_pago;
        this.tel_cliente = tel_cliente;
        this.costo_boleto = costo_boleto;
    }

    constructor(boleto) {
        this.no_boleto = boleto.no_boleto;
        this.cve_tipo = boleto.cve_tipo;
        this.no_operacion = boleto.no_operacion;
        this.cve_asiento = boleto.cve_asiento;
        this.cve_estado = boleto.cve_estado;
        this.nombre_pas = boleto.nombre_pas;
        this.token_fac = boleto.token_fac;
        this.no_asiento_boleto = boleto.no_asiento_boleto;
        this.puerta = boleto.puerta;
        this.carril = boleto.carril;
        this.anden = boleto.anden;
        this.metodo_pago = boleto.metodo_pago;
        this.tel_cliente = boleto.tel_cliente;
        this.costo_boleto = boleto.costo_boleto;
    }
}

module.exports = Boleto;