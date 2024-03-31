using Flecha_Digital.Services;


namespace Flecha_Digital.ViewModel;

[QueryProperty("Usuario", "Usuario")]
public partial class CambiarPassViewModel : BaseViewModel
{
    ServicioUsuarios servicioUsuarios;

    [ObservableProperty]
    public Usuario usuario;
    public CambiarPassViewModel(ServicioUsuarios servicioUsuarios)
    {
        this.servicioUsuarios = servicioUsuarios;
    }

    [RelayCommand]
    async Task CambiarPass()
    {
        if(IsBusy)
            return;
        IsBusy = true;
        try
        {
            string pass = NameScopeExtensions.FindByName<Entry>(Shell.Current, "txtPass").Text;
            string newPass = NameScopeExtensions.FindByName<Entry>(Shell.Current, "txtNewPass").Text;
            string confirmarPass = NameScopeExtensions.FindByName<Entry>(Shell.Current, "txtConfirmarPass").Text;
            if (newPass != confirmarPass)
            {
                await Shell.Current.DisplayAlert("Error", "Las contraseñas no coinciden", "OK");
                return;
            }
            if (await servicioUsuarios.AutenticarUsuario(Usuario.email, pass))
            {
                if (await servicioUsuarios.ActualizarPass(Usuario.email, newPass))
                {
                    await Shell.Current.DisplayAlert("Exito", "Contraseña cambiada con éxito", "OK");
                    await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
                }
                else
                {
                    await Shell.Current.DisplayAlert("Error", "No se pudo cambiar la contraseña", "OK");
                }
            }
        }
        catch(Exception ex)
        {
            await Shell.Current.DisplayAlert("Error", ex.Message, "OK");
        }
        finally
        {
            IsBusy = false;
        }        
    }
}
