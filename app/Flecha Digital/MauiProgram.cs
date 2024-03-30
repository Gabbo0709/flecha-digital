using Microsoft.Extensions.Logging;
using Flecha_Digital.Services;
using Flecha_Digital.ViewModel;
using Syncfusion.Maui.Core.Hosting;
using Flecha_Digital.Utilidades;
using Flecha_Digital.Extensions;
using Plugin.Firebase.Crashlytics;

namespace Flecha_Digital
{
	public static class MauiProgram
	{
		public static MauiApp CreateMauiApp()
		{
			var builder = MauiApp.CreateBuilder();
			builder
				.UseMauiApp<App>()
				.RegisterFirebaseServices()
                .ConfigureSyncfusionCore()
                .ConfigureFonts(fonts =>
				{
					fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
					fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");					
				});

			CrossFirebaseCrashlytics.Current.SetCrashlyticsCollectionEnabled(true);
			//En esta seccion se agregan los modelos, las paginas y los viewmodels de la app
			//Singleton se usa para que solo haya una instancia de la clase
			//Transient se usa para que se cree una nueva instancia cada vez que se solicite
			//Inicio
			builder.Services.AddTransient<MainPage>();
			builder.Services.AddSingleton<InicioViewModel>();
			builder.Services.AddSingleton<ServicioUsuarios>();

            //Toda la seccion de viajes y asientos
            builder.Services.AddSingleton<ServicioViajes>();
			builder.Services.AddTransient<ViajeViewModel>();
			builder.Services.AddTransient<AgendarViaje>();
			builder.Services.AddTransient<AutobusViewModel>();
			builder.Services.AddTransient<Autobus>();
			builder.Services.AddTransient<Asiento>();
			//Seccion de reserva y pago
			builder.Services.AddSingleton<ServicioReservas>();
			builder.Services.AddTransient<ViajeConfirmarViewModel>();
			builder.Services.AddTransient<ViajePagoViewModel>();
			builder.Services.AddTransient<ViajePago>();

			//Seccion de perfil

			//Carga o actualizacion de centrales
			Carga.ObtenerCentrales().Wait();

			//Envio de token a Firebase
			Carga.EnviarFirebaseToken().Wait();

#if DEBUG
		builder.Logging.AddDebug();
#endif

			return builder.Build();
		}
	}
}