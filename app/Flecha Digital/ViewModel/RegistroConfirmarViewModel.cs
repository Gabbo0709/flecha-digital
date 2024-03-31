
using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;
[QueryProperty("Usuario", "usuario")]

    public partial class RegistroConfirmarViewModel : BaseViewModel
    {
    ServicioUsuarios servicioUsuarios;
    [ObservableProperty]
    public Usuario usuario;
    public RegistroConfirmarViewModel(ServicioUsuarios servicioUsuarios)
    {
        this.servicioUsuarios = servicioUsuarios;
    }
    [RelayCommand]
    async Task ConfirmarRegistro()
    {
        if(await servicioUsuarios.RegistrarUsuario(Usuario))
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        else
            await Shell.Current.DisplayAlert("Error", "No se pudo registrar el usuario", "OK");
    }
    }

