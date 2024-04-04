using System.Text.Json;

namespace boleto_apple_wallet.api.Modelos;
public partial class Boleto
{
	public string? ViajeId { get; set; }
	public string? BoletoId { get; set; }
	public short Estado { get; set; }
	public string? NombrePasajero { get; set; }
	public int Asiento { get; set; }
	public string? Categoria { get; set; }
	public string? Origen { get; set; }
	public string? Destino { get; set; }
	public string? NumeroServicio { get; set; }
	public string? FechaHoraSalida { get; set; } // Formato: "dd-MM-YYYY HH:mm"
	public string? PuertaEmbarque { get; set; }
	public string? TokenFacturacion { get; set; }
	public string? NumeroOperacion { get; set; }
	public float TotalPago { get; set; }
	public string? MetodoPago { get; set; }

	public Boleto(string? viajeId, string? boletoId, short estado, string? nombrePasajero, int asiento, string? categoria, string? origen, string? destino, string? numeroServicio, string? fechaHoraSalida, string? puertaEmbarque, string? tokenFacturacion, string? numeroOperacion, float totalPago, string? metodoPago)
	{
		ViajeId = viajeId;
		BoletoId = boletoId;
		Estado = estado;
		NombrePasajero = nombrePasajero;
		Asiento = asiento;
		Categoria = categoria;
		Origen = origen;
		Destino = destino;
		NumeroServicio = numeroServicio;
		FechaHoraSalida = fechaHoraSalida;
		PuertaEmbarque = puertaEmbarque;
		TokenFacturacion = tokenFacturacion;
		NumeroOperacion = numeroOperacion;
		TotalPago = totalPago;
		MetodoPago = metodoPago;
	}
	// Sobrecarga de constructor para deserializar JSON
	public Boleto(string? json)
	{
		if (json != null)
		{
			var boleto = JsonSerializer.Deserialize<Boleto>(json);
			ViajeId = boleto.ViajeId ?? "-1";
			BoletoId = boleto.BoletoId ?? "-1";
			Estado = boleto.Estado;
			NombrePasajero = boleto.NombrePasajero ?? "Nombre Pasajero";
			Asiento = boleto.Asiento;
			Categoria = boleto.Categoria ?? "Categoria";
			Origen = boleto.Origen ?? "Origen";
			Destino = boleto.Destino ?? "Destino";
			NumeroServicio = boleto.NumeroServicio ?? "Numero Servicio";
			FechaHoraSalida = boleto.FechaHoraSalida ?? "dd-MM-YYYY HH:mm";
			PuertaEmbarque = boleto.PuertaEmbarque ?? "Puerta Embarque";
			TokenFacturacion = boleto.TokenFacturacion ?? "Token Facturacion";
			NumeroOperacion = boleto.NumeroOperacion ?? "Numero Operacion";
			TotalPago = boleto.TotalPago;
			MetodoPago = boleto.MetodoPago ?? "Metodo Pago";
		}
	}
}
