using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital_Demo.ViewModel;

public partial class InicioViewModel : BaseViewModel
{    
    public ObservableCollection<string> Categoria { get; } = new();

    ServicioCentral servicesCentral;
    [ObservableProperty] string minDate = DateTime.Now.ToString("dd/mm/YYYY");


    [ObservableProperty]
    public Boleto? boleto;

    public ObservableCollection<Central>? Centrales { get; } = new();

    public InicioViewModel(ServicioCentral servicesCentral)
    {
        this.servicesCentral = servicesCentral;
        if(Categoria.Count != 0)
            Categoria.Clear();
        Categoria.Add("Completo");
        Categoria.Add("Inapam");
        Categoria.Add("Medio");
        Categoria.Add("Profesor");

    }

    public async Task LoadCentrales()
    {
        if (IsBusy)
            return;

        try
        {
            IsBusy = true;
            var centrales = await servicesCentral.CargarCentral();
            if (Centrales.Count != 0)
                Centrales.Clear();

            foreach (var central in centrales)
            {
                central.nombre_central = $"{central.nombre_central}, {central.abreviatura}, {central.municipio}, {central.estado}";
                Centrales.Add(central);
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine(ex);
            await Shell.Current.DisplayAlert("Error", "No se pudo cargar las centrales", "Aceptar");
        }
        finally
        {
            IsBusy = false;
        }
    }

    [RelayCommand]
    async Task GuardarBoleto(Boleto boleto)
    {
        if (IsBusy)
            return;

        if (boleto is null)
            return;
        IsBusy = true;
        try
        {
            await Shell.Current.DisplayAlert("Boleto Guardado", "El boleto ha sido guardado con éxito", "Aceptar");
        }
        catch (Exception)
        {
            await Shell.Current.DisplayAlert("Error", "No se pudo guardar el boleto", "Aceptar");
        }
        finally
        {
            IsBusy = true;
        }
    }
}