using Flecha_Digital.Services;


namespace Flecha_Digital.ViewModel;
[QueryProperty("Viaje", "viaje")]
public partial class AsientoViewModel : BaseViewModel
{
    [ObservableProperty]
    Viaje viaje;

    public ObservableCollection<Asiento> Asientos { get; } = new();

    ServicioViajes servicioViajes;
    public AsientoViewModel(ServicioViajes servicioViajes)
    {
        this.servicioViajes = servicioViajes;
    }
    [RelayCommand]
    async Task GoToAsignarAsiento(IEnumerable<Asiento> asiento)
    {
        if(asiento is null)
            return;
        await Shell.Current.GoToAsync($"{nameof(AsignarAsiento)}", true,
            new Dictionary<string, object>
            {
            { "Asiento", asiento }
        });
    }

    [RelayCommand]
    async Task ObtenerAsientos()
    {
        if (IsBusy)
            return;
        try
        {
            IsBusy = true;
            var asientos = await servicioViajes.ObtenerAsientos(Viaje);
            if (asientos.Count != 0)
                asientos.Clear();
            foreach (var asiento in asientos)
            {
                Asientos.Add(asiento);
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine(ex);
            await Shell.Current.DisplayAlert("Error", $"No se lograron cargar los asientos: {ex.Message}", "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
}

