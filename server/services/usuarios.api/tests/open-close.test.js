const Database = require('../data/dao');
const dbConfig = require('../data/config');

describe('open-close', () => {
    let database;

    beforeAll(() => {
        database = new Database(dbConfig);
    });

    afterAll(() => {
        database.close();
    });

    it('debería abrir y cerrar la conexión a la base de datos', async () => {
        await database.connect();
        expect(database.isConnected()).toBe(true); // Check if the connection is open
        await database.close();
        expect(database.isConnected()).toBe(false); // Check if the connection is closed
    });
});