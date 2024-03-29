namespace Flecha_Digital.Services;

    
    public class ServicioBoletos
    {
        HttpClient httpClient;
        string baseUrl = "https://localhost:3001/server/services/boletos.api/server/";
        public ServicioBoletos()
        {
            httpClient = new HttpClient();
        }
        public async Task<bool> ActualizarEstadoBoleto(Boleto boleto)
        {
            var url = $"{baseUrl}actualizarEstadoBoleto";
            var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(boleto), Encoding.UTF8, "application/json"));
            return response.IsSuccessStatusCode;
        }
        public async Task<bool> CancelarBoletosServicio(int id_servicio)
        {
            var url = $"{baseUrl}cancelarBoletosServicio/{id_servicio}";
            var response = await httpClient.PostAsJsonAsync(url, id_servicio);
            return response.IsSuccessStatusCode;
        }
    }

