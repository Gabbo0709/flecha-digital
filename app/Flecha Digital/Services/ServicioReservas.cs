namespace Flecha_Digital.Services;

    public class ServicioReservas
    {
        HttpClient client;
        string baseUrl = "https://localhost:3005/server/services/reservas.api/server/";
        public ServicioReservas()
        {
            client = new HttpClient();
        }
        public async Task<bool> ReservarBoletos(Operacion operacion, Boleto[] boletos)
        {
            var url = baseUrl + "crearOperacionYBoleto";
            var response = await client.PostAsync(url, new StringContent(JsonSerializer.Serialize(new { operacion, boletos }), Encoding.UTF8, "application/json"));
            return response.IsSuccessStatusCode;
        }
    }
