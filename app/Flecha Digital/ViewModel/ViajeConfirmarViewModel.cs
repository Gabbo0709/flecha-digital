using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.ViewModel;
[QueryProperty("Asiento", "Asiento")]
public partial class ViajeConfirmarViewModel : BaseViewModel
{
    [ObservableProperty]
    Asiento asiento;
    async Task GoToViajePago(Boleto boleto)
    {
        if (boleto is null)
            return;
        await Shell.Current.GoToAsync($"{nameof(ViajePago)}", true,
            new Dictionary<string, object>
            {
                {
                    "Boleto", boleto
                }
            });
    }
}

