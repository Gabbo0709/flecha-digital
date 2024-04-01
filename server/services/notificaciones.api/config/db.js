const sqlConfig = {
    user: 'sa',
    password: 'gus',
    database: 'db_flecha',
    server: '192.168.1.6',
    pool : {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    },
    options: {
        encrypt: false, // para azure usar true
        trustedConnection: true // cambiar esto en función de la configuración de la base de datos
    }
}

module.exports = sqlConfig;