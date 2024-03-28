class Boleto{
    constructor(boleto){
        this.no_boleto = boleto.no_boleto || null;
        this.no_operacion = boleto.no_operacion || null;
        this.cve_asiento = boleto.cve_asiento || null;
        this.cve_estado = boleto.cve_estado || 1 || null;
        this.nombre_pas = boleto.nombre_pas || null;
        this.token_fac = boleto.token_fac || null;
        this.no_asiento_boleto = boleto.no_asiento_boleto || null;
        this.puerta = boleto.puerta || null;
        this.carril = boleto.carril || null;
        this.anden = boleto.anden || null;
        this.tel_cliente = boleto.tel_cliente || null;
        this.costo = boleto.costo || null;
    }
}

module.exports = Boleto;