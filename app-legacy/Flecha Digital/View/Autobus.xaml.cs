using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class Autobus : ContentPage
{
	public Autobus(AutobusViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
	protected override void OnNavigatedTo(NavigatedToEventArgs args)
	{
        base.OnNavigatedTo(args);
    }
}