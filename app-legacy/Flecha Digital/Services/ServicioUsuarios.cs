namespace Flecha_Digital.Services;
using Flecha_Digital.Model;
using System.Configuration;
using System.Diagnostics.Eventing.Reader;

public class ServicioUsuarios
{
    HttpClient httpClient;
    string url = ConfigurationManager.AppSettings["URL"];

    public ServicioUsuarios()
    {
        httpClient = new HttpClient();
    }

    List<Central> listaCentral = new();

    public async Task<List<Central>> ObtenerCentral()
    {
        if (listaCentral?.Count > 0)
            return listaCentral;

        var response = await httpClient.GetAsync($"{url}/obtenerCentrales");

        if (response.IsSuccessStatusCode)
        {
            listaCentral = await response.Content.ReadFromJsonAsync<List<Central>>();
            //using var stream = await FileSystem.OpenAppPackageFileAsync("centrales.json");
            //var contents = await reader.ReadToEndAsync();
            //listaCentral = JsonSerializer.Deserialize<List<Central>>(contents);  
        }

        return listaCentral;
    }

    public async Task<bool> AutenticarUsuario(string email, string pass)
    {
        var response = await httpClient.PostAsync($"{url}/iniciar", new StringContent(JsonSerializer.Serialize(new { email, pass }), Encoding.UTF8, "application/json"));
        if (response.Content.Headers.ContentLength != null)
            await File.WriteAllTextAsync("usuario.json", await response.Content.ReadAsStringAsync());
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> RegistrarUsuario(Usuario usuario)
    {
        var response = await httpClient.PostAsync($"{url}/registrar", new StringContent(JsonSerializer.Serialize(usuario), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActualizarUsuario(Usuario usuario)
    {
        var response = await httpClient.PostAsync($"{url}/actualizar", new StringContent(JsonSerializer.Serialize(usuario), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActualizarPass(string email, string pass)
    {
        var response = await httpClient.PostAsync($"{url}/actualizarPass", new StringContent(JsonSerializer.Serialize(new { email, pass }), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActivarUsuario(string email)
    {
        var response = await httpClient.PostAsync($"{url}/activar", new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> DesactivarUsuario(string email)
    {
        var response = await httpClient.PostAsync($"{url}/desactivar", new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> SuspenderUsuario(string email)
    {
        var response = await httpClient.PostAsync($"{url}/suspeder", new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<List<Actividad>> ObtenerActividades(string email)
    {
        var response = await httpClient.GetAsync($"{url}/obtenerActividades/{email}");
        return await response.Content.ReadFromJsonAsync<List<Actividad>>();
    }

    public async Task<List<Boleto>> ObtenerBoletos(int no_operacion)
    {   
        var response = await httpClient.GetAsync($"{url}/obtenerBoletosActividad/{no_operacion}");
        return await response.Content.ReadFromJsonAsync<List<Boleto>>();
    }
}
