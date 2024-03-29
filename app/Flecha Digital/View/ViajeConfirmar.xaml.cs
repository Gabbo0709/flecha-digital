using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class ViajeConfirmar : ContentPage
{
	public ViajeConfirmar(ViajeConfirmarViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
	protected override void OnNavigatedTo(NavigatedToEventArgs args)
	{
        base.OnNavigatedTo(args);
    }
}