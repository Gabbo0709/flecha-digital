const express = require('express');
const env = require('../config/enviroment.js');
const models = require('../models');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post("/crearOperacion", async (req, res) => {
    let opearcion = new models.opearcion(req.body);
    let result = await models.reservasRepositorio.crearOperacion(operacion);
    res.send(result);
});

app.post("/crearBoleto", async (req, res) => {
    let boleto = req.body.map(b => new models.boleto(b));
    let result = await models.reservasRepositorio.crearBoleto(boleto);
    res.send(result);
});

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});