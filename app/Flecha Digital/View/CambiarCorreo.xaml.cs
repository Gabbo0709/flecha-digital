using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class CambiarCorreo : ContentPage
{
	public CambiarCorreo(InicioViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
}