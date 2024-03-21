const sqlConfig = {
    user: 'sa',
    password: 'password',
    database: 'test',
    server: 'localhost',
    pool : {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    },
    options: {
        encrypt: false, // for azure change this to true
        trustedConnection: true // change this according to your sql server configuration
    }
}

export default sqlConfig;