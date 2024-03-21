const sql = require('mssql');
const config = require('../config/db').default;

// Function to connect to database

const connect = async () => {
    try {
        let pool = await sql.connect(config); //pool is the connection object
        return pool;
    } catch (err) {
        console.log(err);
    }
}

// Function to execute query that changes the database (INSERT, UPDATE, DELETE)

const executeQuery = async (query) => {
    try {
        let pool = await connect();
        let result = await pool.request().query(query);
        return result.rowsAffected > 0;
    } catch (err) {
        console.log(err);
    }
}

// Function to execute query that returns data

const getQuery = async (query) => {
    try {
        let pool = await connect();
        let result = await pool.request().query(query);
        return result.recordset;
    } catch (err) {
        console.log(err);
    }
}

module.exports = { executeQuery, getQuery };