﻿using Flecha_Digital.Services;

namespace Flecha_Digital.ViewModel;

public partial class InicioSesionViewModel : BaseViewModel
{
    ServicioUsuarios servicioUsuarios;
    public InicioSesionViewModel(ServicioUsuarios servicioUsuarios)
    {
        this.servicioUsuarios = servicioUsuarios;
    }
    [RelayCommand]
    async Task GoToRegistro()
    {
        await Shell.Current.GoToAsync($"{nameof(Registro)}");
    }
    [RelayCommand]
    async Task GoToRecuperarPass()
    {
        await Shell.Current.GoToAsync($"{nameof(RecuperarPass)}");
    }

    [RelayCommand]
    async Task IniciarSesion(Usuario usuario)
    {
        if(IsBusy)
            return;
        try
        {
            IsBusy = true;
            if (usuario.pass is null || usuario.email is null)
            {
                await Shell.Current.DisplayAlert("Error", "Debe llenar los campos de usuario y contraseña", "OK");
                return;
            }
            if(await servicioUsuarios.AutenticarUsuario(usuario.email, usuario.pass))
            {
                await Shell.Current.DisplayAlert("Bienvenido", "Inicio de sesión exitoso", "OK");
                await Shell.Current.GoToAsync($"{nameof(MainPage)}");
            }
            else
            {
                await Shell.Current.DisplayAlert("Error", "Usuario o contraseña incorrectos", "OK");
            }

        }
        catch (Exception ex)
        {
            Debug.WriteLine(ex);
        }
        finally
        {
            IsBusy = false;
        }   
    }
}

