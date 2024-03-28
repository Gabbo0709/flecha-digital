const express = require('express');
const env = require('../config/enviroment.js');
const models = require('./models/models.js');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post("/actualizarEstadoBoleto", async (req, res) => {
    const { id_boleto, estado } = req.body;
    let result = await models.boletosRepositorios.actualizarEstadoBoleto(id_boleto, estado);
    res.send(JSON.stringify(result));
})

app.post("/cancelarBoletosServicio" , async (req, res) => {
    const { no_servicio } = req.query;
    let result = await models.boletosRepositorios.cancelarBoletosServicio(no_servicio);
    res.send(JSON.stringify(result));
})

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});