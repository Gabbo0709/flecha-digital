using System.Configuration;

namespace Flecha_Digital.Services;

    
    public class ServicioBoletos
    {
        HttpClient httpClient;
        string url = ConfigurationManager.AppSettings["URL"];
        public ServicioBoletos()
        {
            httpClient = new HttpClient();
        }
        public async Task<bool> ActualizarEstadoBoleto(Boleto boleto)
        {
            var response = await httpClient.PostAsync($"{url}/actualizarEstadoBoleto", new StringContent(JsonSerializer.Serialize(boleto), Encoding.UTF8, "application/json"));
            return response.IsSuccessStatusCode;
        }
        public async Task<bool> CancelarBoletosServicio(int id_servicio)
        {
            var response = await httpClient.PostAsJsonAsync($"{url}cancelarBoletosServicio/)",id_servicio);
            return response.IsSuccessStatusCode;
        }
    }

