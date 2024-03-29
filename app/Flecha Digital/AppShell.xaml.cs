namespace Flecha_Digital;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();
        Routing.RegisterRoute(nameof(ActualizarCorreo), typeof(ActualizarCorreo));
        Routing.RegisterRoute(nameof(Autobus), typeof(Autobus));
        Routing.RegisterRoute(nameof(InicioConfirmar), typeof(InicioConfirmar));
        Routing.RegisterRoute(nameof(InicioSesion), typeof(InicioSesion));
        Routing.RegisterRoute(nameof(NuevaPass), typeof(NuevaPass));
        Routing.RegisterRoute(nameof(RecuperarPass), typeof(RecuperarPass));
        Routing.RegisterRoute(nameof(Registro), typeof(Registro));
        Routing.RegisterRoute(nameof(Tutorial), typeof(Tutorial));
        Routing.RegisterRoute(nameof(ViajeConfirmar), typeof(ViajeConfirmar));
        Routing.RegisterRoute(nameof(ViajePago), typeof(ViajePago));
        Routing.RegisterRoute(nameof(AgendarViaje), typeof(AgendarViaje));
    }
}
