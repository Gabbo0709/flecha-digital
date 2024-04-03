namespace Flecha_Digital_Demo.Model;

public class Boleto
{
    public int id { get; set; }
    public string? nombre_pasajero { get; set; }
    public int numero_asiento { get; set; }
    public string? origen { get; set; }
    public string? destino { get; set; }
    public int? numero_servicio { get; set; }
    public DateTime fecha_hora_salida { get; set; }
    public string? puerta_embarque { get; set; }
    public string? token_facturacion { get; set; }
    public string? categoria { get; set; }
    public int numero_operacion { get; set; }
    public float total_pago { get; set; }
    public string? metodo_pago { get; set; }
    public string? estatus { get; set; }
}
