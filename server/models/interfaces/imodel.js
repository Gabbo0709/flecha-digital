//Interfaz para modelos de base de datos

class IModel {
    constructor() {
        if (this.constructor === IModel) {
            throw new Error("Cannot instantiate interface");
        }
    }

    //Método para obtener todos los registros de un modelo
    getAll() {
        throw new Error("Method not implemented");
    }

    //Método para obtener un registro por su id
    getById(id) {
        throw new Error("Method not implemented");
    }

    //Método para crear un registro
    create(data) {
        throw new Error("Method not implemented");
    }

    //Método para actualizar un registro
    update(id, data) {
        throw new Error("Method not implemented");
    }

    //Método para eliminar un registro
    delete(id) {
        throw new Error("Method not implemented");
    }
}

module.exports = IModel;