const sql = require('mssql');
const dbConfig = require('../config/db');

async function conexion() {
    try {
        let pool = await sql.connect(dbConfig);
        return pool;
    } catch (error) {
        console.log(error);
    }
}
const pool = await conexion();

async function ejecutarQuery(query) {
    try {
        let result = await pool.request().query(query);
        return result.rowsAffected[0] > 0;
    }
    catch (error) {
        console.log(error);
    }
}

async function consultar(query) {
    try {
        let result = await pool.request().query(query);
        return result.recordset;
    }
    catch (error) {
        console.log(error);
    }
}

module.exports = { ejecutarQuery, consultar };