const express = require('express');
const env = require('../config/enviroment');
const models = require('./models/models');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post("/actualizarEstadoBoleto", async (req, res) => {
    const { id_boleto, estado } = req.body;
    const boleto_recibido = { id_boleto, estado };
    let result = await models.boletosRepositorios.actualizarEstadoBoleto(boleto_recibido, estado);
    res.send(JSON.stringify(result));
})

app.post("/cancelarBoletosServicio" , async (req, res) => {
    const no_servicio = req.body;    
    let result = await models.boletosRepositorios.cancelarBoletosServicio(no_servicio);
    res.send(JSON.stringify(result));
})

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});