using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;
[QueryProperty("Viaje", "Viaje")]
public partial class ViajeViewModel : BaseViewModel
{
    ServicioViajes servicioViajes;
    public ObservableCollection<Viaje> Viajes { get; } = new();
    public ViajeViewModel(ServicioViajes servicioViajes)
    {
        this.servicioViajes = servicioViajes;
    }
    [ObservableProperty]
    Viaje viaje;
    [RelayCommand]
    async Task ObtenerViajes()
    {
        if(IsBusy)
            return;
        try
        {
            IsBusy = true;
            var viajes = await servicioViajes.ObtenerViajes(Viaje);
            if(viajes.Count != 0)
                Viajes.Clear();
            foreach(var viaje in viajes)
            {
                Viajes.Add(viaje);
            }
        }
        catch(Exception ex)
        {
            Debug.WriteLine(ex);
            await Shell.Current.DisplayAlert("Error", $"No hay viajes disponibles con esas especificaciones: {ex.Message}", "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
    [RelayCommand]
    async Task GoToAutobus(Viaje viaje)
    {
        if(viaje is null)
            return;
        //Guardar el viaje en un archivo JSON
        await File.WriteAllTextAsync("viaje.json", JsonSerializer.Serialize(viaje));
        await Shell.Current.GoToAsync($"{nameof(Autobus)}", true,
                   new Dictionary<string, object>
                   {
            { "Viaje", viaje}
        });
    }
}