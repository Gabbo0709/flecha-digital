const express = require('express');
const env = require('./config/enviroment.js');
const models = require('./models/models.js');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.get("/buscarViajes", async(  req, res ) => {
    const {origen_ruta, origen_viaje, destino_ruta, destino_viaje} = req.query;
    let viaje = new models.viaje(
        origen_viaje,
        destino_viaje
    );
    let ruta = new models.ruta(
        origen_ruta,
        destino_ruta
    );
    let result = await models.viajesRepositorio.buscarViaje(ruta, viaje);
    res.send(result);
});

app.post("/actualizarViaje", async(  req, res ) => {
    const {no_servicio, tiempo} = req.body;
    const viaje = new models.viaje(no_servicio);
    let result = await models.viajesRepositorio.actualizarViaje(viaje, tiempo);
    res.send(result);
});


app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});