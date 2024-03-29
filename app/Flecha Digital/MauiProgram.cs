using Microsoft.Extensions.Logging;
using Flecha_Digital.Services;
using Flecha_Digital.ViewModel;
using Syncfusion.Maui.Core.Hosting;

namespace Flecha_Digital
{
	public static class MauiProgram
	{
		public static MauiApp CreateMauiApp()
		{
			var builder = MauiApp.CreateBuilder();
			builder
				.UseMauiApp<App>()
                .ConfigureSyncfusionCore()
                .ConfigureFonts(fonts =>
				{
					fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
					fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");					
				});
			builder.Services.AddSingleton<MainPage>();
			
			builder.Services.AddSingleton<InicioViewModel>();
			builder.Services.AddSingleton<ServicioUsuarios>();

			builder.Services.AddSingleton<ServicioViajes>();
			builder.Services.AddTransient<ViajeViewModel>();
			builder.Services.AddTransient<AgendarViaje>();

			builder.Services.AddTransient<AutobusViewModel>();
			builder.Services.AddTransient<Autobus>();

#if DEBUG
		builder.Logging.AddDebug();
#endif

			return builder.Build();
		}
	}
}