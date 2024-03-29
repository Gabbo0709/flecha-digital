namespace Flecha_Digital.Services;

public class ServicioViajes
{
    List<Asiento> listaAsientos = new();
    HttpClient client;
    string service = "https://localhost:44300/server/services/viajes.api/server/";
    public ServicioViajes()
    {
        client = new HttpClient();
    }
    List<Viaje> listaViajes = new();   
    public async Task<List<Viaje>> ObtenerViajes(Viaje viaje)
    {
        if (listaViajes?.Count > 0)
            return listaViajes;
        var url = $"{service}/buscarViaje/origen_viaje{viaje.origen}&destino_viaje{viaje.destino}&fecha_salida{viaje.fecha_salida}";
        var response = await client.GetAsync(url);
        if (response.IsSuccessStatusCode)
        {
            listaViajes = await response.Content.ReadFromJsonAsync<List<Viaje>>();
        }
        return listaViajes;
    }
    public async Task<List<Asiento>> ObtenerAsientos(Viaje viaje)
    {
        if(listaAsientos?.Count > 0)
            return listaAsientos;

        var url = $"{service}/obtenerAsiento/?{viaje.origen}&{viaje.destino}&{viaje.no_servicio}";
        var response = await client.GetAsync(url);
        if(response.IsSuccessStatusCode)
        {
            listaAsientos = await response.Content.ReadFromJsonAsync<List<Asiento>>();
        }
        return listaAsientos;
    }
    public async Task<bool> ActualizarViaje(Viaje viaje, DateTime tiempo)
    {
        string fecha = tiempo.ToString("yyyy-MM-dd");
        var url = $"{service}/actualizarViaje?no_servicio={viaje.no_servicio}?tiempo={fecha}";
        var response = await client.PostAsJsonAsync(url, viaje);
        return response.IsSuccessStatusCode;
    }

}
