using System.Configuration;

namespace Flecha_Digital.Services;

    public class ServicioReservas
    {
        HttpClient client;
        string url = ConfigurationManager.AppSettings["URL"];
        public ServicioReservas()
        {
            client = new HttpClient();
        }
        public async Task<bool> ReservarBoletos(Operacion operacion, Boleto[] boletos)
        {
            var response = await client.PostAsync($"{url}/crearOperacionYBoleto", new StringContent(JsonSerializer.Serialize(new { operacion, boletos }), Encoding.UTF8, "application/json"));
            return response.IsSuccessStatusCode;
        }
    }
