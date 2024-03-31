using Flecha_Digital.Services;
using System.Collections.Generic;

namespace Flecha_Digital.ViewModel;

public partial class InicioViewModel : BaseViewModel
{
    [ObservableProperty]
    Usuario usuario;

    [ObservableProperty]
    public Viaje viaje;

    [ObservableProperty]
    public string hoy = DateTime.Today.ToString("MM/dd/yyyy");

    ServicioUsuarios servicioUsuarios;
    public ObservableCollection<Central> Centrales { get; } = new();
    public InicioViewModel()
    {
        Title = "Flecha Digital";
        Centrales = JsonSerializer.Deserialize<ObservableCollection<Central>>(File.ReadAllText("centrales.json"));
        Usuario = JsonSerializer.Deserialize<Usuario>(File.ReadAllText("usuario.json"));
    }

    [RelayCommand]
    async Task GoToAgendarViaje(Viaje viaje)
    {
        if (viaje is null)
            return;
        await Shell.Current.GoToAsync($"{nameof(AgendarViaje)}", true,
        new Dictionary<string, object>
        {
            { "Viaje", viaje }
        });
    }
    [RelayCommand]
    async Task CerrarSesion()
    {
        File.Delete("usuario.json");
        if (!File.Exists("usuario.json"))
        {
            Usuario = null;
            await Shell.Current.GoToAsync($"{nameof(InicioSesion)}");
        }
        else
            await Shell.Current.DisplayAlert("Error", "No se pudo cerrar sesión", "OK");
    }

    [RelayCommand]
    async Task CambiarPass()
    {
        await Shell.Current.GoToAsync($"{nameof(CambiarPass)}", true,
            new Dictionary<string, object>
            {
                { "Usuario", Usuario }
            });
    }
    [RelayCommand]
    async Task CambiarCorreo()
    {
        await Shell.Current.GoToAsync($"{nameof(CambiarCorreo)}", true,
            new Dictionary<string, object>
            {
                { "Usuario", Usuario }
            });
    }

}