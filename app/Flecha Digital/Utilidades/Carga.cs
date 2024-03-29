using Flecha_Digital.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Utilidades
{
    public class Carga
    {

        async Task ObtenerCentrales()
        {
            try
            {
                var centrales = await ServicioUsuarios.ObtenerCentral();
                if (centrales.Count != 0)
                    centrales.Clear();
                foreach (var central in centrales)
                {
                    Centrales.Add(central);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                await Shell.Current.DisplayAlert("Error", $"No se lograron cargar las centrales: {ex.Message}", "OK");
            }
            finally
            {
            }
        }
    }
}
