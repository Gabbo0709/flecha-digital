
using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;

[QueryProperty("Usuario", "usuario")]
public partial class RegistroPassViewModel : BaseViewModel
{
    [ObservableProperty]
    public Usuario usuario;
    public ServicioUsuarios servicioUsuarios;
   
    public RegistroPassViewModel(ServicioUsuarios servicioUsuarios)
    {
        this.servicioUsuarios = servicioUsuarios;
    }
    [RelayCommand]
    async Task RegistrarUsuario()
    {
        string pass = NameScopeExtensions.FindByName<Entry>(Shell.Current, "txtPass").Text;
        string pass2 = NameScopeExtensions.FindByName<Entry>(Shell.Current, "txtPass2").Text;
        if (pass != pass2)
        {
            await Shell.Current.DisplayAlert("Error", "Las contraseñas no coinciden", "OK");
            return;
        }
        Usuario.pass = pass;
        //await Shell.Current.GoToAsync($"{nameof(RegistroConfirmar)}", true,
        //new Dictionary<string, object>
        //{
        //    { "Usuario", Usuario }
        //});
        if(await servicioUsuarios.RegistrarUsuario(Usuario))
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        else
            await Shell.Current.DisplayAlert("Error", "No se pudo registrar el usuario", "OK");
    }   
}

