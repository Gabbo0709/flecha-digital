const express = require('express');
const env = require('../config/enviroment');
const keys = require('../config/keys');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//#region  Set up routes

app.post('/notificarActualizacion', async (req, res) => {

});

app.post('/notificarCancelacion', async (req, res) => {

});

app.post('/notificarUsoBoleto', async (req, res) => {

});

//#endregion


app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});