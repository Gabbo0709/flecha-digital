

namespace Flecha_Digital.ViewModel;

[QueryProperty("Asiento", "Asiento")]
public partial class AsignarAsientoViewModel : BaseViewModel
{
    [ObservableProperty]
    Asiento asiento;

    public ObservableCollection<Asiento> asientos;
    public AsignarAsientoViewModel()
    {
        Title = "Asignar Asiento";
    }

    [RelayCommand] //Navega hacia Viaje confirmar
    async Task GoToViajeConfirmar(Boleto boleto)
    {
        if (boleto is null)
            return;
        await Shell.Current.GoToAsync($"{nameof(ViajeConfirmar)}", true,
            new Dictionary<string, object>
            {
                    {
                        "Asiento", Asiento
                    }
            });
    }
}

