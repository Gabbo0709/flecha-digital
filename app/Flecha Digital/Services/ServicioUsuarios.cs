namespace Flecha_Digital.Services;
using Flecha_Digital.Model;

public class ServicioUsuarios
{
    HttpClient httpClient;
    string baseUrl = "https://localhost:3000/services/usuarios.api/server/";

    public ServicioUsuarios()
    {
        httpClient = new HttpClient();
    }

    List<Central> listaCentral = new();

    public async Task<List<Central>> ObtenerCentral()
    {
        if (listaCentral?.Count > 0)
            return listaCentral;

        var url = baseUrl + "obtenerCentrales";
        var response = await httpClient.GetAsync(url);

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
        var url = baseUrl + "iniciar";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(new { email, pass }), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> RegistrarUsuario(Usuario usuario)
    {
        var url = baseUrl + "registrar";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(usuario), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActualizarUsuario(Usuario usuario)
    {
        var url = baseUrl + "actualizar";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(usuario), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActualizarPass(string email, string pass)
    {
        var url = baseUrl + "actualizarPass";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(new { email, pass }), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> ActivarUsuario(string email)
    {
        var url = baseUrl + "activar";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> DesactivarUsuario(string email)
    {
        var url = baseUrl + "desactivar";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<bool> SuspenderUsuario(string email)
    {
        var url = baseUrl + "suspender";
        var response = await httpClient.PostAsync(url, new StringContent(JsonSerializer.Serialize(email), Encoding.UTF8, "application/json"));
        return response.IsSuccessStatusCode;
    }

    public async Task<List<Actividad>> ObtenerActividades(string email)
    {
        var url = baseUrl + $"obtenerActividades/{email}";
        var response = await httpClient.GetAsync(url);
        return await response.Content.ReadFromJsonAsync<List<Actividad>>();
    }

    public async Task<List<Boleto>> ObtenerBoletos(int no_operacion)
    {   
        var url = baseUrl + $"obtenerBoletosActividad/{no_operacion}";
        var response = await httpClient.GetAsync(url);
        return await response.Content.ReadFromJsonAsync<List<Boleto>>();
    }
}
