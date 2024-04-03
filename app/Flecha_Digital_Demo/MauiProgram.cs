using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Flecha_Digital_Demo.View;
using Syncfusion.Maui.Core.Hosting;
using Flecha_Digital_Demo.ViewModel;

namespace Flecha_Digital_Demo
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureSyncfusionCore()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });
            builder.Services.AddSingleton<Inicio>();
            builder.Services.AddSingleton<InicioViewModel>();
            builder.Services.AddSingleton<ServicioCentral>();
            builder.Services.AddSingleton<ServicioBoletos>();

            builder.Services.AddTransient<ModificarViaje>();
            
            builder.Services.AddTransient<ViajeViewModel>();
            
            builder.Services.AddSingleton<ServicioViajes>();

#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
