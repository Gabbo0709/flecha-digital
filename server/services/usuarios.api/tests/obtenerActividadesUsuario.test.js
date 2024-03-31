const Actividad = require('../models/classes/actividad');
const ActividadesRepositorio = require('../models/classes/actividades-repositorio');
const Usuario = require('../models/classes/usuario');

describe('Test de obetener actividades de usuario', () => {
    test('No hay actividad del usuario', async () => {
        const usuario = { email: 'gabbo0709@gmail.com' };
        const user = new Usuario(usuario);
        const result = await ActividadesRepositorio.obtenerActividadesUsuario(user);
        expect(result).not.toBeNull();
        expect(result).toBeInstanceOf(Array);
        expect(result.length).toBe(0);
    });
    test('Actividades del usuario', async () => {
        const usuario = { email: 'gabbo0709@gmail.com' };
        const user = new Usuario(usuario);
        const result = await ActividadesRepositorio.obtenerActividadesUsuario(user);
        expect(result).not.toBeNull();
        expect(result).toBeInstanceOf(Array);
        expect(result.length).toBeGreaterThan(0);
        expect(result[0]).toBeInstanceOf(Actividad);
        console.log(result);
    });
});