using Flecha_Digital.ViewModel;

namespace Flecha_Digital.View;

public partial class AsignarAsiento : ContentPage
{
	public AsignarAsiento(AsignarAsiento viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
	protected override void OnNavigatedTo(NavigatedToEventArgs args)
	{
        base.OnNavigatedTo(args);
    }
}