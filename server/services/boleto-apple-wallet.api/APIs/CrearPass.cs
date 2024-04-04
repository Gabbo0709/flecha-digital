using boleto_apple_wallet.api.Modelos;
using Microsoft.AspNetCore.Http.HttpResults;
using System.Security.Cryptography.X509Certificates;

namespace boleto_apple_wallet.api.APIs;
public class CrearPass
{
	// Crear un Apple Wallet Pass utilizando la librería Passbook
	public static async Task<byte[]> CrearNuevoApplePass(Boleto boleto)
	{
		PassGenerator generator = new ();
		PassGeneratorRequest request = new ();
		request.PassTypeIdentifier = "pass.com.gfa.talendland";
		request.TeamIdentifier = "J83NHPZ786";
		request.SerialNumber = boleto.BoletoId;
		request.Description = $"Boleto para viaje: {boleto.ViajeId}";
		request.OrganizationName = "Grupo Flecha Amarilla";
		request.LogoText = "Flecha Amarilla";
		request.BackgroundColor = "#FFD666";
		request.ForegroundColor = "#000000";
		request.LabelColor = "#FFF";
		request.Style = PassStyle.BoardingPass;

		request.AddHeaderField(new StandardField("origin", "Origen:", boleto.Origen));
		request.AddHeaderField(new StandardField("destination", "Destino:", boleto.Destino));

		request.AddPrimaryField(new StandardField("passenger-name", "Nombre del pasajero:", boleto.NombrePasajero));
		request.AddPrimaryField(new StandardField("flight", "Numero de servicio:", boleto.NumeroServicio));

		request.AddSecondaryField(new StandardField("seat", "Asiento:", boleto.Asiento.ToString()));
		request.AddSecondaryField(new StandardField("gate", "Puerta de embarque:", boleto.PuertaEmbarque));
		request.AddSecondaryField(new StandardField("date", "Fecha de salida:", boleto.FechaHoraSalida));
		request.AddSecondaryField(new StandardField("category", "Categoria:", boleto.Categoria));

		request.AddAuxiliaryField(new StandardField("operation", "Numero de operacion:", boleto.NumeroOperacion));
		request.AddAuxiliaryField(new StandardField("payment", "Metodo de pago:", boleto.MetodoPago));
		// Total de pago con dos decimales
		request.AddAuxiliaryField(new StandardField("total", "Total:", boleto.TotalPago.ToString("00.00")));
		request.AddAuxiliaryField(new StandardField("token", "Token de facturacion:", boleto.TokenFacturacion));

		request.AppleWWDRCACertificate = new X509Certificate2("Certificates/Apple/AppleWWDRCAG4.cer");
		request.PassbookCertificate = new X509Certificate2("Certificates/Apple/CertificadoTalendLand.p12", "talend");

		// Obtener los bytes de la imagen del logo alojado en la carpeta Resources/images en la raiz del proyecto
		byte[] imgBytes = File.ReadAllBytes("Resources/images/logo.png");
		request.Images.Add(PassbookImage.Icon, imgBytes);
		request.Images.Add(PassbookImage.Icon2X, imgBytes);
		request.Images.Add(PassbookImage.Icon3X, imgBytes);

		byte[] passGenerado = generator.Generate(request);
		await File.WriteAllBytesAsync($"Passes/Passes/{boleto.BoletoId}.pkpass", passGenerado);
		return passGenerado;
	}

}