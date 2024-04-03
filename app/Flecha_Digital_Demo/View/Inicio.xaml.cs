using Flecha_Digital_Demo.ViewModel;

namespace Flecha_Digital_Demo.View;

public partial class Inicio : ContentPage
{
	public Inicio(InicioViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;

	}
	protected override async void OnAppearing()
	{
        base.OnAppearing();
		await ((InicioViewModel)BindingContext).LoadCentrales();
		
    }
}