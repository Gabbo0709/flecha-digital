const Boleto = require('./boleto');
const Operacion = require('./operacion');
const dao = require('../../data/dao');

class boletosRepositorio{
    
    /** 
     * @param {Operacion} operacion
     * @returns {Promise<boolean>}
     * @description Muetra el boleto guardado.
     */
    static async confirmarBoleto(operacion)
    {
        if(!(operacion instanceof Operacion)) {
            return false;
        }
        const query = `SELECT * FROM Boleto WHERE no_operacion = ${operacion.no_operacion}`;
        const result = await dao.consultar(query);
        const boletos = result.map(b => new Boleto(b));
        return boletos != undefined && boletos.length > 0;      
    }
}   
/**
 * CREATE TABLE Boleto( -- Boletos comprados por los usuarios
	no_boleto					INT PRIMARY KEY	NOT NULL,
	cve_tipo 					INT FOREIGN KEY (cve_tipo) REFERENCES Tipo_Boleto(cve_tipo) NOT NULL,
	no_operacion				INT FOREIGN KEY (no_operacion) REFERENCES Operacion (no_operacion) NOT NULL,
	cve_asiento					INT FOREIGN KEY (cve_asiento) REFERENCES Asiento(cve_asiento)NOT NULL,
	cve_estado					INT FOREIGN KEY (cve_estado) REFERENCES Estado_Boleto(cve_estado) DEFAULT 2,
	nombre_pas					NVARCHAR (128) NOT NULL,
	token_fac					NVARCHAR(128) NOT NULL,
	no_asiento_boleto			INT NOT NULL,
	puerta						NVARCHAR(128),
	carril						INT,
	anden						INT,
	costo_boleto				MONEY NOT NULL
)
 */