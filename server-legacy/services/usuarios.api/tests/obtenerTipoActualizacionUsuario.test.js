const Usuario = require('../models/classes/usuario');
const RepositorioUsuario = require('../models/classes/usuarios-repositorio');

describe('Test de generarcion de query segun el tipo de actualizacion', () => {
    test('Obtener query para actualizar nombre', () => {
        const usuario = {nombre_user: 'Gabriel'};
        const result = RepositorioUsuario.obtenerTipoActualizacionUsuario(new Usuario(usuario));
        expect(result).toContain('nombre_user = \'Gabriel\'');
        console.log(result);
    });
    test('Obtener query para actualizar apellido', () => {
        const usuario = {apellido: 'Gonzalez'};
        const result = RepositorioUsuario.obtenerTipoActualizacionUsuario(new Usuario(usuario));
        expect(result).toContain('apellido = \'Gonzalez\'');
        console.log(result);
    });
    test('Obtener query para actualizar email', () => {
        const usuario = {email: 'a@a'};
        const result = RepositorioUsuario.obtenerTipoActualizacionUsuario(new Usuario(usuario));
        expect(result).toContain('email = \'a@a\'');
        console.log(result);
    });
    test('Obtener query para actualizar telefono', () => {
        const usuario = {tel_user: 1234567890};
        const result = RepositorioUsuario.obtenerTipoActualizacionUsuario(new Usuario(usuario));
        expect(result).toContain('tel_user = 1234567890');
        console.log(result);
    });
});
