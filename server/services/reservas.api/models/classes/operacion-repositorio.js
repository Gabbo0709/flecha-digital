const Boleto = require('./boleto');
const Operacion = require('./operacion');
const Viaje = require('./viaje');

class operacionRepositorio {
   /**
    * @description Registra una operacion en la base de datos.
    * @param { Operacion } operacion
    * @param { Viaje } viaje 
    * @param { id_usuario } id_usuario,
    * @param { cant_boletos } cant_boletos,
    * @param { costo_total } costo_total
    * @param { cve_metodo } cve_metodo,
    * @param { cve_origen } cve_origen,
    * @param { cve_destino } cve_destino,
    * @param { fecha_salida } fecha_salida

    * @return {Promise<boolean>}  
    */
    static async registrarOperacion(operacion, viaje) {
        const query = `EXEC InsertarOperacionYBoletos ${operacion.id_usuario},${operacion.cant_boletos}, ${poperacion.costo_total},${operacion.cve_metodo},${viaje.origen_viaje},${viaje.destino_viaje},${viaje.fecha_salida}`;
        return  await dao.ejecutarQuery(query);
    }

   

}