const sql = require('mssql');
const dbConfig = require('../config/db');

const conexion = async () => {
    try {
        let pool = sql.connect(dbConfig);
        return pool;
    } catch (error) {
        console.log(error);
    }
};

const ejecutarQuery = async (query) => {
    try {
        let pool = await conexion();
        let result = await pool.request().query(query);
        return result.rowsAffected[0] > 0;
    }
    catch (error) {
        console.log(error);
    }
};

const consultar = async (query) => {
    try {
        let pool = await conexion();
        let result = await pool.request().query(query);
        return result.recordset;
    }
    catch (error) {
        console.log(error);
    }
};

module.exports = { ejecutarQuery, consultar, conexion };