const Actividad = require('../models/classes/actividad');
const BoletosRepositorio = require('../models/classes/boletos-repositorio');
const Boleto = require('../models/classes/boleto');

describe('Test de obtener boletos de actividad', () => {
    test('No hay boletos de la actividad', async () => {
        const actividad = { no_operacion: 1 };
        const act = new Actividad(actividad);
        const result = await BoletosRepositorio.obtenerBoletosActividad(act);
        expect(result).not.toBeNull();
        expect(result).toBeInstanceOf(Array);
        expect(result.length).toBe(0);
    });
});