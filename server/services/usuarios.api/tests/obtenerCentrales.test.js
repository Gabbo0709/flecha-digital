const Central = require('../models/classes/central');
const CentralesRepositorio = require('../models/classes/centrales-repositorio');

describe('Test de obtener centrales', () => {
    test('Obtener centrales', async () => {
        const result = await CentralesRepositorio.obtenerCentrales();
        expect(result).not.toBeNull();
        expect(result).toBeInstanceOf(Array); // Array de objetos Central
        console.log(result);
    });
});