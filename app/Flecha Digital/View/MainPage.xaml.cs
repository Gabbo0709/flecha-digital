using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class MainPage : ContentPage
{
	public MainPage(InicioViewModel viewModel)
	{
        InitializeComponent();
        BindingContext = viewModel.Centrales;//Muestra automaticamente las centrales al entrar en la aplicación o página
    }
}