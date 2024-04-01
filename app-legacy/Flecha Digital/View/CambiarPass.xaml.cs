using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class CambiarPass : ContentPage
{
	public CambiarPass(InicioViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
}