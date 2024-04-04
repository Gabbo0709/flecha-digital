using Microsoft.VisualStudio.TestTools.UnitTesting;
using boleto_apple_wallet.api.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace boleto_apple_wallet.api.Modelos.Tests
{
	[TestClass()]
	public class BoletoTests
	{
		[TestMethod()]
		public void BoletoTest()
		{
			Boleto boleto = new Boleto("123456", "123456", 1, "nombrePasajero", 1, "categoria", "origen", "destino", "numeroServicio", "fechaHoraSalida", "puertaEmbarque", "tokenFacturacion", "numeroOperacion", 1, "metodoPago");

			Assert.Fail();
		}
	}
}