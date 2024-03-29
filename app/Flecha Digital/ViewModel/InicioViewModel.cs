using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;
public partial class InicioViewModel : BaseViewModel
{
    [ObservableProperty]
    public Viaje viaje;

    [ObservableProperty]
    public string hoy = DateTime.Today.ToString("MM/dd/yyyy");

    ServicioUsuarios servicioUsuarios;
    public ObservableCollection<Central> Centrales { get; } = new();
    public InicioViewModel(ServicioUsuarios servicioUsuarios)
    {
        Title = "Flecha Digital";
        this.servicioUsuarios = servicioUsuarios;
    }

    [RelayCommand]
    async Task GoToAgendarViaje(Viaje viaje)
    {
        if(viaje is null)
            return;
        await Shell.Current.GoToAsync($"{nameof(AgendarViaje)}", true,
        new Dictionary<string, object>
        {
            { "Viaje", viaje }
        });
    }

    [RelayCommand]
    async Task ObtenerCentrales()
    {
        if(IsBusy)
            return;
        try
        {
            IsBusy = true;
            var centrales = await servicioUsuarios.ObtenerCentral();
            if(centrales.Count != 0)
            centrales.Clear();
            foreach(var central in centrales)
            {
                Centrales.Add(central);
            }
        }
        catch(Exception ex)
        {
            Debug.WriteLine(ex);
            await Shell.Current.DisplayAlert("Error", $"No se lograron cargar las centrales: {ex.Message}", "OK");
        }
        finally
        {
            IsBusy = false;
        }
    }
}