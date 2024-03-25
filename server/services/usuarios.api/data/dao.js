const mysql = require('mysql');

class Database {
    constructor(config) {
        this.connection = mysql.createConnection(config);
    }

    connect() {
        return new Promise((resolve, reject) => {
            this.connection.connect((error) => {
                if (error) {
                    reject(error);
                } else {
                    resolve();
                }
            });
        });
    }

    query(sql, params) {
        return new Promise((resolve, reject) => {
            this.connection.query(sql, params, (error, results) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(results);
                }
            });
        });
    }

    close() {
        return new Promise((resolve, reject) => {
            this.connection.end((error) => {
                if (error) {
                    reject(error);
                } else {
                    resolve();
                }
            });
        });
    }
}

module.exports = Database;