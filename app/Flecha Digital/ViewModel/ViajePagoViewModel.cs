using Flecha_Digital.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.ViewModel
{
    [QueryProperty("Boleto", "Boleto")]
    public partial class ViajePagoViewModel : BaseViewModel
    {
        public ServicioReservas servicioReservas;
        [ObservableProperty]
        public Boleto[] boleto;
        public ViajePagoViewModel(ServicioReservas servicioReservas)
        {
            this.servicioReservas = servicioReservas;
        }
        async Task ReservarViaje(Boleto[] boleto)
        {
            if (IsBusy)
                return;
            try
            {
                Operacion operacion = new();//ObtenerOperacionActual 
                //If(pago)
                //{
                    if(await servicioReservas.ReservarBoletos(operacion, boleto)) 
                        await Shell.Current.DisplayAlert("Pago realizado", "Reservación exitosa", "OK");
                        await Shell.Current.GoToAsync($"{nameof(MainPage)}");
                //}
                //await Shell.Current.GoToAsync($"{Hubo un error en el pago, Intentelo de nuevo más tarde", "OK");    
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Error", $"No se logró realizar la reservación: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false;
            }
            
        }
    }
}
