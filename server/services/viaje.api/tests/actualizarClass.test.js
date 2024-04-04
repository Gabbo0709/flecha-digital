const GooglePassClassesRepositorio = require('../models/classes/google-pass-classes-repositorio');

/** 
 * @method actualizarClass
 * @description Método que se encarga de actualizar la  una clase de Google Pass
 * @param { any } clase - Clase de Google Pass
 * @returns { Promise<boolean> } - Retorna la respuesta de la actualización de la clase
 */
test("Actualizar la clase ", () => {
    const clase = {
        viaje_id: "123", logo: "https://i.pinimg.com/originals/05/3b/db/053bdb6463258c8b122a8481a30a7f93.jpg", origen: "veracruz", destino: "cdmx", fecha_salida: "2025-04-12T12:20", puerta_embarque: "A30", imagen_pie: "https://i.pinimg.com/originals/05/3b/db/053bdb6463258c8b122a8481a30a7f93.jpg"
    }
    const a = new GooglePassClassesRepositorio();
    const testclass =  a.actualizarClass(clase);
    return expect(testclass).toBeTruthy();    


});