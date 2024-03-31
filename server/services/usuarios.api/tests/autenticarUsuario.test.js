const Usuario = require('../models/classes/usuario');
const RepositorioUsuario = require('../models/classes/usuarios-repositorio');

describe('Test de autenticacion de usuario', () => {
    test('Autenticar usuario valido y activo', async () => {
        const usuario = {email: 'e.gus.gg@gmail.com', pass: '12345'};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeTruthy();
    });
    test('Autenticar usuario valido y no activo', async () => {
        const usuario = {email: 'gabbo0709@gmail.com', pass: '12345'};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario no valido', async () => {
        const usuario = {email: 'a@a', pass: '123'};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario sin pass', async () => {
        const usuario = {email: 'gabbo0709@gmail.com', pass: ''};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario sin email', async () => {
        const usuario = {email: '', pass: '123'};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario sin email y pass', async () => {
        const usuario = {email: '', pass: ''};
        const result = await RepositorioUsuario.autenticarUsuario(new Usuario(usuario));
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario sin usuario', async () => {
        const result = await RepositorioUsuario.autenticarUsuario(null);
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario con usuario no valido', async () => {
        const result = await RepositorioUsuario.autenticarUsuario({email: 'a@a', pass: '123'});
        expect(result).toBeFalsy();
    });
    test('Autenticar usuario con pass no valido', async () => {
        const result = await RepositorioUsuario.autenticarUsuario({email: 'e.gus.gg@gmail.com', pass: '1234'});
        expect(result).toBeFalsy();
    });
});