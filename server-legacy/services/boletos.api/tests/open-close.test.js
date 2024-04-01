const Boleto = require('../Boleto');
describe('Boleto', () => {
    describe('constructor', () => {
        it('should create a new Boleto instance with provided values', () => {
            const boleto = new Boleto(
                '123456789',
                'OP123',
                'A1',
                'ESTADO1',
                'John Doe',
                1,
                'Puerta 1',
                'Carril 1',
                'Anden 1',
                'Credit Card',
                '1234567890',
                10.99
            );

            expect(boleto.no_boleto).toBe('123456789');
            expect(boleto.no_operacion).toBe('OP123');
            expect(boleto.cve_asiento).toBe('A1');
            expect(boleto.cve_estado).toBe('ESTADO1');
            expect(boleto.nombre_pas).toBe('John Doe');
            expect(boleto.no_asiento_boleto).toBe(1);
            expect(boleto.puerta).toBe('Puerta 1');
            expect(boleto.carril).toBe('Carril 1');
            expect(boleto.anden).toBe('Anden 1');
            expect(boleto.metodo_pago).toBe('Credit Card');
            expect(boleto.tel_cliente).toBe('1234567890');
            expect(boleto.costo).toBe(10.99);
        });
    });

    describe('constructor (from existing boleto)', () => {
        it('should create a new Boleto instance from an existing boleto object', () => {
            const existingBoleto = {
                no_boleto: '987654321',
                no_operacion: 'OP456',
                cve_asiento: 'B2',
                cve_estado: 'ESTADO2',
                nombre_pas: 'Jane Doe',
                no_asiento_boleto: 2,
                puerta: 'Puerta 2',
                carril: 'Carril 2',
                anden: 'Anden 2',
                metodo_pago: 'Cash',
                tel_cliente: '0987654321',
                costo: 20.99
            };

            const boleto = new Boleto(existingBoleto);

            expect(boleto.no_boleto).toBe('987654321');
            expect(boleto.no_operacion).toBe('OP456');
            expect(boleto.cve_asiento).toBe('B2');
            expect(boleto.cve_estado).toBe('ESTADO2');
            expect(boleto.nombre_pas).toBe('Jane Doe');
            expect(boleto.no_asiento_boleto).toBe(2);
            expect(boleto.puerta).toBe('Puerta 2');
            expect(boleto.carril).toBe('Carril 2');
            expect(boleto.anden).toBe('Anden 2');
            expect(boleto.metodo_pago).toBe('Cash');
            expect(boleto.tel_cliente).toBe('0987654321');
            expect(boleto.costo).toBe(20.99);
        });
    });
});
