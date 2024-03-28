const express = require('express');
const env = require('./config/enviroment.js');
const models = require('./models/models.js');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/buscarViajes", async(  req, res ) => {
    const {origen_viaje, destino_viaje} = req.query;
    const viaje_recibido = {
        origen_viaje,
        destino_viaje
    };
    const viaje = new models.viaje(viaje_recibido);
    result = await models.viajesRepositorios.buscarViaje(viaje);
    res.send(JSON.stringify(result));
});

app.get("/obtenerAsientos", async(  req, res ) => {
    const {id_camion} = req.query;
    const asiento_recibido = {id_camion};
    const asiento = new models.asiento(asiento_recibido);
    const result = await models.viajesRepositorios.obtenerAsiento(asiento);
    res.send(JSON.stringify(result));
});

app.post("/actualizarViaje", async(  req, res ) => {
    const {no_servicio, tiempo} = req.body;
    const viaje_recibido = {no_servicio};
    const viaje = new models.viaje(viaje_recibido);
    const result = await models.viajesRepositorios.actualizarViaje(viaje, tiempo);
    res.send(result);
});


app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});