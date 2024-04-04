using System.Text.Json;

namespace boleto_apple_wallet.api.Modelos;
// Se declara la clase como parcial para poder extenderla en otro archivo
// Aquí se declaran los metodos de la clase
public partial class Boleto
{
	public string Serlializar()
	{
		return JsonSerializer.Serialize(this);
	}
	public string CrearPassAPartirDeTemplate()
	{
		var id_viaje = this.ViajeId;
		// Obtener el template de un archivo JSON en la carpeta PassesJSON\PassesTemplates en la raiz del proyecto
		if (id_viaje == null)
		{
			return "Error: No se ha especificado el id del viaje";
		}
		string path = Path.GetPathRoot(Environment.SystemDirectory) + @$"PassesJSON\PassesTemplates\{id_viaje}_template.json";
		if (!File.Exists(path))
		{
			return "Error: No se ha encontrado el template del viaje. El viaje no existe";
		}
		string template = File.ReadAllText(path);
		// Reemplazar los valores del template con los valores del boleto
		return template;
	}
}
