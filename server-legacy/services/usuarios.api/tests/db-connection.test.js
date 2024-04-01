const dao = require('../data/dao');

describe('Test de conexion a la base de datos', () => {
    test('Conexion a la base de datos', async () => {
        const result = await dao.conexion();
        expect(result).toBeDefined();
        console.log(result);
    });
    test('Ejecutar select a la base de datos', async () => {
        const query = 'SELECT * FROM Central';
        const result = await dao.consultar(query);
        expect(result).toBeDefined();
        console.log(JSON.stringify(result));
    });
});