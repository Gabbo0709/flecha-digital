using System;
using Microsoft.Maui.LifecycleEvents;
using Plugin.Firebase.Auth;
using Plugin.Firebase.Bundled.Shared;
#if IOS
using Plugin.Firebase.Bundled.Platforms.iOS;
#elif ANDROID
using Plugin.Firebase.Bundled.Platforms.Android;
#endif

namespace Flecha_Digital.Extensions
{
	public static class MauiProgramExtensions
	{
		public static MauiAppBuilder RegisterFirebaseServices(this MauiAppBuilder builder)
		{
			builder.ConfigureLifecycleEvents(events =>
			{
#if IOS
				events.AddiOS(iOS => iOS.FinishedLaunching((app, launchOptions) => {
					CrossFirebase.Initialize(CreateCrossFirebaseSettings());
					return false;
				}));
#elif ANDROID
				events.AddAndroid(android => android.OnCreate((activity, _) =>
					CrossFirebase.Initialize(activity, CreateCrossFirebaseSettings())));
#endif
			});
			builder.Services.AddSingleton(_ => CrossFirebaseAuth.Current);
			return builder;
		}

		private static CrossFirebaseSettings CreateCrossFirebaseSettings()
		{
			return new CrossFirebaseSettings(
				isAuthEnabled: true,
				isCloudMessagingEnabled: true
				);
		}
	}
}
