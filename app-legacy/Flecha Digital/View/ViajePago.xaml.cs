using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class ViajePago : ContentPage
{
	public ViajePago(ViajePagoViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
	protected override void OnNavigatedTo(NavigatedToEventArgs args)
	{
        base.OnNavigatedTo(args);
    }
}