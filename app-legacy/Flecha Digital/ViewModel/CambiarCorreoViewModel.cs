using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;

[QueryProperty(nameof(Usuario), nameof(Usuario))]
public partial class CambiarCorreoViewModel : BaseViewModel
{
    [ObservableProperty]
    Usuario usuario;
    ServicioUsuarios servicioUsuarios;
    public CambiarCorreoViewModel(ServicioUsuarios servicioUsuarios)
    {
        this.servicioUsuarios = servicioUsuarios;
    }
    [RelayCommand]
    async Task ConfirmarCorreoCambiar()
    {
        if (IsBusy)
            return;
        IsBusy = true;
        try
        {
            await servicioUsuarios.ActualizarUsuario(Usuario);
        }
        finally
        {
            IsBusy = false;
        }
    }
}
