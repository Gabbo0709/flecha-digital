using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class AgendarViaje : ContentPage
{
	public AgendarViaje(ViajeViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
	protected override void OnNavigatedTo(NavigatedToEventArgs args)
	{
        base.OnNavigatedTo(args);
    }

}