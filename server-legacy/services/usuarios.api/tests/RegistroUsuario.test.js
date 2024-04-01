const Usuario = require('../models/classes/usuario');
const usuariosRepositorio = require('../models/classes/usuarios-repositorio');
const dao = require('../data/dao');


describe('Test de conexion a la base de datos', () => {
    test('Conexion a la base de datos', async () => {
        const result = await dao.conexion();
        expect(result).toBeDefined();
        console.log(result);
    });
  

    test('debería retornar true si el usuario se registra correctamente', async () => {
        const usuario = new Usuario({});
        usuario.nombre = 'nombre';
        usuario.apellido = 'apellido';
        usuario.pass = 'pass';
        usuario.correo = 'correo';
        usuario.tel_user = 123456;
        usuario.cve_estado = 1;
    
        // Llamamos a la función registrarUsuario
        const resultado = await usuariosRepositorio.registrarUsuario(usuario);
    
        // Verificamos que el resultado sea true
        expect(resultado).toBe(true);
    });
    
});