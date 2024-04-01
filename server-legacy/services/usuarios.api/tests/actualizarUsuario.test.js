const UsuariosRepositorio = require('../models/classes/usuarios-repositorio');
const Usuario = require('../models/classes/usuario');
const dao = require('../data/dao');

describe('Test de actualizacion de usuario', () => {
    test('Actualizar email', async () => {
        let email = 'gabbo0709@gmail.com';
        let usuario = {email: 'gabbo0709@gmail.com'};
        const user = new Usuario(usuario);
        const result = await UsuariosRepositorio.actualizarUsuario(email, user);
        expect(result).toBeTruthy();
    });
    test('Actualizar nombre', async () => {
        let email = 'gabbo0709@gmail.com'
        let usuario = {nombre_user: 'Gabriel'};
        const user = new Usuario(usuario);
        const result = UsuariosRepositorio.actualizarUsuario(email, user);
        expect(result).toBeTruthy();

    });
    test('Actualizar apellido', async () => {
        let email = 'gabbo0709@gmail.com';
        let usuario = {apellido: 'Arcos'};
        const user = new Usuario(usuario);
        const result = UsuariosRepositorio.actualizarUsuario(email, user);
        expect(result).toBeTruthy();
    });
    test('Actualizar telefono', async () => {
        let email = 'gabbo0709@gmail.com';
        let usuario = {tel_user: '1234567890'};
        const user = new Usuario(usuario);
        const result = await UsuariosRepositorio.actualizarUsuario(email, user);
        expect(result).toBeTruthy();
    });

});