using System.Text.Json;

namespace Flecha_Digital_Demo.Services;

public class ServicioCentral
{
    List<Central>? centrales = new();
    public async Task<List<Central>> CargarCentral()
    {
        if (centrales?.Count > 0)
        {
            return centrales;
        }
        using Stream stream = await FileSystem.OpenAppPackageFileAsync("centrales.json");
        using StreamReader reader = new StreamReader(stream);
        var content = await reader.ReadToEndAsync();
        centrales = JsonSerializer.Deserialize<List<Central>>(content);
        return centrales;
    }
}