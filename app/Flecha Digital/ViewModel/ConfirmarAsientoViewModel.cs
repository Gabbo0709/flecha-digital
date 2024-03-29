using Flecha_Digital.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.ViewModel
{
    [QueryProperty("Asientos", "asientos")]
    public partial class ConfirmarAsientoViewModel : BaseViewModel
    {
        public ServicioViajes servicioViajes;
        [ObservableProperty]
        Asiento asiento;
        public ConfirmarAsientoViewModel(ServicioViajes servicioViajes)
        {
            this.servicioViajes = servicioViajes;
        }
    }
}
