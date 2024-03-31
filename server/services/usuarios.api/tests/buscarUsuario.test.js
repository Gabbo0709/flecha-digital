const UsuariosRepositorio = require('../models/classes/usuarios-repositorio');
const Usuario = require('../models/classes/usuario');

describe('Bucar usuario por correo', () => {
        test('Encontrar usuario por correo', async () => {
            const email = 'gabbo0709@gmail.com';
            const result = await UsuariosRepositorio.buscarUsuarioCorreo(email);
            expect(result).instanceOf(Usuario);
        });
    }); 
