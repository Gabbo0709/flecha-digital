const sqlConfig = {
    user: 'sa',
    password: 'password',
    database: 'test',
    server: '192.168.100.11',
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

export default sqlConfig;