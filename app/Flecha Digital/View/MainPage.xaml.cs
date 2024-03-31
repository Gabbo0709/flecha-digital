using Flecha_Digital.Utilidades;
using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class MainPage : ContentPage
{
	public MainPage(InicioViewModel viewModel)
	{
        InitializeComponent();
        BindingContext = viewModel;
    }
}
