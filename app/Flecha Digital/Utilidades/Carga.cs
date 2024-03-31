using Flecha_Digital.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Flecha_Digital.Model;
using System.Configuration;
using Plugin.Firebase;
using Plugin.Firebase.CloudMessaging;

namespace Flecha_Digital.Utilidades
{
	public class Carga
	{
		public static async Task ObtenerCentrales()
		{

			// Revisar si el archivo existe
			var fileExists = File.Exists("centrales.json");
			List<Central> centrales = new List<Central>();
			// Reivsar si el archivo existe en los archivos de la aplicación
			if (fileExists)
			{
				var json = await File.ReadAllTextAsync("centrales.json");
				centrales = JsonSerializer.Deserialize<List<Central>>(json);
			}
			// Revisar si la información del archivo está actualizada
			var client = new HttpClient();
			//Get URL from App.config
			var url = ConfigurationManager.AppSettings["URL"];
			var response = await client.GetAsync($@"{url}/obtenerCentrales?centrales={centrales.Count}");
			var result = response.IsSuccessStatusCode ? await response.Content.ReadAsStringAsync() : null;
			if (result != "actualizado")
			{
				var centralesActualizadas = JsonSerializer.Deserialize<List<Central>>(result);
				centrales.AddRange(centralesActualizadas);
				// Vaciar el archivo y escribir la nueva información
				await File.WriteAllTextAsync("centrales.json", string.Empty);
				await File.WriteAllTextAsync("centrales.json", JsonSerializer.Serialize(centrales));
			}
		}
        public static async Task RegistroToken()
        {
			// Reivsar si el archivo existe en los archivos de la aplicación
			var fileExists = File.Exists("usuario.json");
			if(!fileExists)
			{
				await Shell.Current.GoToAsync($"{nameof(InicioSesion)}");
			}
        }
        public static async Task EnviarFirebaseToken()
		{
			await CrossFirebaseCloudMessaging.Current.CheckIfValidAsync();
			var token = await CrossFirebaseCloudMessaging.Current.GetTokenAsync();
			var client = new HttpClient();
			//Get URL from App.config
			var url = ConfigurationManager.AppSettings["URL"];
			var response = await client.GetAsync($@"{url}/enviarToken?token={token}");
			var result = response.IsSuccessStatusCode ? await response.Content.ReadAsStringAsync() : null;
			if (result != "ok")
			{
				// Log error
			}
		}
	}
}