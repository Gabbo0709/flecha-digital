using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;

public partial class RegistroViewModel : BaseViewModel
{
    [ObservableProperty]
    public Usuario usuario;

    public RegistroViewModel()
    {
        Title = "Registro";
    }

    [RelayCommand]
    async Task GoToInicioSesion()
    {
        await Shell.Current.GoToAsync($"{nameof(InicioSesion)}");
    }

    [RelayCommand]
    async Task GoToRegistroPass(Usuario usuario)
    {
        if (usuario.nombre_user is null || usuario.email is null || usuario.apellido is null)
        {
            await Shell.Current.DisplayAlert("Error", "Debe llenar todos los campos", "OK");
            return;
        }
        await Shell.Current.GoToAsync($"{nameof(RegistroPass)}", true,
                       new Dictionary<string, object>
                       {
                { "Usuario", usuario }
            });
    }
}

