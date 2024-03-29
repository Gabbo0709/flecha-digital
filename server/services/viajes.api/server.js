const express = require('express');
const env = require('./config/enviroment');
const models = require('./models/models');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/buscarViajes", async(  req, res ) => {
    const {origen_viaje, destino_viaje} = req.query;
    const viaje_recibido = {
        origen_viaje,
        destino_viaje,
        fecha_salida
    };
    const viaje = new models.viaje(viaje_recibido);
    const result = await models.viajesRepositorios.buscarViaje(viaje);
    res.send(JSON.stringify(result));
});

app.get("/obtenerAsiento", async(  req, res ) => {
    const {origen_viaje, destino_viaje, no_servicio} = req.query;
    const viaje_recibido = {origen_viaje, destino_viaje, no_servicio};
    const viaje = new models.asiento(viaje_recibido);
    const result = await models.viajesRepositorios.obtenerAsiento(viaje);
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