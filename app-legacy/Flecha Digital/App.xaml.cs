using Flecha_Digital.Services;
using Flecha_Digital.ViewModel;

namespace Flecha_Digital
{
	public partial class App : Application
	{
		public App()
		{
			InitializeComponent();     

			MainPage = new AppShell();
		}
    }
}